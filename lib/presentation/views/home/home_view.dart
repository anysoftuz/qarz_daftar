import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetOperationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102750),
      body: NestedScrollView(
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
                            RichText(
                              text: TextSpan(
                                text: '0',
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
                            ),
                            const SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                text: '0',
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
                            RichText(
                              text: TextSpan(
                                text: '0',
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
                            ),
                            const SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                text: '0',
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => const CircleAvatar(
                            radius: 28,
                            backgroundColor: blue,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: 16,
                        ),
                      ),
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
                      context.push(AppRouteName.userdetails);
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
                          state.operations[index].contractorType.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: red,
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
      ),
    );
  }
}
