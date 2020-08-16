import 'package:flutter/material.dart';

class dialogs{
  alert(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alerta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Descripción')],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Ok'),
            )
          ],
        );
      }
    );
  }
}

class my_dialogs {
  alert(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: new Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Título'),
                  new SizedBox(height: 10,),
                  new FlatButton(
                    color: Colors.blue[300],
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: new Text('Ok'),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  confirm(BuildContext context){

  }
}