import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class EditPartialPayDialog extends StatelessWidget {
  const EditPartialPayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.color.contColor,
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
                  "Partial pay",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: AppIcons.close.svg(color: context.color.white),
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
                CustomTextField(
                  title: "Amount",
                  hintText: "0.0",
                  suffixIcon: const Text("UZS"),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: "Note",
                  hintText: "",
                  maxLines: 5,
                  minLines: 4,
                  noHeight: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
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
                      color: context.color.borderColor,
                    ),
                    color: Colors.transparent,
                    textColor: context.color.white,
                    text: "Cancel",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    text: "Pay",
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
