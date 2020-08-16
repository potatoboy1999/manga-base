import 'package:flutter/material.dart';

import 'Library.dart';

class Login extends StatefulWidget{
  Login({Key key}):super(key:key);

  @override
  _LoginState createState()=> new _LoginState();
}

class _LoginState extends State<Login>{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Container(
        padding: EdgeInsets.all(20),
        color: Colors.black87,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: new Text('Log In',style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.green[600]),),
              ),
              new SizedBox(height: 15,),
              new Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: new Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width:MediaQuery.of(context).size.width-100,
                        child: new TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            labelText: 'Email',
                            hintStyle: TextStyle(fontSize: 12),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                      new Container(
                        width:MediaQuery.of(context).size.width-100,
                        child: new TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            hintStyle: TextStyle(fontSize: 12),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      new SizedBox(height: 25,),
                      new RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=> Library()));
                          }
                        },
                        child: Text('Enter'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          //
        ),
      ),
    );
  }
}