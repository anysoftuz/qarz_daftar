import 'package:flutter/material.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale(
    StorageRepository.getString(
      StorageKeys.LANGUAGE,
      defValue: 'uz',
    ),
  );
  Locale get locale => _locale;
  void setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    await StorageRepository.putString(
      StorageKeys.LANGUAGE,
      locale.languageCode,
    );
    notifyListeners();
  }
}
