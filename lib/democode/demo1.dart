/*
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
        appBar: AppBar(
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
        ),
        body: Scaffold(

            resizeToAvoidBottomInset: true,

            //second scaffold
            key: _drawerscaffoldkey,

            //set gobal key defined above


            drawer: new DrawerOnly(),


*/
/*            drawer: Drawer(
              child:Container(
                color: Colors.white,
                child: ListView(


             children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 0.0, top: 10.0),
                  color: Colors.white,
                  alignment: Alignment.center,
                  height: 80,
                  width: double.infinity,
                  child: Text(
                    'Hii, Darshi Patel',
                    style: TextStyle(
                        color: Colors.black,

                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                Container(

                    height: 0,
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    )
                ),
                Container(

                  alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),

                    child: ListTile(



                      title: Text(

                        'Top Offers',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),



                      ),
                      onTap: () {
                      },

                    )




                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0, top: 0.0),

                    child: ListTile(
                        title: Text(
                          'Top Services',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      onTap: () {
                          print('hii');
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (ctxt) => new FirstFragment()));
                },

                    )
                ),

                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0, top: 0.0),

                    child: ListTile(
                        title: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        )
                    )
                ),

                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0, top: 0.0),

                    child: ListTile(
                        title: Text(
                          'Privacy & Policy',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        )
                    )
                ),

                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0, top: 0.0),

                    child: ListTile(
                        title: Text(
                          'Invite a friends',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        )
                    )
                ),

                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0, top: 0.0),

                    child: ListTile(
                        title: Text(
                          'About',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        )
                    )
                ),

              ],
              // Drawer content here
              // design your own drawer menu here.
            )
    )
    ),*//*










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
