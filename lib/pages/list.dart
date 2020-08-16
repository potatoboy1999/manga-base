import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_first_app/constants.dart';

class ListPage extends StatefulWidget{
  ListPage({Key key}):super(key:key);

  @override
  _ListPageState createState()=>_ListPageState();
}

class _ListPageState extends State<ListPage>{
  List list_data = [];

  void _requestList() async{
    var url = apiUrl + "list/get";
    var response =  await http.get(url, headers: {"Content-Type": "application/json"});
    var callback = json.decode(response.body);

    this.setState(() {
      list_data = callback['items'];
    });
    return;
  }

  void initState(){
    _requestList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[400]
      ),
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Row(children: <Widget>[
              new SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-56,
                child: loadList(),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget loadList(){
    print(list_data.length);
    return list_data.length == 0? buildListEmpty() : buildListFull();
  }

  Widget buildListEmpty(){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: new Container(
            padding: EdgeInsets.all(10),
            child: new Text('No hay negocios encontrados'),
          ),
        );
      }
    );
  }
  Widget buildListFull(){
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list_data?.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.all(10),
            child: new Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: new Column(
                children: <Widget>[
                  new Text(list_data[index]['title'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  new Text(list_data[index]['description']),
                ],
              ),
            ),
          );
        }
    );
  }
}