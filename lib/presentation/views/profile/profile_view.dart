import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                AppIcons.logout.svg(color: red),
                const SizedBox(width: 4),
                const Text(
                  "Log out",
                  style: TextStyle(color: red),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12).copyWith(right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: Row(
                children: [
                  const CircleAvatar(radius: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jahongir Maqsudov",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            AppIcons.star.svg(),
                            const SizedBox(width: 4),
                            const Text(
                              "1380",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(AppRouteName.profileInfo);
                    },
                    icon: AppIcons.edit.svg(),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                "Loans given",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: mainBlue,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '3 749 000',
                      style: TextStyle(
                        color: dark,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' UZS',
                          style: TextStyle(
                            color: gray,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      text: '3 000',
                      style: TextStyle(
                        color: dark,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' UZS',
                          style: TextStyle(
                            color: gray,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                "Loans taken",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: red,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '3 749 000',
                      style: TextStyle(
                        color: dark,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' UZS',
                          style: TextStyle(
                            color: gray,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      text: '3 000',
                      style: TextStyle(
                        color: dark,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' UZS',
                          style: TextStyle(
                            color: gray,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: ListTile(
                onTap: () {
                  context.push(AppRouteName.settings);
                },
                leading: AppIcons.settings.svg(),
                title: const Text("Settings"),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                trailing: AppIcons.arrowRight.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
