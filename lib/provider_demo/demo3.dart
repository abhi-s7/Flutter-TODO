import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*

3. To Update certain Widget without having to pass data
  - to pass the data from MyTextField to MyText[parent Appbar] & Level3 without having to inntervene Otherlevels and build them
  - use class ChangeNotifier
    - comes from Flutter itself
    - It Notifies the Listeners to this particular class of any updates in the class
    - Use ChangeNotifierProvider instead of just provider
    - Type - of class which extends ChangeNotifier
    - return is object of the same class
  - To get data 
    - Provider.of(context).property
    - where property will be the instance variable of the class
  - To update the data
    - make a method in the class that ectends ChangeNotifier
    - change the memeber variable then
    - call notifyListeners() - so that any widget who is listening to the provider can rebuild their widgets as well


*/

class TopWidget extends StatelessWidget {
  // final String data =
  //     'Some Data'; //to pass this data to level3 widget we have to pass through constructors

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(), //return is object of Data class
      child: Scaffold(
        appBar: AppBar(
          title: MyText(),
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
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Text('L3 $data');
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        print(newText);
        // Provider.of<Data>(context).changeString(newText);// ::: Provider 3
        Provider.of<Data>(context, listen: false).changeString(
            newText); // :::but if specified listen to as false then it will work
        //context.read<Data>().changeString(newText);// As of Provider 4
        print('After');
        //as soon as we provide <Data> it then knows what class to trigger for providing
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some secret data';

  void sayHello() {
    print('hello called');
  }

  void changeString(String newText) {
    data = newText;
    print('Data is $data');
    notifyListeners();
  }
}
