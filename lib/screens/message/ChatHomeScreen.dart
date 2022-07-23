import 'package:flutter/material.dart';
import 'package:hirehub/screens/message/Pages/ChatPage.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HireHub Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('New Group Chat'),
                value: 'New Group Chat',
              ),
            ];
          }),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Messages',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            ),
          ],
        ),
      ),
      body: TabBarView(children: const [
        ChatPage(),
        Center(
          child: Text('Status'),
        ),
        Center(
          child: Text('Calls'),
        ),
      ], controller: _tabController),
    );
  }
}
