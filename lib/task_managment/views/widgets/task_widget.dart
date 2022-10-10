import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/task_managment/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  TaskModel taskModel;
  Function function;
  TaskWidget(this.taskModel, this.function);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.deepOrangeAccent,
      checkColor: Colors.orangeAccent,
      value: widget.taskModel.isComplete, 
      onChanged: ((v) {
        widget.function(widget.taskModel);
      }),
      title: Text(widget.taskModel.name),
      );
  }
}