import 'package:flutter/material.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class WTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;
  final EdgeInsetsGeometry? padding;

  const WTabBar({
    this.tabController,
    required this.tabs,
    super.key,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: greyBack.withValues(alpha: .12),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        padding: padding ?? const EdgeInsets.all(2),
        labelPadding: const EdgeInsets.all(8),
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 3),
              color: black.withValues(alpha: 0.04),
            ),
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 3),
              color: black.withValues(alpha: 0.12),
            ),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: black.withValues(alpha: 0.04)),
            borderRadius: BorderRadius.circular(6),
          ),
          color: white,
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: onTap,
        splashBorderRadius: BorderRadius.circular(8),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
        unselectedLabelColor: shuttleGrey,
        labelColor: black,
        tabs: tabs,
      ),
    );
  }
}
