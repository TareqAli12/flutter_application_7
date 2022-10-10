import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/task_managment/views/widgets/task_widget.dart';

import '../../data/dummy_data.dart';
import '../../models/task_model.dart';

class AllTaskScreen extends StatefulWidget{
  Function checkTask;
  AllTaskScreen({super.key, required this.checkTask});

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
  
}

class _AllTaskScreenState extends State<AllTaskScreen> {
  
  @override
  Widget build(Object context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(
          tasks[index],widget.checkTask
        );
      },
    );
  }
}