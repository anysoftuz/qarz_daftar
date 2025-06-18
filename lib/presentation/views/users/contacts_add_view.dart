import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/phons_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/operations/operations_view.dart';
import 'package:qarz_daftar/presentation/views/users/add_contact_view.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/caller.dart';

class ContactsAddView extends StatefulWidget {
  const ContactsAddView({super.key});

  @override
  State<ContactsAddView> createState() => _ContactsAddViewState();
}

class _ContactsAddViewState extends State<ContactsAddView> {
  List<Datum> filteredPeople = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<UsersBloc>().add(GetContactsEvent());
    super.initState();
    _fetchContacts();
    searchController.addListener(() {
      filterPeople();
    });
  }

  Future _fetchContacts() async {
    List<PhonsModel> phones = [];
    if (!await FlutterContacts.requestPermission(readonly: true)) {
    } else {
      final contacts = await FlutterContacts.getContacts();
      for (var i = 0; i < contacts.length; i++) {
        final fullContact = await FlutterContacts.getContact(contacts[i].id);
        contacts[i] = fullContact ?? contacts[i];
        String phoneNumber = contacts[i].phones.isEmpty
            ? '998999999999'
            : contacts[i].phones.first.number;
        phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

        if (!phoneNumber.startsWith("998")) {
          phoneNumber = "998$phoneNumber";
        }
        phones.add(PhonsModel(
          phone: phoneNumber,
          fullName: contacts[i].displayName,
        ));
      }
    }
    if (mounted) {
      context.read<UsersBloc>().add(PostContactsEvent(model: phones));
    }
  }

  void filterPeople() {
    String searchText = searchController.text.toLowerCase();
    setState(() {
      filteredPeople =
          context.read<UsersBloc>().state.contactsModel.data.where((person) {
        return person.fullName.toLowerCase().contains(searchText) ||
            person.phone.contains(searchText);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: AppLocalizations.of(context)!.search,
                fillColor: context.color.borderColor,
                prefixIcon: AppIcons.search.svg(),
                controller: searchController,
                onChanged: (String value) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    final block = context.read<UsersBloc>();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddContactView(bloc: block),
                    ));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, color: mainBlue),
                      Text(
                        AppLocalizations.of(context)!.addNew,
                        style: const TextStyle(color: mainBlue),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator.adaptive(
                  onRefresh: () async {
                    context.read<UsersBloc>().add(GetContactsEvent());
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  child: Builder(builder: (context) {
                    // if (_permissionDenied) {
                    //   return const Center(child: Text('Kirishga ruhsat berilamgan'));
                    // }
                    // if (_contacts == null) {
                    //   return const Center(child: CircularProgressIndicator());
                    // }

                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemBuilder: (context, index) {
                        final model = searchController.text.isEmpty
                            ? state.contactsModel.data
                            : filteredPeople;
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.color.borderColor,
                          ),
                          child: ListTile(
                            onTap: () {
                              if (context
                                  .read<AuthBloc>()
                                  .state
                                  .usergetModel
                                  .phone
                                  .isEmpty) {
                                Caller.launchUrlWeb(
                                  "https://t.me/qarz_daftar1_bot",
                                ).whenComplete(
                                  () {
                                    if (context.mounted) {
                                      context
                                          .read<AuthBloc>()
                                          .add(GetMeEvent());
                                    }
                                  },
                                );
                              } else if (context
                                      .read<AuthBloc>()
                                      .state
                                      .usergetModel
                                      .phone ==
                                  model[index].phone) {
                                context.go(AppRouteName.profile);
                              } else {
                                final bloc = context.read<UsersBloc>();
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                    value: bloc,
                                    child: OperationsView(
                                      user: model[index],
                                    ),
                                  ),
                                ));
                                // context.push(AppRouteName.operation, extra: bloc);
                              }
                            },
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundImage: CachedNetworkImageProvider(
                                model[index].avatar,
                              ),
                            ),
                            title: Text(
                              model[index].fullName,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(model[index].phone),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppIcons.star.svg(),
                                const SizedBox(width: 4),
                                Text(
                                  model[index].score.toString(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: searchController.text.isEmpty
                          ? state.contactsModel.data.length
                          : filteredPeople.length,
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
