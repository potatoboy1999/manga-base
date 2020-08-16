import 'package:flutter/material.dart';
import 'MangaDetail.dart';

class Library extends StatefulWidget{
  Library({Key key}):super(key:key);

  _LibraryState createState()=> new _LibraryState();
}

class _LibraryState extends State<Library>{
  final GlobalKey _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/reading_manga.png'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Library'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('LogOut'),
              onTap: null,
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text('Library',style: TextStyle(color: Colors.green[400]),),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context)=> IconButton(
            icon: Icon(Icons.menu,color: Colors.green,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

      ),
      body: Container(
        padding: EdgeInsets.all(5),
        color: Color(0xffb2e2e2e),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:new GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index){
            return GestureDetector(
              child: new Card(
                elevation: 10.0,
                child: new Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/manga_default.jpg'),fit: BoxFit.cover),
                  ),
                  child: new Text('Manga $index', style: TextStyle(color: Colors.green, fontSize: 16),),
                ),
              ),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MangaDetail())),
            );
          }),
        ),
        //Text('Welcome!', style: TextStyle(color: Colors.green[400]),),
      ),
    );
  }
}