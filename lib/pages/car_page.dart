import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/Counter.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Number(),
          MyButton()
        ],
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(builder: (context, child, counter) {
        return Text("${counter.value}");
      }),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Provide.value<Counter>(context).increment();
      },
      child: Text("递增"),
    );
  }
}
