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
import 'package:qarz_daftar/presentation/views/home/widgets/info_tile_itam.dart';
import 'package:qarz_daftar/presentation/views/home/widgets/lending_succes_dialog.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class LendingView extends StatefulWidget {
  const LendingView({
    super.key,
    required this.images,
    required this.user,
    required this.isLending,
    required this.deadline,
    required this.description,
    required this.amount,
    required this.isBanned,
    required this.currency,
  });
  final List<File> images;
  final Datum user;
  final bool isLending;
  final String deadline;
  final String description;
  final int amount;
  final bool isBanned;
  final String currency;

  @override
  State<LendingView> createState() => _LendingViewState();
}

class _LendingViewState extends State<LendingView> {
  late ValueNotifier<bool> isLending;
  @override
  void initState() {
    isLending = ValueNotifier(widget.isLending);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lending")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: BoxDecoration(
          color: context.color.contColor,
          border: Border(top: BorderSide(color: context.color.borderColor)),
        ),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            return WButton(
              onTap: () {
                context.read<UsersBloc>().add(PosOperationsEvent(
                      model: PostOperationModel(
                        contractorId: widget.user.id,
                        contractorType:
                            widget.isLending ? "lending" : "borrowing",
                        amount: widget.amount,
                        deadline: MyFunction.dateFormatLed(widget.deadline),
                        isBlacklist: widget.isBanned,
                        description: widget.description,
                        currency: widget.currency,
                      ),
                      onSucces: () {
                        showDialog(
                          context: context,
                          builder: (context) => const Dialog(
                            insetPadding: EdgeInsets.all(16),
                            child: LendingSuccesDialog(),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.banknote.svg(color: white),
                  const SizedBox(width: 8),
                  const Text("Confirm lending")
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
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: mainBlue.withOpacity(.2),
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
                                  "Lender",
                                  style: TextStyle(color: mainBlue),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: red.withOpacity(.2),
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
                              "Borrower",
                              style: TextStyle(color: red),
                            ),
                          ),
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
                        color: white,
                        border: Border.all(color: borderColor),
                        onTap: () {},
                        child: AppIcons.upDown.svg(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              InfoTileItam(
                title: 'Lent',
                subtitle:
                    '${MyFunction.priceFormat(widget.amount)} ${widget.currency}',
                icon: AppIcons.banknote,
                color: mainBlue,
              ),
              const SizedBox(height: 12),
              InfoTileItam(
                title: 'Given at',
                subtitle: MyFunction.dateFormat(DateTime.now().toString()),
                icon: AppIcons.calendar,
              ),
              const SizedBox(height: 12),
              InfoTileItam(
                title: 'Deadline',
                subtitle: MyFunction.dateFormat(widget.deadline),
                icon: AppIcons.secundomer,
                treling: '${MyFunction.daysLeft(widget.deadline)} days left',
                colorTreling: context.color.white,
              ),
              const SizedBox(height: 12),
              const Text(
                "Phone",
                style: TextStyle(
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
