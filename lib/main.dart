import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/tasks_provider.dart';

import 'screens/tasks_screen.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        title: 'Todoey',
        home: const TasksScreen(),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
