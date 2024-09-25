import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';

import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/formatters.dart';

class ConfirmationLoginView extends StatefulWidget {
  const ConfirmationLoginView({super.key});

  @override
  State<ConfirmationLoginView> createState() => _ConfirmationLoginViewState();
}

class _ConfirmationLoginViewState extends State<ConfirmationLoginView> {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return WButton(
              onTap: () {
                String phoneNumber = controllerPhone.text;
                phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

                if (!phoneNumber.startsWith("998")) {
                  phoneNumber = "998$phoneNumber";
                }

                context.read<AuthBloc>().add(SendCodeEvent(
                      phone: phoneNumber,
                      code: int.tryParse(controllerCode.text) ?? 0,
                      onError: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Telefon raqam yoki kodingiz hato kirgazilgan",
                            ),
                          ),
                        );
                      },
                      onSucces: (model) {},
                    ));
              },
              isDisabled: controllerCode.text.isEmpty ||
                  controllerPhone.text.length != 19,
              isLoading: state.statusCode.isInProgress,
              margin: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 16),
              text: "Тасдиқлаш",
            );
          },
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: const Color(0xFF102750),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppIcons.smsCode.svg(
                        height: 200,
                      ),
                    ),
                  ),
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      color: context.color.whiteSmoke,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                title: "Phone",
                hintText: "+998 (00) 000-00-00",
                keyboardType: TextInputType.phone,
                controller: controllerPhone,
                formatter: [Formatters.phoneFormatter],
                onChanged: (value) {
                  if (value.length >= 18) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "Verification code",
                hintText: "0000",
                controller: controllerCode,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
