import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  int get taskCount => _tasks.length;
  int get doneTaskCount => _tasks.where((task) => task.isDone).length;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void updateTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
