import 'package:flutter/material.dart';

import '../models/mail_message.dart';
import '../widgets/action_button.dart';
import '../widgets/attachment_pill.dart';

class MailDetailScreen extends StatelessWidget {
  final MailMessage mail;
  final bool isSent;

  const MailDetailScreen({super.key, required this.mail, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (!isSent)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.archive_outlined),
            ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
          if (!isSent)
            IconButton(onPressed: () {}, icon: const Icon(Icons.mail_outline)),
          if (isSent) const Icon(Icons.star_border, color: Color(0xFF111827)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mail.subject,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (!isSent)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Inbox',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 24),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isSent
                      ? const Color(0xFFE57373)
                      : Colors.grey.shade200,
                  backgroundImage: isSent ? null : NetworkImage(mail.avatarUrl),
                  child: isSent
                      ? const Icon(Icons.people, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            mail.sender,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                      if (!isSent)
                        const Text(
                          'To: me',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                    ],
                  ),
                ),
                if (isSent)
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey)
                else
                  const Icon(Icons.star_border, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              mail.excerpt,
              style: const TextStyle(fontSize: 15, height: 1.6),
            ),
            const SizedBox(height: 32),
            if (isSent) ...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    sentAttachmentPill(
                      Icons.picture_as_pdf,
                      'Ranchi_Report.pdf',
                    ),
                    const SizedBox(width: 12),
                    sentAttachmentPill(Icons.image, 'Site_Visit_01.jpg'),
                  ],
                ),
              ),
            ] else ...[
              const Text(
                'ATTACHMENTS (1)',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F1F1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.picture_as_pdf,
                        color: Color(0xFFB71C1C),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'reunion_plan.pdf',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '1.2 MB',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.download_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(child: actionButton(Icons.reply, 'Reply')),
                const SizedBox(width: 16),
                Expanded(child: actionButton(Icons.forward, 'Forward')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
