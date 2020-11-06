import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void _toggleCheckBoxState(bool currentValue) {
    setState(() {
      isChecked = currentValue; //this will do the toggling
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Task',
        style: TextStyle(
          decoration: isChecked
              ? TextDecoration.lineThrough
              : null, //i.e. only make the line cutted text when the checkbox has been ticked
          //null represent no value to set
        ),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        // toggleCheckboxCallback: _toggleCheckBoxState, //1st
        toggleCheckboxCallback: (currentValue) {
          //2nd - by using anonymous function
          setState(() {
            isChecked = currentValue; //this will do the toggling
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  bool isChecked;
  Function toggleCheckboxCallback;
  TaskCheckbox({this.isChecked, this.toggleCheckboxCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked, //this means it is unchecked

      // onChanged: toggleCheckboxCallback,//it is direct implementation it will call the function directly
      onChanged: (newValue) {
        toggleCheckboxCallback(newValue);
        //since there is nothing to return thus it is redundant way to use callback , above one does the same thing automatically
      },

      // onChanged:
      /*
       (newValue){
        setStates(){
          isChecked = newValue;
        }
      },
      Since this is Stateless widget thus we can't use setStates here to re-render the changes 
      Therefore we need to attach a callback to a function that will move up to the Statefull widget to re - render the changes
    */
    );
  }
}
