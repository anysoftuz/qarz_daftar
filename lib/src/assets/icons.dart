import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const calendar = "assets/icons/calendar.svg";
  static const trash = "assets/icons/trash.svg";
  static const succes = "assets/icons/succes.svg";
  static const upDown = "assets/icons/up-down.svg";
  static const contact = "assets/icons/contact.svg";
  static const arrowDown = "assets/icons/arrow_down.svg";
  static const leftPay = "assets/icons/left-pay.svg";
  static const secundomer = "assets/icons/secundomer.svg";
  static const moneyClock = "assets/icons/money_clock.svg";
  static const banknote = "assets/icons/hand-money-banknote.svg";
  static const hand = "assets/icons/hand.svg";
  static const settings = "assets/icons/settings.svg";
  static const search = "assets/icons/search.svg";
  static const globe = "assets/icons/globe.svg";
  static const phone = "assets/icons/phone.svg";
  static const filter = "assets/icons/filter.svg";
  static const home = "assets/icons/home.svg";
  static const users = "assets/icons/users.svg";
  static const arrowRight = "assets/icons/arrow_right.svg";
  static const checkboxRadioActive = "assets/icons/checkbox_radio_active.svg";
  static const checkboxRadio = "assets/icons/checkbox_radio.svg";
  static const edit = "assets/icons/edit.svg";
  static const lenguage = "assets/icons/lenguage.svg";
  static const logout = "assets/icons/logout.svg";
  static const moon = "assets/icons/moon.svg";
  static const notification = "assets/icons/notification.svg";
  static const profile = "assets/icons/profile.svg";
  static const save = "assets/icons/save.svg";
  static const star = "assets/icons/star.svg";
  static const scan = "assets/icons/scan.svg";
  static const sun = "assets/icons/sun.svg";
  static const test = "assets/icons/test.svg";
  static const theme = "assets/icons/theme.svg";
  static const question = "assets/icons/question.svg";
  static const passing = "assets/icons/passing.svg";
  static const close = "assets/icons/close.svg";
  static const info = "assets/icons/info.svg";
  static const checkVerified = "assets/icons/check-verified.svg";
  static const warning = "assets/icons/warning.svg";
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
