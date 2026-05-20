import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';

import '../screens/compose_mail_screen.dart';
import 'inbox_screen.dart';
import 'sent_items_screen.dart';

class MailHomeScreen extends StatefulWidget {
  const MailHomeScreen({super.key});

  @override
  State<MailHomeScreen> createState() => _MailHomeScreenState();
}

class _MailHomeScreenState extends State<MailHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ["Inbox", "Sent Items", "Compose"];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,

        automaticallyImplyLeading: false,

        title: const Text(
          'Mail',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),

      body: Column(
        children: [
          // TAB BAR
          Material(
            color: Colors.white,

            child: TabBar(
              controller: _tabController,

              isScrollable: false,

              tabs: tabs.map((e) {
                return Tab(child: Center(child: Text(e.toUpperCase())));
              }).toList(),

              padding: EdgeInsets.zero,

              labelPadding: const EdgeInsets.symmetric(horizontal: 20),

              indicatorPadding: EdgeInsets.zero,

              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),

              unselectedLabelStyle: const TextStyle(fontSize: 13),

              labelColor: Colors.black,

              unselectedLabelColor: Colors.grey,

              indicatorColor: Color(0xFFB11225),

              indicatorWeight: 3,

              // tabs: tabs.map((e) {
              //   return Tab(text: e.toUpperCase());
              // }).toList(),
            ),
          ),

          // TAB VIEW
          Expanded(
            child: TabBarView(
              controller: _tabController,

              children: const [
                InboxScreen(),
                SentItemsScreen(),
                ComposeEmailScreen(),
              ],
            ),

            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     // Future compose action
            //   },
            //
            //   backgroundColor: const Color(0xFFB71C1C),
            //
            //   child: const Icon(
            //     Icons.edit,
            //     color: Colors.white,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
