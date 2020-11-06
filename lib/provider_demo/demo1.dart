import 'package:flutter/material.dart';

class TopWidget extends StatelessWidget {
  final String data = 'Some Data';//to pass this data to level3 widget we have to pass through constructors

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            title: Text(data),
          ),
          body: Level1(data),
        );
  }
}


class Level1 extends StatelessWidget {
  final String data;
  Level1(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(data),
    );
  }
}

class Level2 extends StatelessWidget {
  final String data;
  Level2(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(data),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  final String data;
  Level3(this.data);

  @override
  Widget build(BuildContext context) {
    return Text('L3 $data');
  }
}

/*
In this App there are 3 levels of widgets and with each level it means they are children of one above level
Main -> Level 1 -> Level2 -> Level3 
Thus in order to pass data from Main to Level3 we have to traverse the Tree and then pass the data
which is painful and not efficient way and it is complex

In Reactive Programming it is known as Prop Drilling
     - Drilling through the tree inorder to pass down the property

Solution - demo2.dart

*/