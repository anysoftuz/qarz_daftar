import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class ContactsAddView extends StatefulWidget {
  const ContactsAddView({super.key});

  @override
  State<ContactsAddView> createState() => _ContactsAddViewState();
}

class _ContactsAddViewState extends State<ContactsAddView> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetContactsEvent());
    super.initState();
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
                onChanged: (String value) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {},
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
            ],
          ),
        );
      },
    );
  }
}