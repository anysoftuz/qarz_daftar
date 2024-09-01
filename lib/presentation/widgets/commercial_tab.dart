import 'package:flutter/material.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class CommercialTab extends StatelessWidget {
  const CommercialTab({
    this.tabController,
    required this.onTabTap,
    required this.tabLabels,
    super.key,
  });

  final TabController? tabController;
  final List<String> tabLabels;
  final ValueChanged<int> onTabTap;

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFEAEEF2),
        ),
        padding: const EdgeInsets.all(2),
        child: TabBar(
          dividerColor: Colors.transparent,
          onTap: onTabTap,
          controller: tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            // Theme.of(context).extension<ThemedColors>()!.whiteToDolphin,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.04),
                blurRadius: 1,
                offset: const Offset(0, 3),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: black.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          labelPadding: EdgeInsets.zero,
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: const Color(0xFF24292F),
          tabs: [
            for (int i = 0; i < tabLabels.length - 1; i++)
              Row(
                children: [
                  Expanded(child: Tab(text: tabLabels[i])),
                  const SizedBox(
                    height: 16,
                    child: VerticalDivider(
                      color: Color(0xFFAFB8C1),
                      thickness: 0.65,
                      width: 0.65,
                      indent: 5,
                      endIndent: 2,
                    ),
                  )
                ],
              ),
            Tab(text: tabLabels.last),
          ],
        ),
      );
}
