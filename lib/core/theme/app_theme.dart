import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Plus Jakarta Sans',
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFB71C1C),
    primary: const Color(0xFFB71C1C),
    surface: const Color(0xFFFCF9F8),
  ),
  scaffoldBackgroundColor: const Color(0xFFFCF9F8),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF111827),
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF111827),
    ),
    iconTheme: IconThemeData(color: Color(0xFF111827)),
  ),
);
