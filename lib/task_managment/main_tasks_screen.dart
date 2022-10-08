import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/screens/all_task.dart';
import 'views/screens/complete_task.dart';
import 'views/screens/incomplete_task.dart';

class MainTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        shadowColor: Colors.amber,
        title: const Text('Task Managment'),
        bottom: const TabBar(isScrollable: true,unselectedLabelColor: Colors.grey,indicatorColor: Colors.black,tabs: [
          Tab(
            text: 'All Tasks',
          ),
          Tab(
            text: 'Complete Tasks',
          ),
          Tab(
            text: 'Incomplete Tasks',
          )
        ]),
      ),
      body: TabBarView(children: [
        AllTaskScreen(),
        CompleteTaskScreen(),
        InCompleteTaskScreen(),
      ]),
      ),
    );
  }
  
  }
