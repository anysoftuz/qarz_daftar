import 'package:flutter/material.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class InfoTileItam extends StatelessWidget {
  const InfoTileItam({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.treling = "",
    this.color = black,
    this.colorTreling = red,
  });
  final String title;
  final String subtitle;
  final String icon;
  final String treling;
  final Color color;
  final Color colorTreling;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  icon.svg(height: 20, color: color),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ],
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: dark,
                ),
              ),
            ],
          ),
        ),
        Text(
          treling,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colorTreling,
          ),
        ),
      ],
    );
  }
}
