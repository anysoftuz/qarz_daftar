import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class OperationsView extends StatefulWidget {
  const OperationsView({super.key});

  @override
  State<OperationsView> createState() => _OperationsViewState();
}

class _OperationsViewState extends State<OperationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operation"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: const BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: borderColor)),
        ),
        child: Row(
          children: [
            Expanded(
              child: WButton(
                onTap: () {},
                height: 48,
                borderRadius: 8,
                color: white,
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
                onTap: () {},
                height: 48,
                borderRadius: 8,
                color: white,
                border: Border.all(color: green),
                textColor: green,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                title: "Phone number",
                hintText: "+998",
                prefixIcon: AppIcons.phone.svg(),
                suffixIcon: AppIcons.calendar.svg(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "Loan amount",
                hintText: "0.00",
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "Deadline",
                hintText: "29.02.2024",
                prefixIcon: AppIcons.calendar.svg(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "The purpose of the loan",
                hintText: "Type description...",
                noHeight: true,
                maxLines: 6,
                minLines: 5,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
