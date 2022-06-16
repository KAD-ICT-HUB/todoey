import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/tasks_provider.dart';

import '../widgets/add_task.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Consumer<TasksProvider>(builder: (c, p, w) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const SizedBox(height: 150),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 40),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.list,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Tasks',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                const SizedBox(width: 20),
                Text(
                  p.doneTaskCount.toString(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                Text(
                  '/${p.taskCount}',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          const TasksList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AddTask(),
            ),
          );
        },
      ),
    );
  }
}
