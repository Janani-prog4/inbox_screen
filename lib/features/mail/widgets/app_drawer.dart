import 'package:flutter/material.dart';

import '../screens/inbox_screen.dart';
import '../screens/sent_items_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFB71C1C)),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&q=80&w=100',
              ),
            ),
            accountName: const Text(
              'Alumnus Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text('classof2010@alumni.com'),
          ),
          ListTile(
            leading: const Icon(Icons.inbox),
            title: const Text('Inbox'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const InboxScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Sent Items'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SentItemsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
