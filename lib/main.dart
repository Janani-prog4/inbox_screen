import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/mail/screens/inbox_screen.dart';

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
      home: const InboxScreen(),
    );
  }
}
