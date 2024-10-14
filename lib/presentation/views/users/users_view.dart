import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/views/users/active_view.dart';
import 'package:qarz_daftar/presentation/views/users/blacklist_view.dart';
import 'package:qarz_daftar/presentation/views/users/contacts_add_view.dart';
import 'package:qarz_daftar/presentation/views/users/history_view.dart';
import 'package:qarz_daftar/presentation/views/users/users_filter_view.dart';
import 'package:qarz_daftar/presentation/widgets/commercial_tab.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetBannedEvent());
    context.read<UsersBloc>().add(GetContactsEvent());
    context.read<UsersBloc>().add(GetHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.contColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.list),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UsersFilterView(),
              ));
            },
            child: Row(
              children: [
                AppIcons.filter.svg(),
                const SizedBox(width: 4),
                Text(
                  AppLocalizations.of(context)!.filter,
                  style: const TextStyle(color: blue),
                ),
              ],
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CommercialTab(
                tabLabels: [
                  AppLocalizations.of(context)!.active,
                  AppLocalizations.of(context)!.history,
                  AppLocalizations.of(context)!.blacklist,
                  AppLocalizations.of(context)!.contacts,
                ],
                onTabTap: (int value) {},
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ActiveView(),
                  HistoryView(),
                  BlacklistView(),
                  ContactsAddView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
