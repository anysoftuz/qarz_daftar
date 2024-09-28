import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/widgets/w_scale_animation.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 232,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.color.black,
                borderRadius: BorderRadius.circular(68),
                border: Border.all(color: context.color.borderColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WBottomIteam(
                    index: 0,
                    onTap: (int index) {
                      _onTap(context, index);
                    },
                    currentIndex: widget.navigationShell.currentIndex,
                    icon: AppIcons.home,
                    title: "Home",
                  ),
                  WBottomIteam(
                    index: 1,
                    onTap: (int index) {
                      _onTap(context, index);
                    },
                    currentIndex: widget.navigationShell.currentIndex,
                    icon: AppIcons.users,
                    title: "List",
                  ),
                  WBottomIteam(
                    index: 2,
                    onTap: (int index) {
                      _onTap(context, index);
                    },
                    currentIndex: widget.navigationShell.currentIndex,
                    icon: AppIcons.profile,
                    title: "Profile",
                  ),
                ],
              ),
            ),
            WScaleAnimation(
              onTap: () {
                final bloc = context.read<UsersBloc>();
                context.push(AppRouteName.operation, extra: bloc);
              },
              child: Container(
                height: 64,
                width: 64,
                foregroundDecoration: BoxDecoration(
                  color: mainBlue.withOpacity(.2),
                  borderRadius: BorderRadius.circular(68),
                  border: Border.all(color: mainBlue),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                      color: mainBlue.withOpacity(.2),
                    ),
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                      color: mainBlue.withOpacity(.2),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: context.color.black,
                  borderRadius: BorderRadius.circular(68),
                ),
                child: const Icon(
                  Icons.add,
                  color: mainBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WBottomIteam extends StatelessWidget {
  const WBottomIteam({
    super.key,
    required this.index,
    required this.onTap,
    required this.currentIndex,
    required this.icon,
    required this.title,
  });
  final int index;
  final int currentIndex;
  final String icon;
  final String title;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: index == currentIndex ? mainBlue : null,
          borderRadius: BorderRadius.circular(68),
        ),
        child: index == currentIndex
            ? Row(
                children: [
                  icon.svg(color: white),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  )
                ],
              )
            : icon.svg(color: context.color.white),
      ),
    );
  }
}
