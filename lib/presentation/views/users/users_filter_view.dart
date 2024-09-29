import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class UsersFilterView extends StatefulWidget {
  const UsersFilterView({super.key});

  @override
  State<UsersFilterView> createState() => _UsersFilterViewState();
}

class _UsersFilterViewState extends State<UsersFilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filter")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.contColor,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [],
              ),
              const SizedBox(height: 12),
              CustomTextField(
                title: "Date",
                hintText: "29.02.2024",
                fillColor: Colors.transparent,
                suffixIcon: AppIcons.calendar.svg(color: context.color.white),
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              CustomTextField(
                title: "Loan amount",
                hintText: "0.00",
                fillColor: Colors.transparent,
                prefixIcon: const Text("\$"),
                suffixIcon: const Text("USD"),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
