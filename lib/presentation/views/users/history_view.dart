import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/users/user_profile_view.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/images.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state.historyStatus.isInProgress) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state.history.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.emptyBox,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
              const SizedBox(height: 120),
            ],
          );
        }
        return ListView.builder(
          itemCount: state.history.length,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          itemBuilder: (context, index) => DecoratedBox(
            decoration: BoxDecoration(
              color: context.color.borderColor,
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
              onTap: () {
                if (state.history[index].contractorType == "borrowing") {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserProfileView(
                      model: OperationModel(
                        amount: int.tryParse(state.history[index].amount) ?? 0,
                        contractorFullName: state.history[index].concat,
                        contractorAvatar: state.history[index].avatar,
                        contractorPhone: "",
                        contractorType: state.history[index].contractorType,
                        deadline: state.history[index].deadline,
                        debt: int.tryParse(state.history[index].debt) ?? 0,
                        currency: state.history[index].currency,
                      ),
                    ),
                  ));
                } else {
                  context.push(
                    AppRouteName.userdetails,
                    extra: OperationModel(
                      amount: int.tryParse(state.history[index].amount) ?? 0,
                      contractorFullName: state.history[index].concat,
                      contractorAvatar: state.history[index].avatar,
                      contractorPhone: "",
                      contractorType: state.history[index].contractorType,
                      deadline: state.history[index].deadline,
                      debt: int.tryParse(state.history[index].debt) ?? 0,
                      currency: state.history[index].currency,
                    ),
                  );
                }
              },
              title: Text(
                state.history[index].concat,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "${MyFunction.daysLeft(state.history[index].deadline)} days left",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: backGroundColor,
                backgroundImage: CachedNetworkImageProvider(
                  state.history[index].avatar,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${MyFunction.priceFormat(int.tryParse(state.history[index].amount) ?? 0)} ${state.operations[index].currency}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    state.history[index].contractorType.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: state.history[index].contractorType == "borrowing"
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
    );
  }
}
