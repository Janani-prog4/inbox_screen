import 'package:flutter/material.dart';

import '../data/mock_mail_data.dart';
import '../screens/mail_detail_screen.dart';
import '../widgets/app_drawer.dart';
import '../screens/compose_mail_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alumni Connect',
          style: TextStyle(color: Color(0xFFB71C1C)),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inbox',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Text(
                //   '12 Unread',
                //   style: TextStyle(
                //     color: Color(0xFFB71C1C),
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // child: Row(
            //   children: [
            //     _filterChip('All', true),
            //     _filterChip('Announcements', false),
            //     _filterChip('Direct', false),
            //     _filterChip('Archive', false),
            //   ],
            // ),
          ),

          const Divider(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: inboxData.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) {
                final mail = inboxData[index];
                return ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MailDetailScreen(mail: mail, isSent: false),
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(mail.avatarUrl),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mail.sender,
                        style: TextStyle(
                          fontWeight: mail.isUnread
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        mail.date,
                        style: TextStyle(
                          color: mail.isUnread
                              ? const Color(0xFFB71C1C)
                              : Colors.grey,
                          fontSize: 12,
                          fontWeight: mail.isUnread
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mail.subject,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: mail.isUnread
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        mail.excerpt,
                        style: const TextStyle(fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ComposeEmailScreen()),
          );
        },
        backgroundColor: const Color(0xFFB71C1C),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      // bottomNavigationBar: _bottomNav(0),
    );
  }

  // Widget _filterChip(String label, bool isActive) {
  //   return Container(
  //     margin: const EdgeInsets.only(right: 8),
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     decoration: BoxDecoration(
  //       color: isActive ? const Color(0xFFB71C1C) : Colors.grey.shade200,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Text(
  //       label,
  //       style: TextStyle(
  //         color: isActive ? Colors.white : Colors.black87,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 12,
  //       ),
  //     ),
  //   );
  // }
}
