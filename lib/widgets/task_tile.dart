import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function checkboxCallBack;
  const TaskTile({
    Key? key,
    required this.title,
    required this.isDone,
    required this.checkboxCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isDone,
          activeColor: Colors.indigo,
          onChanged: (v) => checkboxCallBack(v),
        ),
      ),
    );
  }
}
