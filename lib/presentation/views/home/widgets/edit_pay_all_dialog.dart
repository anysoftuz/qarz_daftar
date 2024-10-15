import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/data/models/users/transaction_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class EditPayAllDialog extends StatelessWidget {
  const EditPayAllDialog({
    super.key,
    required this.bloc,
    required this.model,
  });
  final UsersBloc bloc;
  final OperationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.color.contColor,
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: orang.withOpacity(.1),
                    child: AppIcons.question.svg(),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: AppIcons.close.svg(color: context.color.white50),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.wantToPayAll,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.info_pay,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          BlocBuilder<UsersBloc, UsersState>(
            bloc: bloc,
            builder: (context, state) {
              return WButton(
                onTap: () {
                  bloc.add(PostTransactionsEvent(
                    id: model.id,
                    model: TransactionModel(
                      amount: model.amount,
                      type: "pay-all",
                      note: "Rahmat",
                    ),
                    onSucces: () {
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                    },
                  ));
                },
                text: AppLocalizations.of(context)!.payAll,
                color: orang,
                isLoading: state.status.isInProgress,
              );
            },
          ),
          const SizedBox(height: 12),
          WButton(
            onTap: () {},
            border: Border.all(
              color: context.color.borderColor,
            ),
            color: Colors.transparent,
            textColor: context.color.white,
            text: AppLocalizations.of(context)!.cancel,
          ),
        ],
      ),
    );
  }
}
