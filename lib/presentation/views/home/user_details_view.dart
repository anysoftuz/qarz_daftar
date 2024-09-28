import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/edit_deadline_dialog.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/edit_partial_pay_dialog.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/edit_pay_all_dialog.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/views/operations/borrowing_view.dart';
import 'package:qarz_daftar/presentation/views/operations/lending_view.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/caller.dart';
import 'package:qarz_daftar/utils/extensions.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key, required this.model});
  final OperationModel model;

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetOperationsTREvent(id: widget.model.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: BoxDecoration(
          color: context.color.contColor,
          border: Border(top: BorderSide(color: context.color.borderColor)),
        ),
        child: Row(
          children: [
            Expanded(
              child: WButton(
                onTap: () {
                  final bloc = context.read<UsersBloc>();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BorrowingView(
                      images: const [],
                      user: const Datum(),
                      isLending: false,
                      deadline: DateTime.now().toString(),
                      description: "",
                      amount: 0,
                      isBanned: false,
                      currency: "uzs",
                      bloc: bloc,
                    ),
                  ));
                },
                height: 48,
                borderRadius: 8,
                color: Colors.transparent,
                border: Border.all(color: red),
                textColor: red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.hand.svg(),
                    const SizedBox(width: 4),
                    const Text("Borrowing")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: WButton(
                onTap: () {
                  final bloc = context.read<UsersBloc>();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LendingView(
                      images: const [],
                      user: const Datum(),
                      isLending: true,
                      deadline: DateTime.now().toString(),
                      description: "",
                      amount: 0,
                      isBanned: false,
                      currency: "uzs",
                      bloc: bloc,
                    ),
                  ));
                },
                height: 48,
                borderRadius: 8,
                color: Colors.transparent,
                border: Border.all(color: mainBlue),
                textColor: mainBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.banknote.svg(),
                    const SizedBox(width: 4),
                    const Text("Lending")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.color.contColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.model.contractorAvatar),
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
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.model.status.toCapitalized(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.color.contColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTileItam(
                  title: 'Lent',
                  subtitle:
                      '${MyFunction.priceFormat(widget.model.amount)} ${widget.model.currency}',
                  icon: AppIcons.banknote,
                  color: mainBlue,
                ),
                const SizedBox(height: 12),
                InfoTileItam(
                  title: 'Given at',
                  subtitle: MyFunction.dateFormat(widget.model.createdAt),
                  icon: AppIcons.calendar,
                ),
                const SizedBox(height: 12),
                InfoTileItam(
                  title: 'Deadline',
                  subtitle: MyFunction.dateFormat(widget.model.deadline),
                  icon: AppIcons.secundomer,
                  treling:
                      '${MyFunction.daysLeft(widget.model.deadline)} days left',
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: WButton(
                        onTap: () {
                          final bloc = context.read<UsersBloc>();
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              insetPadding: const EdgeInsets.all(16),
                              child: EditDeadlineDialog(
                                bloc: bloc,
                                model: widget.model,
                              ),
                            ),
                          );
                        },
                        color: Colors.transparent,
                        border: Border.all(
                          color: context.color.white.withOpacity(.4),
                        ),
                        textColor: context.color.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.edit.svg(color: context.color.white),
                            const SizedBox(width: 8),
                            const Text("Edit deadline")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WButton(
                        onTap: () {
                          final bloc = context.read<UsersBloc>();
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              insetPadding: const EdgeInsets.all(16),
                              child: EditPartialPayDialog(
                                bloc: bloc,
                                model: widget.model,
                              ),
                            ),
                          );
                        },
                        color: Colors.transparent,
                        border: Border.all(
                          color: context.color.white.withOpacity(.4),
                        ),
                        textColor: context.color.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.moneyClock.svg(color: context.color.white),
                            const SizedBox(width: 8),
                            const Text("Partial pay")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                WButton(
                  onTap: () {
                    final bloc = context.read<UsersBloc>();
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        insetPadding: const EdgeInsets.all(16),
                        child: EditPayAllDialog(
                          bloc: bloc,
                          model: widget.model,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.leftPay.svg(),
                      const SizedBox(width: 8),
                      const Text("Pay all")
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "History",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.operationsTr.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.color.contColor,
                    borderRadius: index == 0
                        ? const BorderRadius.vertical(
                            top: Radius.circular(8),
                          )
                        : index == 4
                            ? const BorderRadius.vertical(
                                bottom: Radius.circular(8),
                              )
                            : null,
                  ),
                  child: ListTile(
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
              );
            },
          ),
        ],
      ),
    );
  }
}
