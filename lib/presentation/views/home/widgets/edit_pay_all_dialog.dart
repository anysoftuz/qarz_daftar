import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class EditPayAllDialog extends StatelessWidget {
  const EditPayAllDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.color.contColor,
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: orang.withOpacity(.1),
                    child: AppIcons.question.svg(),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: AppIcons.close.svg(color: context.color.white50),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Want to pay all?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur amet labore.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          WButton(
            onTap: () {},
            text: "Pay all",
            color: orang,
          ),
          const SizedBox(height: 12),
          WButton(
            onTap: () {},
            border: Border.all(
              color: context.color.borderColor,
            ),
            color: Colors.transparent,
            textColor: context.color.white,
            text: "Cancel",
          ),
        ],
      ),
    );
  }
}
