import 'dart:io';

import 'package:flutter/material.dart';

class AppImages {
  static const eng = "assets/images/eng.png";
  static const gettest = "assets/images/gettest.png";
  static const logo = "assets/images/logo.png";
  static const qarz = "assets/images/qarz.png";
  static const ru = "assets/images/ru.png";
  static const uzb = "assets/images/uzb.png";
  static const banner = "assets/images/debt-removebg-preview.png";
  static const splesh = "assets/images/splesh.png";
  static const telegram = "assets/images/telegram.png";
}

extension ImgExt on String {
  Image imgAsset({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Image imgNetwork({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.network(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Image imgFile({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.file(
      File(this),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
