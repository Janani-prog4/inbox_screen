import '../models/mail_message.dart';

final List<MailMessage> inboxData = [
  const MailMessage(
    id: '1',
    sender: 'Rahul Sharma',
    subject: 'Regarding the 2024 Reunion Logistics',
    excerpt:
        'Hi Team, I\'ve finalized the catering list for the upcoming event...',
    date: '10:45 AM',
    isUnread: true,
    avatarUrl:
        'https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&q=80&w=100',
  ),
  const MailMessage(
    id: '2',
    sender: 'Siva Kumar',
    subject: 'Job Opportunity: Senior Architect Role',
    excerpt:
        'Our firm is looking for experienced alumni to join our design team...',
    date: 'Yesterday',
  ),
  const MailMessage(
    id: '3',
    sender: 'Alumni Secretariat',
    subject: 'Annual General Meeting Notice',
    excerpt: 'Notice is hereby given for the AGM scheduled for next month...',
    date: 'Oct 12',
  ),
];

final List<MailMessage> sentData = [
  const MailMessage(
    id: 's1',
    sender: 'To: Batch of 2018',
    subject: 'Project Ranchi: Following our visit last week',
    excerpt:
        'Dear Alumni Network, It was truly inspiring to see the progress. he monthly audit with the community stakeholders.',
    date: 'Feb 16',
  ),
  const MailMessage(
    id: 's2',
    sender: 'To: Admiral Kumar',
    subject: 'Re: Distinguished Alumni Awards',
    excerpt: 'Thank you for the confirmation regarding the ceremony...',
    date: 'Jan 1',
  ),
];
