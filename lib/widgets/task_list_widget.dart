import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoee/models/task_data.dart';
import 'task_tile_widget.dart';

class TaskList extends StatelessWidget {
//since we are using Provider to listen to the changes in data there is no need to pass the data via constructor
//thus there is also no need for a StatefulWidget as we don't need setStates

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        print(
            'taskData runtimeType ${taskData.runtimeType}'); //this will be TaskData object
        print('child runtimeType ${child.runtimeType}');
        //instead Provider.of<TaskData>(context) we can use just taskData
        return ListView.builder(
          itemBuilder: (BuildContext ctx, int index) {
            final task = taskData.getTaskList[index];
            return TaskTile(
              // taskTitle: taskData.taskList[index].name,
              // isChecked: taskData.taskList[index].isDone,
              taskTitle: task
                  .name, //getTaskList is UnModifiableListView for getting the private List
              isChecked: task.isDone,
              checkboxCallback: (bool checkBoxState) {
                //instead of having setState call the updateTask method in TaskData
                //this will still go as a callback

                //Provider.of<TaskData>(context, listen: false)//this will also work
                taskData.updateTask(task);

                /*What's Happening here?
                    taskData is the object of class TaskData and in it there is a method to toggle the state of checkbox i.e. true to false or false to true
                    With the callback it is being attached
                    And when the user presses the checkbox then this method gets triggered that will change the state of checkbox
                    Which then Consumer widget notifies that something is being changed at a certain index in ListView.builder
                    Then it re-renders the TaskTile without having to call setStates of Provider inside TaskTile
                  */
              },
              onLongPressCallback: () {
                if (task.isDone) {
                  taskData.removeTask(task);
                }
              },
            );
          },
          itemCount: taskData.getTaskLength, //instead of taskList.length
        );
      },
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return TaskTile(
            taskTitle: Provider.of<TaskData>(context).taskList[index].name,
            //  context
            //     //.read<TaskData>()//it says it is unsafe to use read as it is either in build or the 'update' callback of the provider
            //     //thus use watch or select[only for optimization]
            //     .watch<TaskData>()
            //     .taskList[index]
            //     .name, //to use the property of statefull widget use widget.
            isChecked: Provider.of<TaskData>(context).taskList[index].isDone,
            checkboxCallback: (bool checkBoxState) {
              // setState(() {
              //   //taskList[index].isDone = checkBoxState; or
              //   widget.taskList[index].toggleDone();
              //   // this callback will be attached to TaskTile and when a change occur it will trigger this callback
              // });
            });
      },
      itemCount: Provider.of<TaskData>(context).getTaskLength,//instead of taskList.length
    );
  }
  */
}
