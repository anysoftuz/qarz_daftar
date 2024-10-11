import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/views/auth/telegram_auth.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';

import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/extensions.dart';
import 'package:qarz_daftar/utils/formatters.dart';
import 'package:qarz_daftar/utils/log_service.dart';

final TelegramLogin telegramLogin = TelegramLogin(
  "7578089863:AAEYQXaO8gi2awhCy7ZmkrCw1ghUsmALIm0",
  "https://backend.qarzdaftar.com/v1/auth/telegram",
);

class ConfirmationLoginView extends StatefulWidget {
  const ConfirmationLoginView({super.key});

  @override
  State<ConfirmationLoginView> createState() => _ConfirmationLoginViewState();
}

class _ConfirmationLoginViewState extends State<ConfirmationLoginView> {
  TextEditingController controllerPhone = TextEditingController();
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return WButton(
              onTap: () async {
                String phoneNumber = controllerPhone.text;
                phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

                if (!phoneNumber.startsWith("998")) {
                  phoneNumber = "998$phoneNumber";
                }

                if (isCheck) {
                  final isLogin =
                      await telegramLogin.loginTelegram(phoneNumber);
                  if (isLogin) {
                    await telegramLogin.telegramLaunch();
                    setState(() {
                      isCheck = false;
                    });
                  } else {
                    context.showSnackBar(
                      message: "User topilmadi nomerni tekshiring",
                    );
                  }
                } else {
                  var success = await telegramLogin.checkLogin();
                  print(success);
                  var data = await telegramLogin.getData();

                  if (data) {
                    Log.e(telegramLogin.userData);
                    context.read<AuthBloc>().add(SendCodeEvent(
                          phone: phoneNumber,
                          code: int.tryParse(
                                telegramLogin.userData["id"].toString(),
                              ) ??
                              0,
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
                  } else {
                    context.showSnackBar(
                      message: "Iltimos Telegramda kirishga ruxsat bering",
                    );
                  }
                }
              },
              isDisabled: controllerPhone.text.length != 19,
              isLoading: state.statusCode.isInProgress,
              margin: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 16),
              text: isCheck ? "Тасдиқлаш" : "Kirish",
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
              const SizedBox(height: 12),
              const Text(
                "Kirish uchun telegramda kirishga ruxsat berishingiz kerak aks holda kira olmaysiz",
              )
            ],
          ),
        ),
      ),
    );
  }
}
