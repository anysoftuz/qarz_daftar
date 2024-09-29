import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/profile/edit_profile_view.dart';
import 'package:qarz_daftar/presentation/views/users/widgets/bar_chart.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetGraphicStatisticsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          TextButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => AlertDialog.adaptive(
                  title: const Text("Haqiqattan chiqmoqchimisiz"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Yoq'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(LogOutEvent());
                      },
                      child: const Text(
                        'Ha',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                AppIcons.logout.svg(color: red),
                const SizedBox(width: 4),
                const Text(
                  "Log out",
                  style: TextStyle(color: red),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16).copyWith(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(12).copyWith(right: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.color.contColor,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: CachedNetworkImageProvider(
                              state.usergetModel.avatar,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.usergetModel.firstName} ${state.usergetModel.lastName}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    AppIcons.star.svg(),
                                    const SizedBox(width: 4),
                                    Text(
                                      state.usergetModel.score.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfileView(
                                  usergetModel: state.usergetModel,
                                ),
                              ));
                            },
                            icon: AppIcons.edit.svg(color: context.color.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Loans given",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: mainBlue,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.color.contColor,
                  ),
                  child: state.takenAmount.isEmpty
                      ? RichText(
                          text: TextSpan(
                            text: "0",
                            style: TextStyle(
                              color: context.color.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                            children: const [
                              TextSpan(
                                text: ' UZS',
                                style: TextStyle(
                                  color: gray,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            state.takenAmount.length,
                            (index) => RichText(
                              text: TextSpan(
                                text: MyFunction.priceFormat(int.tryParse(
                                        state.takenAmount[index].amount) ??
                                    0),
                                style: TextStyle(
                                  color: context.color.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ' ${state.takenAmount[index].currency.toUpperCase()}',
                                    style: const TextStyle(
                                      color: gray,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Loans taken",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: red,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.color.contColor,
                  ),
                  child: state.givenAmount.isEmpty
                      ? RichText(
                          text: TextSpan(
                            text: "0",
                            style: TextStyle(
                              color: context.color.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                            children: const [
                              TextSpan(
                                text: ' UZS',
                                style: TextStyle(
                                  color: gray,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            state.givenAmount.length,
                            (index) => RichText(
                              text: TextSpan(
                                text: MyFunction.priceFormat(int.tryParse(
                                        state.givenAmount[index].amount) ??
                                    0),
                                style: TextStyle(
                                  color: context.color.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ' ${state.givenAmount[index].currency.toUpperCase()}',
                                    style: const TextStyle(
                                      color: gray,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<UsersBloc, UsersState>(
                  builder: (context, state) {
                    if (state.graphicStatus.isInProgress) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return BarChartSample2(
                      graphicStatistics: state.graphicStatistics,
                    );
                  },
                ),
                const SizedBox(height: 16),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.color.contColor,
                  ),
                  child: ListTile(
                    onTap: () {
                      context.push(AppRouteName.settings);
                    },
                    leading: AppIcons.settings.svg(color: context.color.white),
                    title: const Text("Settings"),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    trailing:
                        AppIcons.arrowRight.svg(color: context.color.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(toY: y1, color: Colors.blue, width: 15),
      BarChartRodData(toY: y2, color: Colors.red, width: 15),
    ],
  );
}
