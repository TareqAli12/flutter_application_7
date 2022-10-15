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

class _MainTaskScreenState extends State<MainTaskScreen> with SingleTickerProviderStateMixin {
  checkTask(TaskModel taskModel){
    int index=tasks.indexOf(taskModel);
    print(tasks[index].isComplete);
    tasks[index].isComplete=!tasks[index].isComplete;
    print(tasks[index].isComplete);
    setState(() {});
  }
  late TabController tabController;
  initializeTabController(){
    tabController = TabController(length: 3, vsync: this);
  
  }
  @override
  void initState(){
    super.initState();
    initializeTabController();
  }
  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Text('T'),
                ),
                accountName: Text('Tareq Ali'), 
                accountEmail: Text('tareqmaher02@gmail.com'),
                ),
                ListTile(
                  title: const Text('ALL TASKS'),
                  subtitle: const Text('go to all tasks page'),
                  leading: const Icon(Icons.list),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap:(){ tabController.animateTo(0);},
                ),
                ListTile(
                  title: const Text('COMPLETE TASKS'),
                  subtitle: const Text('go to complete tasks page'),
                  leading: const Icon(Icons.done),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap:(){ tabController.animateTo(1);},
                ),
                ListTile(
                  title: const Text('INCOMPLETE TASKS'),
                  subtitle: const Text('go to incomplete tasks page'),
                  leading: const Icon(Icons.cancel),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap:(){ tabController.animateTo(2);},
                ),
            ],
          ),
        ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        shadowColor: Colors.amber,
        title: const Text('Task Managment'),
        bottom: TabBar(controller: tabController, isScrollable: true,unselectedLabelColor: Colors.grey,indicatorColor: Colors.black,tabs: const [
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
      body: TabBarView(controller: tabController,children: [
        AllTaskScreen(checkTask: checkTask,),
        CompleteTaskScreen(checkTask: checkTask,),
        InCompleteTaskScreen(checkTask: checkTask,),
      ]),
      ),
    );
  }
}
