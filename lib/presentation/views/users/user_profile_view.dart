import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/commercial_tab.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/caller.dart';
import 'package:qarz_daftar/utils/extensions.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key, required this.model});
  final OperationModel model;

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  void initState() {
    context
        .read<UsersBloc>()
        .add(GetHistoryEvent(phone: widget.model.contractorPhone));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: context.color.contColor,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.color.borderColor,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: CachedNetworkImageProvider(
                        widget.model.contractorAvatar),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.contractorFullName,
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
                              widget.model.contractorScore.toString(),
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
                  WButton(
                    height: 44,
                    width: 44,
                    onTap: () =>
                        Caller.makePhoneCall(widget.model.contractorPhone),
                    child: AppIcons.phone.svg(color: white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommercialTab(
                tabLabels: const [
                  "Berilgan qarzlar",
                  "Olingan qarzlar",
                ],
                onTabTap: (int value) {},
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<UsersBloc, UsersState>(
                builder: (context, state) {
                  return TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: state.historyLending.length,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                        itemBuilder: (context, index) => DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.color.borderColor,
                            borderRadius: index == 0
                                ? const BorderRadius.vertical(
                                    top: Radius.circular(8),
                                  )
                                : index == (state.historyLending.length - 1)
                                    ? const BorderRadius.vertical(
                                        bottom: Radius.circular(8),
                                      )
                                    : null,
                          ),
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              state.historyLending[index].concat,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              state.historyLending[index].status
                                  .toCapitalized(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: greyText,
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: backGroundColor,
                              backgroundImage: CachedNetworkImageProvider(
                                state.historyLending[index].avatar,
                              ),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${MyFunction.priceFormat(int.tryParse(state.historyLending[index].amount) ?? 0)} ${state.historyLending[index].currency}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  MyFunction.dateFormatDate(
                                    state.historyLending[index].deadline,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: state.historyBrow.length,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                        itemBuilder: (context, index) => DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.color.borderColor,
                            borderRadius: index == 0
                                ? const BorderRadius.vertical(
                                    top: Radius.circular(8),
                                  )
                                : index == (state.historyBrow.length - 1)
                                    ? const BorderRadius.vertical(
                                        bottom: Radius.circular(8),
                                      )
                                    : null,
                          ),
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              "${context.read<AuthBloc>().state.usergetModel.firstName} ${context.read<AuthBloc>().state.usergetModel.lastName}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              state.historyBrow[index].contractorType
                                  .toCapitalized(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: greyText,
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: backGroundColor,
                              backgroundImage: CachedNetworkImageProvider(
                                state.historyBrow[index].avatar,
                              ),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${MyFunction.priceFormat(int.tryParse(state.historyBrow[index].amount) ?? 0)} ${state.historyBrow[index].currency}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  MyFunction.dateFormatDate(
                                    state.historyBrow[index].deadline,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
