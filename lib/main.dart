import 'package:flutter/material.dart';
import 'package:todoee/models/task_data.dart';
import 'package:todoee/provider_demo/demo3.dart';
import 'package:todoee/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    //this has been specified here as it is the root and through this all children can consume data
    create: (context) =>
        TaskData(), //this will Provide TaskData to it's children in the tree
    child: MaterialApp(
      home: TasksScreen(),
      // TasksScreen(),
    ),
  ));
}
