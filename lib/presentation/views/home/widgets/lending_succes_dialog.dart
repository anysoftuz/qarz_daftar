import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class LendingSuccesDialog extends StatelessWidget {
  const LendingSuccesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
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
                    backgroundColor: mainBlue.withOpacity(.1),
                    child: AppIcons.succes.svg(),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: AppIcons.close.svg(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Successful",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Jahongir Maqsudovga 2 000 000 uzs muvaffaqiyatli o’tkazib berildi. Muddat 29.03.2024.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          WButton(
            onTap: () {
              context.go(AppRouteName.home);
            },
            text: "Go to main",
          ),
        ],
      ),
    );
  }
}
