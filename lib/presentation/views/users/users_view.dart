import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/views/users/user_profile_view.dart';
import 'package:qarz_daftar/presentation/views/users/users_filter_view.dart';
import 'package:qarz_daftar/presentation/widgets/commercial_tab.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.contColor,
      appBar: AppBar(
        title: const Text("List"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UsersFilterView(),
              ));
            },
            child: Row(
              children: [
                AppIcons.filter.svg(),
                const SizedBox(width: 4),
                const Text(
                  "Filter",
                  style: TextStyle(color: blue),
                ),
              ],
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CommercialTab(
                tabLabels: const [
                  "Active",
                  "History",
                  "Blacklist",
                  "Contacts",
                ],
                onTabTap: (int value) {},
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 5,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    itemBuilder: (context, index) => DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.color.borderColor,
                        borderRadius: index == 0
                            ? const BorderRadius.vertical(
                                top: Radius.circular(8),
                              )
                            : index == 4
                                ? const BorderRadius.vertical(
                                    bottom: Radius.circular(8),
                                  )
                                : null,
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserProfileView(),
                          ));
                        },
                        title: const Text(
                          "Jahongir Maqsudov",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: const Text(
                          "4 days left",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: red,
                          ),
                        ),
                        leading: const CircleAvatar(
                          radius: 24,
                          backgroundColor: backGroundColor,
                          child: Text(
                            "JB",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6E7781),
                            ),
                          ),
                        ),
                        trailing: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "863 000 uzs",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Borrowed",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 16,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    itemBuilder: (context, index) => DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.color.borderColor,
                        borderRadius: index == 0
                            ? const BorderRadius.vertical(
                                top: Radius.circular(8),
                              )
                            : index == 4
                                ? const BorderRadius.vertical(
                                    bottom: Radius.circular(8),
                                  )
                                : null,
                      ),
                      child: const ListTile(
                        title: Text(
                          "Jahongir Maqsudov",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "4 days left",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: red,
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: backGroundColor,
                          child: Text(
                            "JB",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6E7781),
                            ),
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "863 000 uzs",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Borrowed",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16).copyWith(top: 0),
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Search",
                          fillColor: context.color.borderColor,
                          prefixIcon: AppIcons.search.svg(),
                          onChanged: (String value) {},
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemBuilder: (context, index) => DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: context.color.borderColor,
                              ),
                              child: ListTile(
                                leading: const CircleAvatar(radius: 24),
                                title: const Text(
                                  "Jahongir Maqsudov",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: const Text(
                                  "Banned",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: red,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppIcons.star.svg(),
                                    const SizedBox(width: 4),
                                    const Text("0")
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
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
                                leading: const CircleAvatar(radius: 24),
                                title: const Text(
                                  "Jahongir Maqsudov",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: const Text("+998 91 230 00 23"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppIcons.star.svg(),
                                    const SizedBox(width: 4),
                                    const Text("129")
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
