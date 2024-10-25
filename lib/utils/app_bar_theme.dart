import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme appBarThemeData() {
  return const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: ThemeColor.Black,
    ),
    iconTheme: IconThemeData(
      color: ThemeColor.Black,
    ),
  );
}
