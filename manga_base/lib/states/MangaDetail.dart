import 'package:flutter/material.dart';

class MangaDetail extends StatefulWidget{
  MangaDetail({Key key}):super(key:key);

  _MangaDetailState createState()=> _MangaDetailState();
}

class _MangaDetailState extends State<MangaDetail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Color(0xffb2e2e2e),
        child: Column(
          children: <Widget>[
            new SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image(image: AssetImage('images/manga_default.jpg'),fit: BoxFit.cover,),
            ),
            new SizedBox(height: 10,),
            new Container(
              child: Text('Manga Title',style: TextStyle(color:Colors.green,fontSize: 25,),),
            ),
            new SizedBox(height: 10,),
            new Container(
              width: MediaQuery.of(context).size.width-50,
              height: 250,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                //color: Colors.blue,
                border: Border.all(width: 1,color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}