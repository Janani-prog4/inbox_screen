class MailMessage {
  final String id;
  final String sender;
  final String subject;
  final String excerpt;
  final String date;
  final bool isUnread;
  final String avatarUrl;

  const MailMessage({
    required this.id,
    required this.sender,
    required this.subject,
    required this.excerpt,
    required this.date,
    this.isUnread = false,
    this.avatarUrl =
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=100',
  });
}
