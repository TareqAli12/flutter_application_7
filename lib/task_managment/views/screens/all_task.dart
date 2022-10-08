import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/task_managment/views/widgets/task_widget.dart';

import '../../data/dummy_data.dart';

class AllTaskScreen extends StatelessWidget{
  @override
  Widget build(Object context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(
          tasks[index]
        );
      },
    );
  }

}