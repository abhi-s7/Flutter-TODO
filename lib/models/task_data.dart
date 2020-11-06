/*
This will act as the Data class for the Provider
It will be provided at Top most widget which contains TaskScreen and AddTaskScreen

Now this data will be listened by TaskScreen - to update the number of Tasks
& TaskList Screen to show the list of data

ChangeNotifier comes from foundation.dart which is inturn children of material.dart
*/
import 'package:flutter/foundation.dart';
import 'package:todoee/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    //making it private so that in future we can't just add directly to the list and we are forced to use the below methods for any addition of item
    Task(name: 'Buy Food'),
    Task(name: 'Go to Gym'),
    Task(name: 'Code your way to Google!')
  ];

  //but making List private will even restrict the access of task name to display
  //therefore use getter for the list

  UnmodifiableListView<Task> get getTaskList {
    //:::return _taskList;//but this way we will get the same problem for which we made _taskList private therefore use UnModifiableListView

    return UnmodifiableListView(
        _taskList); //this way we are giving a view/window of a list where only read is allowed but not write
    //and this comes from 'dart:collections'
  }

  int get getTaskLength {
    return _taskList.length;
  }

  void changeList(String newTaskTitle) {
    final newTask = Task(name: newTaskTitle);
    _taskList.add(newTask);
    print('new List $_taskList');
    notifyListeners(); //this will update the children listening to the data
  }

  void updateTask(Task task) {
    task.toggleDone(); //this will toggle from the current state of checkbox
    notifyListeners();
  }

  void removeTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
