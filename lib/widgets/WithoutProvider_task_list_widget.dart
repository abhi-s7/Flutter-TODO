import 'package:flutter/material.dart';
import 'package:todoee/models/task.dart';
import 'task_tile_widget.dart';

class TaskList extends StatefulWidget {
  //statefull so that we can update it's state
  final List<Task> taskList;
  TaskList(this.taskList);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  //since it is child of TasksScreen and List is limited to TaskList only thus to be able to send data from AddTaskScreen which is popup screen
  //we must increase the scope of list of task so that both the AddTaskScreen and TaskList Screen can share the common list
/*
  List<Task> taskList = [
    Task(name: 'Buy Milk'), //here isDone is by default false
    Task(name: 'Buy Bread'),
  ];
*/
  @override
  Widget build(BuildContext context) {
    // print('Inside TaskList ${widget.taskList}');

    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return TaskTile(
            taskTitle: widget.taskList[index]
                .name, //to use the property of statefull widget use widget.
            isChecked: widget.taskList[index].isDone,
            checkboxCallback: (bool checkBoxState) {
              setState(() {
                //taskList[index].isDone = checkBoxState; or
                widget.taskList[index].toggleDone();
                // this callback will be attached to TaskTile and when a change occur it will trigger this callback
              });
            });
      },
      itemCount: widget.taskList.length,
    );

    /*
    Using List view whenever new task is added it will add to tasks list then whole list will be printed
    using ListView and this process repeats with every addition of taks
    thus computation is huge

    Therefore use ListView.builder
    1. builds children on demand
    2. appropriate with a large(or infinite) number of children
    3. as builder is called only for those children that are visible on screen
    4. thus save a lot of computation

    Only required property is :
    IndexedWidgetBuilder - it's a callback that takes two inputs
        a. BuildContext - both in stateless and stateful widget
                        - contains the information that tells the children widget where is the parent in widget tree

        b. index - current item that is being build
    **/
    /*
    ListView(
      // children: mockup.map((e) => Text(e)).toList(),
      children: [
        TaskTile(taskTitle: taskList[0].name, isChecked: taskList[0].isDone),
        TaskTile(taskTitle: taskList[1].name, isChecked: taskList[1].isDone)
      ],
    );
    */
  }
}
