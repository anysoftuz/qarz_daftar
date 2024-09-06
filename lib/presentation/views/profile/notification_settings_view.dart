import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class NotificationSettingsView extends StatefulWidget {
  const NotificationSettingsView({super.key});

  @override
  State<NotificationSettingsView> createState() =>
      _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView> {
  ValueNotifier<bool> value1 = ValueNotifier(true);
  ValueNotifier<bool> value2 = ValueNotifier(false);
  ValueNotifier<bool> value3 = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification settings")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "When daily employer confirmed the order",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: dark,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Let employers know you're looking for a job by enabling this feature.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ValueListenableBuilder(
                    valueListenable: value1,
                    builder: (context, value, __) {
                      return CupertinoSwitch(
                        value: value,
                        activeColor: mainBlue,
                        onChanged: (value) {
                          value1.value = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "When supervisor finished order",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: dark,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Let employers know you're looking for a job by enabling this feature.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ValueListenableBuilder(
                    valueListenable: value2,
                    builder: (context, value, __) {
                      return CupertinoSwitch(
                        value: value,
                        onChanged: (value) {
                          value2.value = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "When employee paused or don't started work on time",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: dark,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Let employers know you're looking for a job by enabling this feature.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ValueListenableBuilder(
                    valueListenable: value3,
                    builder: (context, value, __) {
                      return CupertinoSwitch(
                        value: value,
                        onChanged: (value) {
                          value3.value = value;
                        },
                      );
                    },
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
