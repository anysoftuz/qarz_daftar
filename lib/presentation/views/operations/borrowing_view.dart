import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/home/post_operation_model.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/lending_succes_dialog.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class BorrowingView extends StatefulWidget {
  const BorrowingView({
    super.key,
    required this.images,
    required this.user,
    required this.isLending,
    required this.deadline,
    required this.description,
    required this.amount,
    required this.isBanned,
    required this.currency,
    required this.bloc,
  });
  final List<File> images;
  final Datum user;
  final bool isLending;
  final String deadline;
  final String description;
  final int amount;
  final bool isBanned;
  final String currency;
  final UsersBloc bloc;

  @override
  State<BorrowingView> createState() => _BorrowingViewState();
}

class _BorrowingViewState extends State<BorrowingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.borrowed)),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: BoxDecoration(
          color: context.color.contColor,
          border: Border(top: BorderSide(color: context.color.borderColor)),
        ),
        child: BlocBuilder<UsersBloc, UsersState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return WButton(
              onTap: () {
                widget.bloc.add(PosOperationsEvent(
                  model: PostOperationModel(
                    contractorId: widget.user.id,
                    contractorType: widget.isLending ? "lending" : "borrowing",
                    amount: widget.amount,
                    deadline: MyFunction.dateFormatLed(widget.deadline),
                    isBlacklist: widget.isBanned,
                    description: widget.description,
                    currency: widget.currency,
                  ),
                  onSucces: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        insetPadding: const EdgeInsets.all(16),
                        child: LendingSuccesDialog(
                          description:
                              '${widget.user.fullName} ${widget.amount} ${widget.currency} muvaffaqiyatli o’tkazib berildi. Muddat: ${widget.deadline}',
                        ),
                      ),
                    ).then(
                      (value) {
                        if (context.mounted) {
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        }
                      },
                    );
                  },
                ));
              },
              isLoading: state.status.isInProgress,
              color: red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.hand.svg(color: white),
                  const SizedBox(width: 8),
                  Text(AppLocalizations.of(context)!.confirm)
                ],
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.contColor,
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
                            color: mainBlue.withValues(alpha: .2),
                          ),
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: white,
                              backgroundImage: CachedNetworkImageProvider(
                                widget.user.avatar,
                              ),
                            ),
                            title: Text(widget.user.fullName),
                            subtitle: Text(widget.user.phone),
                            trailing: const Text(
                              "Lender",
                              style: TextStyle(color: mainBlue),
                            ),
                          ),
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: red.withValues(alpha: .2),
                              ),
                              alignment: Alignment.center,
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: white,
                                  backgroundImage: CachedNetworkImageProvider(
                                    state.usergetModel.avatar,
                                  ),
                                ),
                                title: Text(
                                  "${state.usergetModel.firstName} ${state.usergetModel.lastName}",
                                ),
                                subtitle: Text(state.usergetModel.phone),
                                trailing: const Text(
                                  "Borrower",
                                  style: TextStyle(color: red),
                                ),
                              ),
                            );
                          },
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
                        color: context.color.contColor,
                        border: Border.all(color: context.color.borderColor),
                        onTap: () {},
                        child: AppIcons.upDown.svg(color: context.color.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              InfoTileItam(
                title: AppLocalizations.of(context)!.borrowed,
                subtitle:
                    '${MyFunction.priceFormat(widget.amount)} ${widget.currency}',
                icon: AppIcons.hand,
                color: red,
              ),
              const SizedBox(height: 12),
              InfoTileItam(
                title: AppLocalizations.of(context)!.givenAt,
                subtitle: MyFunction.dateFormat(DateTime.now().toString()),
                icon: AppIcons.calendar,
              ),
              const SizedBox(height: 12),
              InfoTileItam(
                title: AppLocalizations.of(context)!.deadline,
                subtitle: MyFunction.dateFormat(widget.deadline),
                icon: AppIcons.secundomer,
                treling:
                    '${MyFunction.daysLeft(widget.deadline)} ${AppLocalizations.of(context)!.daysLeft}',
                colorTreling: context.color.white,
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.description,
                style: const TextStyle(
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
