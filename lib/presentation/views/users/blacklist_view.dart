import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class BlacklistView extends StatelessWidget {
  const BlacklistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Search",
                fillColor: context.color.borderColor,
                prefixIcon: AppIcons.search.svg(),
                onChanged: (String value) {},
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemBuilder: (context, index) => DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.color.borderColor,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: CachedNetworkImageProvider(
                          state.banneds[index].avatar,
                        ),
                      ),
                      title: Text(
                        state.banneds[index].fullName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: const Text(
                        "Banned",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: red,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppIcons.star.svg(),
                          const SizedBox(width: 4),
                          Text(state.banneds[index].score.toString())
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: state.banneds.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}