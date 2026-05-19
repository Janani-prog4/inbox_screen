import 'package:flutter/material.dart';

import '../data/mock_mail_data.dart';
import '../models/mail_message.dart';
import '../screens/mail_detail_screen.dart';
import '../widgets/app_drawer.dart';

class SentItemsScreen extends StatefulWidget {
  const SentItemsScreen({super.key});

  @override
  State<SentItemsScreen> createState() => _SentItemsScreenState();
}

class _SentItemsScreenState extends State<SentItemsScreen> {
  List<MailMessage> mails = List.from(sentData);

  Set<String> selectedMailIds = {};

  bool get isSelectionMode => selectedMailIds.isNotEmpty;

  void toggleSelection(String mailId) {
    setState(() {
      if (selectedMailIds.contains(mailId)) {
        selectedMailIds.remove(mailId);
      } else {
        selectedMailIds.add(mailId);
      }
    });
  }

  void deleteSelectedMails() {
    setState(() {
      mails.removeWhere((mail) => selectedMailIds.contains(mail.id));

      selectedMailIds.clear();
    });
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      if (value == true) {
        selectedMailIds = mails.map((mail) => mail.id).toSet();
      } else {
        selectedMailIds.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isSelectionMode ? '${selectedMailIds.length} Selected' : 'Sent',
          style: const TextStyle(color: Color(0xFFB71C1C)),
        ),
        actions: [
          if (isSelectionMode)
            IconButton(
              onPressed: deleteSelectedMails,
              icon: const Icon(Icons.delete_outline),
            ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Checkbox(
                  value:
                      mails.isNotEmpty &&
                      selectedMailIds.length == mails.length,
                  onChanged: toggleSelectAll,
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, size: 20),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: mails.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final mail = mails[index];

                final isSelected = selectedMailIds.contains(mail.id);

                return ListTile(
                  selected: isSelected,
                  selectedTileColor: Colors.red.shade50,
                  leading: isSelectionMode
                      ? Checkbox(
                          value: isSelected,
                          onChanged: (_) {
                            toggleSelection(mail.id);
                          },
                        )
                      : CircleAvatar(
                          backgroundColor: const Color(0xFFE57373),
                          child: const Icon(Icons.people, color: Colors.white),
                        ),
                  onLongPress: () {
                    if (!isSelectionMode) {
                      toggleSelection(mail.id);
                    }
                  },
                  onTap: () {
                    if (isSelectionMode) {
                      toggleSelection(mail.id);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MailDetailScreen(mail: mail, isSent: true),
                        ),
                      );
                    }
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          mail.sender,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        mail.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${mail.subject} — ',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: mail.excerpt),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 2,
        icon: const Icon(Icons.edit, color: Color(0xFFB71C1C)),
        label: const Text(
          'Compose',
          style: TextStyle(
            color: Color(0xFFB71C1C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
