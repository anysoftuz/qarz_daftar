import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/data/models/users/transaction_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class EditPartialPayDialog extends StatefulWidget {
  const EditPartialPayDialog({
    super.key,
    required this.bloc,
    required this.model,
  });
  final UsersBloc bloc;
  final OperationModel model;

  @override
  State<EditPartialPayDialog> createState() => _EditPartialPayDialogState();
}

class _EditPartialPayDialogState extends State<EditPartialPayDialog> {
  TextEditingController controllerAmout = TextEditingController();
  TextEditingController controllerDescript = TextEditingController();
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
                Text(
                  AppLocalizations.of(context)!.partialPay,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: AppIcons.close.svg(color: context.color.white),
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
                CustomTextField(
                  title: "Amount",
                  hintText: "0.0",
                  controller: controllerAmout,
                  keyboardType: TextInputType.number,
                  suffixIcon: Text(widget.model.currency.toUpperCase()),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: AppLocalizations.of(context)!.description,
                  hintText: "",
                  maxLines: 5,
                  minLines: 4,
                  controller: controllerDescript,
                  noHeight: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
            child: Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                  child: BlocBuilder<UsersBloc, UsersState>(
                    bloc: widget.bloc,
                    builder: (context, state) {
                      return WButton(
                        onTap: () {
                          widget.bloc.add(PostTransactionsEvent(
                            id: widget.model.id,
                            model: TransactionModel(
                              amount: int.tryParse(controllerAmout.text) ?? 0,
                              note: controllerDescript.text,
                              type: "partial-pay",
                            ),
                            onSucces: () {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                          ));
                        },
                        text: AppLocalizations.of(context)!.pay,
                        isLoading: state.status.isInProgress,
                      );
                    },
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
