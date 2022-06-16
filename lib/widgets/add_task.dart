import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks_provider.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? task;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (v) {
              task = v;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (task.toString().isNotEmpty) {
                print('adding task: $task');
                Provider.of<TasksProvider>(context, listen: false)
                    .addTask(task.toString());
                task = '';
              }
              Navigator.pop(context);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
