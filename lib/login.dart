import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

import 'layout.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key key}):super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  FacebookLogin fbLogin = new FacebookLogin();

  void _connectFB() {
    print('conectando FB');
    var permissions = ['email', 'public_profile'];
    fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    fbLogin
        .logInWithReadPermissions(permissions)
        .then(postCallFB)
        .catchError((e) {
      print('ERROR:');
      print(e);
    });
  }
  void postCallFB(response) {
    switch (response.status) {
      case FacebookLoginStatus.loggedIn:
        var token = response.accessToken.token;
        print('log in success');
        http
            .get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${token}')
            .then(validateFB);
        break;
      case FacebookLoginStatus.cancelledByUser:
      //  Log In Cancelled!
        print('log in cancelled');
        break;
      case FacebookLoginStatus.error:
      //  Facebook ERROR!
        print('facebook error');
        print(response.errorMessage);
        break;
    }
  }
  void validateFB(graphResponse) async{
    var data = graphResponse.body;
    var url = "http://proyect.com/user/fb/validate";
/*
    await http
        .post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then(postCallBackFB);*/
  }
  void postCallBackFB(response) {
    var callback = json.decode(response.body);
    Navigator.pop(context);
    if (callback['status'] == 'ok') {
      // se ejecutará si API manda un status de OK
      print('OK');
    } else {
      print('ERROR');
      // se ejecutará si API no manda un status de OK
    }
  }

  void _attemptLogin(){
    login();
    return;
  }

  void login(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context)=>MainLayout()
        )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Form(
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                        )
                    ),
                  ),
                  new SizedBox(height: 15,),
                  new TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                        )
                    ),
                    obscureText: true,
                  )
                ],
              ),
            ),
            new SizedBox(height: 20,),
            new FlatButton(
                onPressed: _attemptLogin,
                color: Colors.blue[500],

                child: new Text('Log In',style: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}