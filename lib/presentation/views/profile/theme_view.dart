import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/main.dart';
import 'package:qarz_daftar/presentation/widgets/w_scale_animation.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/src/assets/themes/theme_changer.dart';

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
    switch (getTheme(StorageRepository.getString(StorageKeys.MODE))) {
      case ThemeMode.dark:
        selectIndex = ValueNotifier(0);
        break;
      case ThemeMode.light:
        selectIndex = ValueNotifier(1);
        break;
      default:
        selectIndex = ValueNotifier(2);
        break;
    }
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
                    color: value == 0 ? mainBlue : dark,
                  ),
                  title: 'Qorong’u',
                  onTap: () {
                    AppScope.update(
                      context,
                      const AppScope(themeMode: ThemeMode.dark),
                    );
                  },
                ),
                const Divider(),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 1,
                  trailing: AppIcons.sun.svg(
                    color: value == 1 ? mainBlue : dark,
                  ),
                  title: 'Yorug’',
                  onTap: () {
                    AppScope.update(
                      context,
                      const AppScope(themeMode: ThemeMode.light),
                    );
                  },
                ),
                const Divider(),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 2,
                  trailing: Icon(
                    Icons.phone_iphone,
                    color: value == 2 ? mainBlue : dark,
                  ),
                  title: 'Qurilma mavzusi',
                  onTap: () {
                    AppScope.update(
                      context,
                      const AppScope(themeMode: ThemeMode.system),
                    );
                  },
                ),
                const Divider(),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            if (value == index) AppIcons.succes.svg(),
            const SizedBox(width: 12),
            // if (trailing != null) ...[
            //   trailing!,
            //   const SizedBox(width: 8),
            // ],
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: value == index ? mainBlue : context.color.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
