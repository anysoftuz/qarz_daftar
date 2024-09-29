import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/users/user_profile_view.dart';
import 'package:qarz_daftar/presentation/views/users/widgets/pay_history_info_dialog.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/log_service.dart';
import 'package:qarz_daftar/utils/my_function.dart';
import 'package:badges/badges.dart' as badges;
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final channel = WebSocketChannel.connect(
    Uri.parse("ws://138.68.80.51:3000/ws"),
  );
  @override
  void initState() {
    context.read<UsersBloc>().add(GetOperationsEvent());
    context.read<UsersBloc>().add(GetGivenAmountEvent());
    context.read<UsersBloc>().add(GetTakenAmountEvent());
    context.read<UsersBloc>().add(GetPopularEvent());
    context.read<UsersBloc>().add(GetNotificationEvent(
      onSucces: (List<NotificationModel> notification) {
        if (MyFunction.notificationLeng(notification) > 0) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              insetPadding: const EdgeInsets.all(16),
              child: PayHistoryInfoDialog(
                model: MyFunction.notificationList(notification).isNotEmpty
                    ? MyFunction.notificationList(notification).first
                    : const NotificationModel(),
              ),
            ),
          );
        }
      },
    ));
    super.initState();

    channel.stream.listen(
      (event) {
        Log.i("Bu datada: $event");
      },
      onError: (error) {
        Log.e(error);
      },
      onDone: () {
        Log.e("Web soket closed");
      },
    );
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
                  hintText: "Search",
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
                                      const Text(
                                        "Lent",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: mainBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ...List.generate(
                                  state.takenAmount.length,
                                  (index) => RichText(
                                    text: TextSpan(
                                      text: MyFunction.priceFormat(int.tryParse(
                                              state
                                                  .takenAmount[index].amount) ??
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
                                      const Text(
                                        "Borrowed",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ...List.generate(
                                  state.givenAmount.length,
                                  (index) => RichText(
                                    text: TextSpan(
                                      text: MyFunction.priceFormat(int.tryParse(
                                              state
                                                  .givenAmount[index].amount) ??
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
                      height: 160,
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
                          if (state.popular.isNotEmpty) ...[
                            const Padding(
                              padding: EdgeInsets.only(left: 16, bottom: 8),
                              child: Text(
                                "Popular users",
                                style: TextStyle(
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
                                itemBuilder: (context, index) => CircleAvatar(
                                  radius: 28,
                                  backgroundColor: blue,
                                  backgroundImage: CachedNetworkImageProvider(
                                    state.popular[index].avatar,
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 8),
                                itemCount: state.popular.length,
                              ),
                            ),
                          ],
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Active",
                                  style: TextStyle(
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
                                      const Text(
                                        "View all",
                                        style: TextStyle(color: blue),
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
                          if (state.operations[index].contractorType ==
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
                          "${MyFunction.daysLeft(state.operations[index].deadline)} days left",
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
                              state.operations[index].contractorType
                                  .toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: state.operations[index].contractorType ==
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
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
