import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qarz_daftar/data/models/auth/user_get_model.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key, required this.usergetModel});
  final UserGetModel usergetModel;
  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.editProfile)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundImage: CachedNetworkImageProvider(
                widget.usergetModel.avatar,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  CupertinoListTile(
                    title: Text(
                      AppLocalizations.of(context)!.firstName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: gray,
                      ),
                    ),
                    subtitle: Text(
                      widget.usergetModel.firstName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    title: Text(
                      AppLocalizations.of(context)!.lastName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: gray,
                      ),
                    ),
                    subtitle: Text(
                      widget.usergetModel.lastName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    title: Text(
                      AppLocalizations.of(context)!.phoneNumer,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: gray,
                      ),
                    ),
                    subtitle: Text(
                      widget.usergetModel.phone.isEmpty
                          ? "Tasdiqlanmagan"
                          : widget.usergetModel.phone,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.usergetModel.phone.isEmpty ? red : dark,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    title: Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: gray,
                      ),
                    ),
                    subtitle: const Text(
                      "Telegram",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: green,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
