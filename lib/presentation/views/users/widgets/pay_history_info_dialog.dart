import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class PayHistoryInfoDialog extends StatelessWidget {
  const PayHistoryInfoDialog({super.key});

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
            height: 56,
            width: double.infinity,
            child: Stack(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: mainBlue,
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eldor Shomurodov",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "+998 91 008 43 48",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: greyText,
                          ),
                        )
                      ],
                    )
                  ],
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
          RichText(
            text: TextSpan(
              text: 'Qarz berilgan sana: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.color.white,
              ),
              children: [
                TextSpan(
                  text: '01.02.2023',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.color.white,
                  ),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Qarz qaytarilgan sana: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.color.white,
              ),
              children: [
                TextSpan(
                  text: '25.02.2023',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.color.white,
                  ),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Qarz miqdori: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.color.white,
              ),
              children: [
                TextSpan(
                  text: '863 000 uzs',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.color.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.color.borderColor,
            ),
            child: const Text(
              "Qarz berilishidan maqsad do’konimizdan iPhone 15 pro telefon modelini xarid qilishda yetmagan summani qoplash. O’zim rozi bo’lib beryapman, hech kim majburlamadi.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: greyText,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
