class Task{
  final String name;//since it is final it will give error that it is not being declared
  //but as soon the constructor is created the error gets resolved
  //as final variables can be initialized using constructor
  //due to the fact that final are run time constants 
  
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone(){
    isDone = !isDone;
  }
}