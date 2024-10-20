import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/operations/operations_view.dart';
import 'package:qarz_daftar/presentation/views/users/user_profile_view.dart';
import 'package:qarz_daftar/presentation/views/users/widgets/pay_history_info_dialog.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/caller.dart';
import 'package:qarz_daftar/utils/log_service.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void connectionSoket() {
    String authToken = StorageRepository.getString(StorageKeys.TOKEN);
    Log.e(authToken);
    // Initialize the socket connection with query parameters
    IO.Socket socket = IO.io(
      'ws://138.68.80.51:3000/ws',
      IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          {'authorization': authToken}).build(),
    );

    // Handle connection events
    socket.onConnect((_) {
      print('Connected');
    });

    socket.onConnectError((data) {
      print('Connection Error: $data');
    });

    socket.onError((data) {
      print('Error: $data');
    });

    socket.onDisconnect((_) {
      socket = IO.io(
        'ws://138.68.80.51:3000/ws',
        IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
            {'authorization': authToken}).build(),
      );
    });
   
    // Listen for events
    socket.on('notifications', (data) {
      if (data != null) {
        final bloc = context.read<UsersBloc>();
        showDialog(
          context: context,
          builder: (context) => Dialog(
            insetPadding: const EdgeInsets.all(16),
            child: PayHistoryInfoDialog(
              model: NotificationModel.fromJson(data),
              bloc: bloc,
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    context.read<UsersBloc>().add(GetOperationsEvent());
    context.read<UsersBloc>().add(GetGivenAmountEvent());
    context.read<UsersBloc>().add(GetTakenAmountEvent());
    context.read<UsersBloc>().add(GetPopularEvent());
    context.read<UsersBloc>().add(GetNotificationEvent(
          onSucces: (List<NotificationModel> notification) {},
        ));
    super.initState();
    connectionSoket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102750),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: CustomTextField(
                  fillColor: dark.withOpacity(.2),
                  prefixIcon: AppIcons.search.svg(color: white),
                  hintText: AppLocalizations.of(context)!.search,
                  hintTextColor: white,
                  borderColor: Colors.transparent,
                  borderRadius: 48,
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
                collapsedHeight: 64,
                pinned: true,
                forceMaterialTransparency: true,
                flexibleSpace: const FlexibleSpaceBar(
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF102750),
                      // gradient: LinearGradient(
                      //   colors: <Color>[
                      //     Color(0xff0969DA),
                      //     Color(0xff1E3197),
                      //   ],
                      // ),
                    ),
                  ),
                ),
                actions: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: dark.withOpacity(.2),
                    child: badges.Badge(
                      showBadge:
                          MyFunction.notificationLeng(state.notification) > 0,
                      badgeContent: Text(
                        "${MyFunction.notificationLeng(state.notification)}",
                        style: const TextStyle(color: white),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.push(AppRouteName.notification);
                        },
                        icon: AppIcons.notification.svg(
                          color: white,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16)
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, bottom: 8),
                                  child: Row(
                                    children: [
                                      AppIcons.banknote.svg(),
                                      const SizedBox(width: 8),
                                      Text(
                                        AppLocalizations.of(context)!.lent,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: mainBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (state.takenAmount.isEmpty)
                                  RichText(
                                    text: TextSpan(
                                      text: "0",
                                      style: const TextStyle(
                                        color: white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' UZS',
                                          style: TextStyle(
                                            color: white.withOpacity(.4),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                else
                                  ...List.generate(
                                    state.takenAmount.length,
                                    (index) => RichText(
                                      text: TextSpan(
                                        text: MyFunction.priceFormat(
                                            int.tryParse(state
                                                    .takenAmount[index]
                                                    .amount) ??
                                                0),
                                        style: const TextStyle(
                                          color: white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                ' ${state.takenAmount[index].currency.toUpperCase()}',
                                            style: TextStyle(
                                              color: white.withOpacity(.4),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: white.withOpacity(.1),
                            child: IconButton(
                              onPressed: () {
                                context.go(AppRouteName.users);
                              },
                              icon: AppIcons.arrowRight.svg(
                                color: white,
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: white.withOpacity(.1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(bottom: 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      AppIcons.hand.svg(),
                                      const SizedBox(width: 8),
                                      Text(
                                        AppLocalizations.of(context)!.borrowed,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (state.givenAmount.isEmpty)
                                  RichText(
                                    text: TextSpan(
                                      text: "0",
                                      style: const TextStyle(
                                        color: white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' UZS',
                                          style: TextStyle(
                                            color: white.withOpacity(.4),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                else
                                  ...List.generate(
                                    state.givenAmount.length,
                                    (index) => RichText(
                                      text: TextSpan(
                                        text: MyFunction.priceFormat(
                                            int.tryParse(state
                                                    .givenAmount[index]
                                                    .amount) ??
                                                0),
                                        style: const TextStyle(
                                          color: white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                ' ${state.givenAmount[index].currency.toUpperCase()}',
                                            style: TextStyle(
                                              color: white.withOpacity(.4),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: white.withOpacity(.1),
                            child: IconButton(
                              onPressed: () {},
                              icon: AppIcons.arrowRight.svg(
                                color: white,
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: state.popular.data.isNotEmpty ? 160 : 68,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: context.color.whiteSmoke,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.popular.data.isNotEmpty) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: Text(
                                AppLocalizations.of(context)!.popularUser,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    if (context
                                        .read<AuthBloc>()
                                        .state
                                        .usergetModel
                                        .phone
                                        .isEmpty) {
                                      Caller.launchUrlWeb(
                                        "https://t.me/qarz_daftar1_bot",
                                      ).whenComplete(
                                        () {
                                          if (mounted) {
                                            context
                                                .read<AuthBloc>()
                                                .add(GetMeEvent());
                                          }
                                        },
                                      );
                                    } else if (context
                                            .read<AuthBloc>()
                                            .state
                                            .usergetModel
                                            .phone ==
                                        state.popular.data[index].phone) {
                                      context.go(AppRouteName.profile);
                                    } else {
                                      final bloc = context.read<UsersBloc>();
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider.value(
                                          value: bloc,
                                          child: OperationsView(
                                            user: state.popular.data[index],
                                          ),
                                        ),
                                      ));
                                      // context.push(AppRouteName.operation, extra: bloc);
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: blue,
                                    backgroundImage: CachedNetworkImageProvider(
                                      state.popular.data[index].avatar,
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 8),
                                itemCount: state.popular.data.length,
                              ),
                            ),
                          ],
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.active,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.go(AppRouteName.users);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.viewAll,
                                        style: const TextStyle(color: blue),
                                      ),
                                      const SizedBox(width: 4),
                                      AppIcons.arrowRight.svg()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
            body: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                return ColoredBox(
                  color: context.color.whiteSmoke,
                  child: RefreshIndicator.adaptive(
                    onRefresh: () async {
                      context.read<UsersBloc>().add(GetOperationsEvent());
                      context.read<UsersBloc>().add(GetGivenAmountEvent());
                      context.read<UsersBloc>().add(GetTakenAmountEvent());
                      context.read<UsersBloc>().add(GetPopularEvent());
                      context.read<UsersBloc>().add(GetNotificationEvent(
                            onSucces: (List<NotificationModel> notification) {},
                          ));
                      await Future.delayed(Duration.zero);
                    },
                    child: ListView.builder(
                      itemCount: state.operations.length,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 108),
                      itemBuilder: (context, index) => DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.color.contColor,
                          borderRadius: index == 0
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(8),
                                )
                              : index == (state.operations.length - 1)
                                  ? const BorderRadius.vertical(
                                      bottom: Radius.circular(8),
                                    )
                                  : null,
                        ),
                        child: ListTile(
                          onTap: () {
                            if (state.operations[index].contractorType !=
                                "borrowing") {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserProfileView(
                                  model: state.operations[index],
                                ),
                              ));
                            } else {
                              context.push(
                                AppRouteName.userdetails,
                                extra: state.operations[index],
                              );
                            }
                          },
                          title: Text(
                            state.operations[index].contractorFullName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            "${MyFunction.daysLeft(state.operations[index].deadline)} ${AppLocalizations.of(context)!.daysLeft}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: MyFunction.daysLeft(
                                          state.operations[index].deadline) >
                                      7
                                  ? null
                                  : red,
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundColor: backGroundColor,
                            backgroundImage: CachedNetworkImageProvider(
                              state.operations[index].contractorAvatar,
                            ),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${MyFunction.priceFormat(state.operations[index].amount)} ${state.operations[index].currency}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                MyFunction.typeOperation(
                                  state.operations[index].contractorType,
                                  context,
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      state.operations[index].contractorType ==
                                              "borrowing"
                                          ? red
                                          : mainBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
