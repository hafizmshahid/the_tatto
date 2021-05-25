import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bottombar.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomeScreen(2),
  ));
}*/

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int index;

  HomeScreen(this.index);

  @override
  _HomeScreen createState() => new _HomeScreen();
}

Future<void> getdata() async {
  var preferences = await SharedPreferences.getInstance(); //
  var savedValue = preferences.getString('email');
  print("SavedValue:$savedValue");
}

class _HomeScreen extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Future<void> initState() {
    super.initState();

    getdata();

    // e a value
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

    return new Scaffold(

        // backgroundColor: Colors.white,
        // appBar: appbar(context, 'Home',_drawerscaffoldkey),
        resizeToAvoidBottomInset: false,
        body: Scaffold(
      resizeToAvoidBottomInset: true,

      //second scaffold
      key: _drawerscaffoldkey,

      //set gobal key defined above

      drawer: DrawerOnly(),

      bottomNavigationBar: new BottomBar(widget.index),

    ));
  }
}
