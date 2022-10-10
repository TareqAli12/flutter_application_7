import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/task_model.dart';
import 'views/screens/all_task.dart';
import 'views/screens/complete_task.dart';
import 'views/screens/incomplete_task.dart';

class MainTaskScreen extends StatefulWidget {
  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen> {
  checkTask(TaskModel taskModel){
    int index=tasks.indexOf(taskModel);
    print(tasks[index].isComplete);
    tasks[index].isComplete=!tasks[index].isComplete;
    print(tasks[index].isComplete);
    setState(() {});
  }
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
        AllTaskScreen(checkTask: checkTask,),
        CompleteTaskScreen(checkTask: checkTask,),
        InCompleteTaskScreen(checkTask: checkTask,),
      ]),
      ),
    );
  }
}
