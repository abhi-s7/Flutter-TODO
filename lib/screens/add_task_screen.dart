import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoee/models/task.dart';
import 'package:todoee/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  /* No need as using Provider 

  final Function newTaskTitleCallback;
  AddTaskScreen(this.newTaskTitleCallback);
**/
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      //this is very necessary to add
      //as background of above container will be same as of blur color of above the container
      //so that we can make a circular border of bottom cotainer
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true, //so that softKeyboard automatically shows up
              textAlign: TextAlign.center,
              onChanged: (value) {
                //this gives every character that is typed
                newTaskTitle = value;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                // when the user have stopped typing then we will consume the taskText
                //newTaskTitleCallback(taskText);
                // final task = Task(name: newTaskTitle);
                /*
                Provider.of<TaskData>(context).changeList(task);
                Error: ried to listen to a value exposed with provider, from outside of the widget tree.

                This is likely caused by an event handler (like a button's onPressed) that called
                Provider.of without passing `listen: false`.

                To fix, write:
                Provider.of<TaskData>(context, listen: false);

                It is unsupported because may pointlessly rebuild the widget associated to the
                event handler, when the widget tree doesn't care about the value.

              */
                if (newTaskTitle != null && newTaskTitle != '') {
                  Provider.of<TaskData>(context, listen: false).changeList(
                      newTaskTitle); //listen: false is mandetory to add while calling notifyListeners
                  //As this piece of code doesn't requires the value so why it should listen and rebuild the widget again.
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Add ',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
