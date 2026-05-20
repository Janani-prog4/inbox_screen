import 'package:flutter/material.dart';
import 'package:inbox_screen/features/mail/screens/mail_home_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const AlumniMailApp());
}

class AlumniMailApp extends StatelessWidget {
  const AlumniMailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Legacy Link Mail',
      theme: appTheme,
      home: const MailHomeScreen(),
    );
  }
}
