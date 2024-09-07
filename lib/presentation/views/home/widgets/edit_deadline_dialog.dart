import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class EditDeadlineDialog extends StatelessWidget {
  const EditDeadlineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
      ),
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Edit deadline",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: AppIcons.close.svg(),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                const InfoTileItam(
                  title: 'Deadline',
                  subtitle: '18.08.2024',
                  icon: AppIcons.secundomer,
                  treling: '3 days left',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: "New deadline",
                  hintText: "29.02.2024",
                  suffixIcon: AppIcons.calendar.svg(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: mainBlue,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Add to blacklist",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
            child: Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {},
                    border: Border.all(
                      color: borderColor,
                    ),
                    color: white,
                    textColor: black,
                    text: "Cancel",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    text: "Save",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
