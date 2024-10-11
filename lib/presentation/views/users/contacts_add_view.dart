import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/phons_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/views/users/add_contact_view.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/log_service.dart';

class ContactsAddView extends StatefulWidget {
  const ContactsAddView({super.key});

  @override
  State<ContactsAddView> createState() => _ContactsAddViewState();
}

class _ContactsAddViewState extends State<ContactsAddView> {
  List<Contact>? _contacts;

  List<Contact> filteredPeople = [];
  bool _permissionDenied = false;
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
      setState(() => _permissionDenied = true);
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

      setState(() => _contacts = contacts);
    }
    if (mounted) {
      context.read<UsersBloc>().add(PostContactsEvent(model: phones));
    }
  }

  void filterPeople() {
    String searchText = searchController.text.toLowerCase();
    setState(() {
      filteredPeople = _contacts!.where((person) {
        return person.displayName.toLowerCase().contains(searchText) ||
            person.phones.first.number.contains(searchText);
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
                hintText: "Search",
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: mainBlue),
                      Text(
                        "Add new contact",
                        style: TextStyle(color: mainBlue),
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
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemBuilder: (context, index) => DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.color.borderColor,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: CachedNetworkImageProvider(
                            state.contactsModel.data[index].avatar,
                          ),
                        ),
                        title: Text(
                          state.contactsModel.data[index].fullName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(state.contactsModel.data[index].phone),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppIcons.star.svg(),
                            const SizedBox(width: 4),
                            Text(
                              state.contactsModel.data[index].score.toString(),
                            )
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: state.contactsModel.data.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _body(List<Datum> data) {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final contacts =
        searchController.text.isNotEmpty ? filteredPeople : _contacts;
    return ListView.builder(
      itemCount: contacts?.length ?? 0,
      itemBuilder: (context, i) => ListTile(
        onTap: () {
          Log.e(contacts[i]);
        },
        leading: CircleAvatar(
          backgroundImage: contacts![i].photo != null
              ? MemoryImage(contacts[i].photo!)
              : null,
        ),
        title: Text(contacts[i].displayName),
        subtitle: Text(
          contacts[i].phones.isNotEmpty
              ? contacts[i].phones.first.number
              : '(none)',
        ),
      ),
    );
  }
}
