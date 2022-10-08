import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/task_managment/views/widgets/task_widget.dart';

import '../../data/dummy_data.dart';

class CompleteTaskScreen extends StatelessWidget{
  @override
  Widget build(Object context) {
    return ListView.builder(
      itemCount: tasks.where((element) => element.isComplete).length,
      itemBuilder: (context, index) {
        return TaskWidget(
          tasks.where((element) => element.isComplete).toList()[index]
        );
      },
    );
  }

}