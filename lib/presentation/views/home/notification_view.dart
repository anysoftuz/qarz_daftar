import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.separated(
        itemCount: 4,
        padding: const EdgeInsets.all(16).copyWith(bottom: 108),
        separatorBuilder: (context, index) => const Divider(height: 32),
        itemBuilder: (context, index) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Ibragimov Jaloliddin",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      text: 'Sizga',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: dark,
                      ),
                      children: [
                        TextSpan(
                          text: ' 2 430 000 uzs ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: mainBlue,
                          ),
                        ),
                        TextSpan(
                          text: "ni qaytarib berdi.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: dark,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: WButton(
                          height: 36,
                          onTap: () {},
                          border: Border.all(color: borderColor),
                          textColor: dark,
                          color: white,
                          text: "Refuse",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: WButton(
                          height: 36,
                          onTap: () {},
                          text: "Confirm",
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
