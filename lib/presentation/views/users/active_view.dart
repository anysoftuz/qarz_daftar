import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/users/user_profile_view.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/utils/my_function.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<UsersBloc>().add(GetOperationsEvent());
        await Future.delayed(const Duration(seconds: 1));
      },
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.operations.length,
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
                  if (state.operations[index].contractorType == "borrowing") {
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
                    color:
                        MyFunction.daysLeft(state.operations[index].deadline) >
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
    );
  }
}
