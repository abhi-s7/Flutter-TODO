import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
1. Expose the data - i.e. telling what the data we are providing
          - achieved using widget
          - therefore wrap parent with widget - Provider 
          - specify datatype i.e. the kind of data that this provider provides
          - create: takes the current build context so that it knows where it is within the widget tree
          - finally return the data that needs to be available to all the children

2. To access the data - Provider.of(context)
          - of method expects to specify what kind of data 
          - therefore Provider.of<Type>(context)

3. To Update certain Widget without having to pass data - demo3.darts

*/

class TopWidget extends StatelessWidget {
  final String data =
      'Some Data'; //to pass this data to level3 widget we have to pass through constructors

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (BuildContext context) => data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(data),
        ),
        body: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  // final String data;
  // Level1(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Text('L3 $data');
    return Text(Provider.of<String>(context));
  }
}
