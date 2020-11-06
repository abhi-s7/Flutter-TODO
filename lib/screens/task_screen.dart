import 'package:flutter/material.dart';
import 'package:todoee/models/task.dart';
import 'package:todoee/models/task_data.dart';
import 'package:todoee/screens/add_task_screen.dart';
import 'package:todoee/widgets/task_list_widget.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  //List<String> mockup = ['Buy Milk', 'Buy Mobile', 'Do Homework'];

/* ************** No Need for it to be stateful as we have Provider and we won't use setStates *************************
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget buildButtomSheet(BuildContext context) => Container();

*/
  //List<Task> taskList = [];//::::::There is no need to send data from here as List has been provided via provider from TaskData

  @override
  Widget build(BuildContext context) {
    // List<Task> taskList = []; if specified here the list will be passed as empty because when setStates is done
    //the screen is re-render which means build method runs again thus list gets initialize again
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
          //builder:  Widget buildButtomSheet(BuildContext context) => Container();
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
/************************************************************************** */
                      child: AddTaskScreen(),
                      /*
                      AddTaskScreen(

                       ******************* No need for callback as using Provider ****************************
                          //attaching a callback to get the String from AddTaskScreen and add it into List
                          (newTaskTitle) {
                        //print(newTaskTitle);

                        // setState(() {
                        //   taskList.add(Task(name: newTaskTitle));
                        //   print(taskList);
                        // });
                        
                        Navigator.pop(
                            context); //this will remove the popup screen when button has been pressed
                      }),
                      */
/****************************************************************************** */
                    ),
                  ));

          /*
          By default, the BottomSheet will take up half the screen:
          isScrolledControlled : true - will make model to take the full screen

          To have the AddTaskScreen sit just above the keyboard, you can wrap it inside a SingleChildScrollView, which determines the padding at the bottom using a MediaQuery.

          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child:Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                )
              )
            );
          }
          */
        },
      ),
      body: Column(
        // it contains a Container of Column due to padding requirement
        // second child does not need any padding it's the white layout

        //by default the alignment is from center
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                /*
                Custom made circular background
                Container(
                  padding: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 40,
                  ),
                ),
                */
                SizedBox(height: 20),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  /*
                  '${taskList.length} tasks',
                  */
                  '${context.watch<TaskData>().getTaskLength} tasks', //as per provider 4
                  //proider 3 - Provider.of<TaskData>(context).tasksList
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // 2nd child
          Expanded(
            child: Container(
              // color: Colors.white,
              // if specified here then it will give error saying either color == null or decoration == null
              // this is because color: is short hand of creating a decoration with a color property inside it
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
/***************************************************************************** */
              child: TaskList(), //passing the taskList here
/****************************************************************************** */
            ),
          ),
        ],
      ),
    );
  }
}

/*
BottomSheet - that comes up from bottom
1. Persistent - shows information that supplements the primary content of the app
            - stays visible even user interact with other part of the app
2. Modal - Prevents the user from interacting with rest of the App
        - it comes up as a popup

  showModalBottomSheet -
  required - 1. context - look up the Navigator and Theme for the bottom sheet
             2. builder - Function that takes current Context and returns a Widget

*/
