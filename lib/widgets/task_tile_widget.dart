import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function onLongPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.onLongPressCallback});
  //final  - because it is a stateless widget which means it state doesn't changes
  //thus values must be final or constants(runtime)

  /*This has been converted from stateful widget to staless as to Dynamically add Tasks into the list 
  the setStates must be done in TaskList widget not here because it is just to display the 
  Text and Checkbox. And to toggle their values we'll have to attact a callback from the parent widget 
  as setStates cannot be applied here due to the fact it is Stateless Widget

  */

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked
              ? TextDecoration.lineThrough
              : null, //i.e. only make the line cutted text when the checkbox has been ticked
          //null represent no value to set
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        /*this is same as below
      onChanged: (newValue){
        checkboxCallback(newValue)
      }

      But it is not useful as checkboxCallback actually take an input and calls setStates
      
      (bool checkBoxState){
            setState(() {
              //taskList[index].isDone = checkBoxState; or
              taskList[index].toggleDone();
              // this callback will be attached to TaskTile and when a change occur it will trigger this callback
            })//in taskTile screen

      so it is not required until and unless some value is returned and we need to consume the value in callback
      */
      ),
    );
  }
}

// (currentValue) {
//           //2nd - by using anonymous function
//           setState(() {
//             isChecked = currentValue; //this will do the toggling
//           });
//         }
