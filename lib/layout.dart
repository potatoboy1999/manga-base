import 'package:flutter/material.dart';

import 'constants.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
import 'pages/list.dart';

class MainLayout extends StatefulWidget{
  MainLayout({Key key}):super(key:key);

  @override
  _MainLayoutState createState()=> _MainLayoutState();
}


class _MainLayoutState extends State<MainLayout>{
  int _currentIndex = 0;

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
        break;
      case 1:
        return ListPage();
        break;
      case 2:
        return ProfilePage();
        break;
      default:
        return HomePage();
    }
  }
  var colors =[
    Colors.blue,
    Colors.red[400],
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        fixedColor: colors[_currentIndex],
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Inicio')),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Lista')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil')),
        ],
      ),
    );
  }
}