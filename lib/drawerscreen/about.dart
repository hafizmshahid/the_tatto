import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';


/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new About(),
  ));
}*/

class About extends StatefulWidget {
  @override
  _About createState() => new _About();
}

class _About extends State<About> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child:  Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor:kAppPrimaryColor,
        appBar: appbar(context, 'About App', _drawerscaffoldkey,false),
        key: _drawerscaffoldkey,
        drawer: new DrawerOnly(),
        body: new Stack(children: <Widget>
        [




/*
          new Container(
            alignment: Alignment.center,
            // transform: Matrix4.translationValues(-50.0, -50.0, 0.0),


            child: Center(

              child: Image.asset("images/about.png"),



            ),
          ),*/

               new Container(
              alignment: Alignment.center,

              transform: Matrix4.translationValues(0.0, -15.0, 0.0),


              child: Center(

                child: Text("TATOO.",  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat'),),




              ),
            ),

            new Container(
              alignment: Alignment.topCenter,
              transform: Matrix4.translationValues(15.0, 15.0, 0.0),


              child: Center(

                child: Text("Version 01.0.00",  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),),




              ),
            ),

          new Container(
              alignment: Alignment.bottomCenter,


              child: Body()
          ),





        ]

        )


        ,
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: CustomView(),
      ),
    );
  }
}
