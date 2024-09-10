import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/edit_deadline_dialog.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/edit_partial_pay_dialog.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/edit_pay_all_dialog.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/views/operations/borrowing_view.dart';
import 'package:qarz_daftar/presentation/views/operations/lending_view.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/caller.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: BoxDecoration(
          color: context.color.contColor,
          border: Border(top: BorderSide(color: context.color.borderColor)),
        ),
        child: Row(
          children: [
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BorrowingView(images: []),
                  ));
                },
                height: 48,
                borderRadius: 8,
                color: Colors.transparent,
                border: Border.all(color: red),
                textColor: red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.hand.svg(),
                    const SizedBox(width: 4),
                    const Text("Borrowing")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LendingView(images: []),
                  ));
                },
                height: 48,
                borderRadius: 8,
                color: Colors.transparent,
                border: Border.all(color: mainBlue),
                textColor: mainBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.banknote.svg(),
                    const SizedBox(width: 4),
                    const Text("Lending")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.color.contColor,
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
                WButton(
                  height: 44,
                  width: 44,
                  onTap: () => Caller.makePhoneCall("+998990999192"),
                  child: AppIcons.phone.svg(color: white),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Active",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.color.contColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: WButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const Dialog(
                              insetPadding: EdgeInsets.all(16),
                              child: EditDeadlineDialog(),
                            ),
                          );
                        },
                        color: Colors.transparent,
                        border: Border.all(
                          color: context.color.white.withOpacity(.4),
                        ),
                        textColor: context.color.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.edit.svg(color: context.color.white),
                            const SizedBox(width: 8),
                            const Text("Edit deadline")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const Dialog(
                              insetPadding: EdgeInsets.all(16),
                              child: EditPartialPayDialog(),
                            ),
                          );
                        },
                        color: Colors.transparent,
                        border: Border.all(
                          color: context.color.white.withOpacity(.4),
                        ),
                        textColor: context.color.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.moneyClock.svg(color: context.color.white),
                            const SizedBox(width: 8),
                            const Text("Partial pay")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                WButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                        insetPadding: EdgeInsets.all(16),
                        child: EditPayAllDialog(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.leftPay.svg(),
                      const SizedBox(width: 8),
                      const Text("Pay all")
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "History",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DecoratedBox(
              decoration: BoxDecoration(
                color: context.color.contColor,
                borderRadius: index == 0
                    ? const BorderRadius.vertical(
                        top: Radius.circular(8),
                      )
                    : index == 4
                        ? const BorderRadius.vertical(
                            bottom: Radius.circular(8),
                          )
                        : null,
              ),
              child: const ListTile(
                title: Text(
                  "Jahongir Maqsudov",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "4 days left",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: red,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: backGroundColor,
                  child: Text(
                    "JB",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6E7781),
                    ),
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "863 000 uzs",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Borrowed",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
