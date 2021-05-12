/*
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer/drawer_only.dart';
import 'fragments/top_services.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomeScreen(),
  ));
}
class DrawerItem {
  String title;
  DrawerItem(this.title);
}


class HomeScreen extends StatefulWidget { final drawerItems = [
  new DrawerItem("Fragment 1"),
  new DrawerItem("Fragment 2"),
  new DrawerItem("Fragment 3")
];

@override
_HomeScreen createState() => new _HomeScreen();
}




class _HomeScreen extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

        backgroundColor: Colors.white,
        appBar: appbar(context, 'Home',_drawerscaffoldkey),


        */
/*  AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              //on drawer menu pressed
              if (_drawerscaffoldkey.currentState.isDrawerOpen) {
                //if drawer is open, then close the drawer
                Navigator.pop(context);
              } else {
                _drawerscaffoldkey.currentState.openDrawer();
                //if drawer is closed then open the drawer.
              }
            },
            icon: Icon(Icons.menu),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),*//*

        body: Scaffold(

            resizeToAvoidBottomInset: true,

            //second scaffold
            key: _drawerscaffoldkey,

            //set gobal key defined above


            drawer: new DrawerOnly(),
            body: SingleChildScrollView(
              child: Container(


                color: Colors.white,


                child: Text("hii"),

              ),

              // your main content
            )
        )
    );
  }




}
*/
