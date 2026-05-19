import 'package:flutter/material.dart';

Widget actionButton(IconData icon, String label) {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: Icon(icon, size: 18),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFFB71C1C),
      side: const BorderSide(color: Color(0xFFE0E0E0)),
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
  );
}
