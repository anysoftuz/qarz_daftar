import 'package:flutter/material.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/deadline_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/formatters.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class EditDeadlineDialog extends StatefulWidget {
  const EditDeadlineDialog({
    super.key,
    required this.bloc,
    required this.model,
  });
  final UsersBloc bloc;
  final OperationModel model;

  @override
  State<EditDeadlineDialog> createState() => _EditDeadlineDialogState();
}

class _EditDeadlineDialogState extends State<EditDeadlineDialog> {
  ValueNotifier<bool> isBanned = ValueNotifier(false);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.color.contColor,
      ),
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Edit deadline",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: AppIcons.close.svg(),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                InfoTileItam(
                  title: AppLocalizations.of(context)!.deadline,
                  subtitle: MyFunction.dateFormat(widget.model.deadline),
                  icon: AppIcons.secundomer,
                  treling:
                      '${MyFunction.daysLeft(widget.model.deadline)} days left',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: AppLocalizations.of(context)!.newDeadline,
                  hintText: "29.02.2024",
                  fillColor: Colors.transparent,
                  suffixIcon: AppIcons.calendar.svg(),
                  keyboardType: TextInputType.datetime,
                  formatter: [Formatters.dateFormatter],
                  controller: controller,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2060),
                    ).then(
                      (value) {
                        if (value != null) {
                          controller.text =
                              MyFunction.dateFormatDate(value.toString());
                        }
                      },
                    );
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isBanned,
                      builder: (context, valu, __) {
                        return SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: valu,
                            onChanged: (value) {
                              isBanned.value = value ?? false;
                            },
                            activeColor: mainBlue,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.addToBlackList,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
            child: Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {},
                    border: Border.all(
                      color: context.color.borderColor,
                    ),
                    color: Colors.transparent,
                    textColor: context.color.white,
                    text: AppLocalizations.of(context)!.cancel,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WButton(
                    onTap: () {
                      widget.bloc.add(PostDeadlineEvent(
                        id: widget.model.id,
                        model: DeadlineModel(
                          deadline: controller.text,
                          isBlacklist: isBanned.value,
                        ),
                      ));
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                    },
                    text: AppLocalizations.of(context)!.save,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
