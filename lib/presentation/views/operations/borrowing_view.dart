import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class BorrowingView extends StatefulWidget {
  const BorrowingView({
    super.key,
    required this.images,
  });
  final List<File> images;

  @override
  State<BorrowingView> createState() => _BorrowingViewState();
}

class _BorrowingViewState extends State<BorrowingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Borrowing")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: const BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: borderColor)),
        ),
        child: WButton(
          onTap: () {},
          color: red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.hand.svg(color: white),
              const SizedBox(width: 8),
              const Text("Confirm borrowing")
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 176,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: mainBlue.withOpacity(.2),
                          ),
                          alignment: Alignment.center,
                          child: const ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: white,
                            ),
                            title: Text("A’zamjon Ismoilov"),
                            subtitle: Text("+998 91 008 43 48"),
                            trailing: Text(
                              "Lender",
                              style: TextStyle(color: mainBlue),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: red.withOpacity(.2),
                          ),
                          alignment: Alignment.center,
                          child: const ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: white,
                            ),
                            title: Text("Jahongir Maqsudov"),
                            subtitle: Text("+998 91 008 43 48"),
                            trailing: Text(
                              "Borrower",
                              style: TextStyle(color: red),
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: WButton(
                        height: 48,
                        width: 48,
                        margin: const EdgeInsets.only(right: 16),
                        borderRadius: 80,
                        color: white,
                        border: Border.all(color: borderColor),
                        onTap: () {},
                        child: AppIcons.upDown.svg(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const InfoTileItam(
                title: 'Lent',
                subtitle: '1 034 000 UZS',
                icon: AppIcons.banknote,
                color: mainBlue,
              ),
              const SizedBox(height: 12),
              const InfoTileItam(
                title: 'Given at',
                subtitle: '18.07.2024 16:43',
                icon: AppIcons.calendar,
              ),
              const SizedBox(height: 12),
              const InfoTileItam(
                title: 'Deadline',
                subtitle: '18.08.2024',
                icon: AppIcons.secundomer,
                treling: '3 days left',
                colorTreling: black,
              ),
              const SizedBox(height: 12),
              const Text(
                "Phone",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Qarz berilishidan maqsad do’konimizdan iPhone 15 pro telefon modelini xarid qilishda yetmagan summani qoplash. O’zim rozi bo’lib beryapman, hech kim majburlamadi.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Photofact",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.images.isNotEmpty) ...[
                GridView.builder(
                  itemCount: widget.images.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(widget.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
