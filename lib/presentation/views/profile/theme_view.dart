import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/widgets/w_scale_animation.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  late ValueNotifier<int> selectIndex;
  @override
  void initState() {
    super.initState();
    selectIndex = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mavzu")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder(
          valueListenable: selectIndex,
          builder: (context, value, __) {
            return Column(
              children: [
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 0,
                  trailing: AppIcons.moon.svg(
                    color: value == 0 ? green : dark,
                  ),
                  title: 'Qorong’u',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 1,
                  trailing: AppIcons.sun.svg(
                    color: value == 1 ? green : dark,
                  ),
                  title: 'Yorug’',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 2,
                  trailing: Icon(
                    Icons.phone_iphone,
                    color: value == 2 ? green : dark,
                  ),
                  title: 'Qurilma mavzusi',
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ThemeIteam extends StatelessWidget {
  const ThemeIteam({
    super.key,
    required this.selectIndex,
    required this.value,
    required this.index,
    this.trailing,
    required this.title,
    required this.onTap,
  });

  final ValueNotifier<int> selectIndex;
  final int value;
  final int index;
  final Widget? trailing;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        selectIndex.value = index;
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: value == index ? Border.all(color: green) : null,
          color: value == index ? white : whiteSmoke,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            if (trailing != null) ...[
              trailing!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: value == index ? green : dark,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            value == index
                ? AppIcons.checkboxRadioActive.svg()
                : AppIcons.checkboxRadio.svg(),
          ],
        ),
      ),
    );
  }
}
