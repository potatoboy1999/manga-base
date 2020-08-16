import 'package:flutter/material.dart';
import 'package:my_first_app/dialogs.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key}):super(key:key);

  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton(
              onPressed: (){
                print('--');
                dialogs().alert(context);
              },
              color: Colors.white,
              child: new Text('Show Native Alert')
          ),
          new FlatButton(
              onPressed: (){
                print('--');
                my_dialogs().alert(context);
              },
              color: Colors.white,
              child: new Text('Show Custom Alert')
          ),/*
          new FlatButton(
              onPressed: (){print('--');},
              color: Colors.white,
              child: new Text('Show Custom Confirm')
          ),*/
        ],
      ),
    );
  }
}