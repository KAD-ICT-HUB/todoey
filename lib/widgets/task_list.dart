import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/tasks_provider.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer<TasksProvider>(
          builder: (c, p, w) {
            return ListView.builder(
              itemCount: p.taskCount,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (c, i) {
                final task = p.tasks[i];
                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  onDismissed: (direction) => p.deleteTask(i),
                  child: TaskTile(
                    title: task.title,
                    isDone: task.isDone,
                    checkboxCallBack: (bool value) {
                      p.updateTask(i);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
