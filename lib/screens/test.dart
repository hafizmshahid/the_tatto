import 'dart:async';
import 'package:flutter/material.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Test(),
  ));
}*/

class Test extends StatefulWidget {
  @override
  _Test createState() => new _Test();
}

class _Test extends State<Test> {
  String _selectedCountryCode = '+91';
  List<String> _countryCodes = ['+91', '+23', '+8'];
  FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return new Scaffold(

      body
          : Scaffold(
        key: scaffoldKey,
        drawer: new Drawer(
          child: new ListView(),
        ),
        body: Stack(
          children: <Widget>[
            new Center(
                child: new Column(
                  children: <Widget>[

                  ],
                )),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
            Container(  alignment: FractionalOffset.topCenter,
              margin: const EdgeInsets.only(top: 35.0, left: 10.0),
              child:Text(
                "The",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            )

          ],
        ),
      ),

    );


  }
}
