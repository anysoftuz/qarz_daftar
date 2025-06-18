import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class PayHistoryInfoDialog extends StatefulWidget {
  const PayHistoryInfoDialog({
    super.key,
    this.model = const NotificationModel(),
    required this.bloc,
  });
  final NotificationModel model;
  final UsersBloc bloc;

  @override
  State<PayHistoryInfoDialog> createState() => _PayHistoryInfoDialogState();
}

class _PayHistoryInfoDialogState extends State<PayHistoryInfoDialog> {
  ValueNotifier<int> valueNotifier = ValueNotifier(-1);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      bloc: widget.bloc,
      builder: (context, state) {
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
                height: 56,
                width: double.infinity,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: mainBlue,
                          backgroundImage:
                              CachedNetworkImageProvider(widget.model.avatar),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.senderFullName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "__",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: greyText,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: AppIcons.close.svg(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.color.borderColor,
                ),
                child: Text(
                  widget.model.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              if (widget.model.confirmStatus == "closed")
                WButton(
                  onTap: () {},
                  height: 36,
                  disabledColor: grey,
                  isDisabled: true,
                  text: "Closed",
                )
              else if (widget.model.confirmStatus == "refusal")
                WButton(
                  onTap: () {},
                  height: 36,
                  disabledColor: grey,
                  isDisabled: true,
                  text: "Refuse",
                )
              else if (widget.model.confirmStatus != "active" &&
                  widget.model.confirmStatus != "confirm")
                ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, __) {
                    return Row(
                      children: [
                        Expanded(
                          child: WButton(
                            height: 36,
                            onTap: () {
                              valueNotifier.value = widget.model.id;
                              if (widget.model.itemType == "operations") {
                                widget.bloc.add(
                                    PostRefusalEvent(id: widget.model.itemId));
                              } else {
                                widget.bloc.add(PatchTransactionRefEvent(
                                    id: widget.model.itemId));
                              }
                              Navigator.pop(context);
                            },
                            border: Border.all(
                                color:
                                    context.color.white.withValues(alpha: .2)),
                            textColor: context.color.white,
                            color: Colors.transparent,
                            isLoading: state.notifRefus.isInProgress &&
                                value == widget.model.id,
                            text: "Refuse",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: WButton(
                            height: 36,
                            isLoading: state.notifConfirm.isInProgress &&
                                value == widget.model.id,
                            onTap: () {
                              valueNotifier.value = widget.model.id;
                              if (widget.model.itemType == "operations") {
                                widget.bloc.add(
                                    PostConfirmEvent(id: widget.model.itemId));
                              } else {
                                widget.bloc.add(PatchTransactionConfirmEvent(
                                    id: widget.model.itemId));
                              }
                              Navigator.pop(context);
                            },
                            text: "Confirm",
                          ),
                        )
                      ],
                    );
                  },
                )
              else
                WButton(
                  onTap: () {},
                  height: 36,
                  disabledColor: grey,
                  isDisabled: true,
                  text: "Confirmed",
                )
            ],
          ),
        );
      },
    );
  }
}
