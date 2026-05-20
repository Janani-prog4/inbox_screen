import 'package:flutter/material.dart';

import '../data/mock_mail_data.dart';
import '../screens/mail_detail_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // const Divider(height: 24),
        Expanded(
          child: ListView.separated(
            itemCount: inboxData.length,

            separatorBuilder: (_, __) {
              return const Divider(height: 1, indent: 72);
            },

            itemBuilder: (context, index) {
              final mail = inboxData[index];

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MailDetailScreen(mail: mail, isSent: false),
                    ),
                  );
                },

                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mail.avatarUrl),
                ),

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Expanded(
                      child: Text(
                        mail.sender,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontWeight: mail.isUnread
                              ? FontWeight.bold
                              : FontWeight.normal,

                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

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
    );
  }

  static Widget _buildFilterChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFB71C1C) : Colors.grey.shade200,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        label,

        style: TextStyle(
          color: isActive ? Colors.white : Colors.black87,

          fontWeight: FontWeight.bold,

          fontSize: 12,
        ),
      ),
    );
  }
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

