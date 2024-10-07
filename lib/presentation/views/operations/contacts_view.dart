import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/common/presentation/paginator_list.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/views/users/add_contact_view.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/debounce.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetContactsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          TextButton(
            onPressed: () {
              final block = context.read<UsersBloc>();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddContactView(bloc: block),
              ));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.add,
                  color: mainBlue,
                ),
                Text(
                  "Add new",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: mainBlue,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: "Search",
                  fillColor: context.color.borderColor,
                  prefixIcon: AppIcons.search.svg(),
                  onChanged: (value) {
                    onDebounce(() {
                      context
                          .read<UsersBloc>()
                          .add(GetContactsEvent(search: value));
                    });
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: state.status.isInProgress
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : RefreshIndicator.adaptive(
                          onRefresh: () async {
                            context.read<UsersBloc>().add(GetContactsEvent());
                            await Future.delayed(const Duration(seconds: 1));
                          },
                          child: PaginatorList(
                            fetchMoreFunction: () {
                              context
                                  .read<UsersBloc>()
                                  .add(GetContactsEvent(isMore: true));
                            },
                            hasMoreToFetch: state.contacts.length <
                                state.contactsModel.totalCount,
                            paginatorStatus: state.status,
                            padding: const EdgeInsets.only(bottom: 100),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.pop(state.contacts[index]);
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: context.color.borderColor,
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 24,
                                    backgroundImage: CachedNetworkImageProvider(
                                      state.contacts[index].avatar,
                                    ),
                                  ),
                                  title: Text(
                                    state.contacts[index].fullName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(state.contacts[index].phone),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppIcons.star.svg(),
                                      const SizedBox(width: 4),
                                      Text(
                                        state.contacts[index].score.toString(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: state.contacts.length,
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
