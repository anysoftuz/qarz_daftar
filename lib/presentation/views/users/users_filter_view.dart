import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/formatters.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class UsersFilterView extends StatefulWidget {
  const UsersFilterView({super.key});

  @override
  State<UsersFilterView> createState() => _UsersFilterViewState();
}

class _UsersFilterViewState extends State<UsersFilterView> {
  ValueNotifier<int> index = ValueNotifier(-1);
  ValueNotifier<bool> isUZS = ValueNotifier(true);
  DateTime dateTime = DateTime.now();
  TextEditingController controllerAmout = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.filter)),
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
              ValueListenableBuilder(
                valueListenable: index,
                builder: (context, value, __) {
                  return Row(
                    children: [
                      Expanded(
                        child: WButton(
                          onTap: () {
                            if (value == 0) {
                              index.value = -1;
                            } else {
                              index.value = 0;
                            }
                          },
                          color: context.color.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          border:
                              Border.all(color: value == 0 ? mainBlue : grey),
                          child: Row(
                            children: [
                              value == 0
                                  ? AppIcons.checkboxRadioActive.svg()
                                  : AppIcons.checkboxRadio.svg(),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.loanGiven,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: context.color.darkText,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: WButton(
                          onTap: () {
                            if (value == 1) {
                              index.value = -1;
                            } else {
                              index.value = 1;
                            }
                          },
                          color: context.color.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          border:
                              Border.all(color: value == 1 ? mainBlue : grey),
                          child: Row(
                            children: [
                              value == 1
                                  ? AppIcons.checkboxRadioActive.svg()
                                  : AppIcons.checkboxRadio.svg(),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.loansTaken,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: context.color.darkText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                title: AppLocalizations.of(context)!.date,
                hintText: "29.02.2024",
                controller: controllerDate,
                fillColor: Colors.transparent,
                keyboardType: TextInputType.datetime,
                formatter: [Formatters.dateFormatter],
                suffixIcon: AppIcons.calendar.svg(color: context.color.white),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2060),
                  ).then(
                    (value) {
                      if (value != null) {
                        dateTime = value;
                        controllerDate.text =
                            MyFunction.dateFormatDate(value.toString());
                      }
                    },
                  );
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              ValueListenableBuilder(
                valueListenable: isUZS,
                builder: (context, value, __) {
                  return CustomTextField(
                    title: AppLocalizations.of(context)!.loanAmount,
                    hintText: "0.00",
                    fillColor: Colors.transparent,
                    suffixIcon: Text(value ? "UZS" : "USD"),
                    onsuffixIconPressed: () {
                      isUZS.value = !value;
                    },
                    controller: controllerAmout,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
