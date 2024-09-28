import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  ValueNotifier<int> valueNotifier = ValueNotifier(-1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state.notificationStatus.isInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<UsersBloc>().add(GetNotificationEvent());
              await Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.separated(
              itemCount: state.notification.length,
              padding: const EdgeInsets.all(16).copyWith(bottom: 108),
              separatorBuilder: (context, index) => const Divider(height: 32),
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: CachedNetworkImageProvider(
                      state.notification[index].avatar,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.notification[index].senderFullName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.notification[index].description,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: context.color.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (state.notification[index].confirmStatus != "active")
                          ValueListenableBuilder(
                            valueListenable: valueNotifier,
                            builder: (context, value, __) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: WButton(
                                      height: 36,
                                      onTap: () {
                                        valueNotifier.value =
                                            state.notification[index].id;
                                        if (state
                                                .notification[index].itemType ==
                                            "operations") {
                                          context.read<UsersBloc>().add(
                                              PostRefusalEvent(
                                                  id: state.notification[index]
                                                      .itemId));
                                        } else {
                                          context.read<UsersBloc>().add(
                                              PatchTransactionRefEvent(
                                                  id: state.notification[index]
                                                      .itemId));
                                        }
                                      },
                                      border: Border.all(
                                          color: context.color.white
                                              .withOpacity(.2)),
                                      textColor: context.color.white,
                                      color: Colors.transparent,
                                      isLoading: state
                                              .notifRefus.isInProgress &&
                                          value == state.notification[index].id,
                                      text: "Refuse",
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: WButton(
                                      height: 36,
                                      isLoading: state
                                              .notifConfirm.isInProgress &&
                                          value == state.notification[index].id,
                                      onTap: () {
                                        valueNotifier.value =
                                            state.notification[index].id;
                                        if (state
                                                .notification[index].itemType ==
                                            "operations") {
                                          context.read<UsersBloc>().add(
                                              PostConfirmEvent(
                                                  id: state.notification[index]
                                                      .itemId));
                                        } else {
                                          context.read<UsersBloc>().add(
                                              PatchTransactionConfirmEvent(
                                                  id: state.notification[index]
                                                      .itemId));
                                        }
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
