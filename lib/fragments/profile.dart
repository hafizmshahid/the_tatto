import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/drawerscreen/top_offers.dart';
import 'package:the_tatto/fragments/editprofile.dart';
import 'package:the_tatto/model/appointmentdata.dart';
import 'package:the_tatto/model/doneappointmentData.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';



/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Profile(),
  ));
}*/

class Profile extends StatefulWidget {
  @override
  _Profile createState() => new _Profile();
}

class _Profile extends State<Profile> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  List appoinmentdatalist = [
    {
      "discount": "10%",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
    // {"discount": "50%", "dark_color": const Color(0xFFb5b8ff), "light_color": const Color(0xFFc8caff)},
    // {"discount": "30%", "dark_color": const Color(0xFFffb5b5), "light_color": const Color(0xFFffc8c8)},
  ];


  List appoinmentdatalist1 = [
    {
      "discount": "10%",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
    {"discount": "50%", "dark_color": const Color(0xFFb5b8ff), "light_color": const Color(0xFFc8caff)},
    {"discount": "30%", "dark_color": const Color(0xFFffb5b5), "light_color": const Color(0xFFffc8c8)},
  ];

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    String name=json.decode(_notifier.profileResponseSharePreference)['username'];

    // TODO: implement build
    return new SafeArea(
      child: Scaffold(
        appBar: appbar(context, 'Profile', _drawerscaffoldkey,false),
        resizeToAvoidBottomInset: true,
        key: _drawerscaffoldkey,
        backgroundColor: kAppPrimaryColor,
        //set gobal key defined above

        drawer: new DrawerOnly(),
        body: new Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: const Color(0xFFf1f1f1), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(
                          "${json.decode(_notifier.profileResponseSharePreference)['image']}",
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "$name",
                            style: TextStyle(
                                color:kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),


                      InkWell(
                        onTap: (){

                          Navigator.push(context,
                              new MaterialPageRoute(builder: (ctxt) => new EditProfile()));

                        },


                        child:   Container(
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "images/edit.svg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 10, top: 25),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                        color: kPrimaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'Montserrat'),
                  ),
                ),

                Container(
                  child: GestureDetector(
                    onTap: () {
                      print('item clicked');
                    },

                    child: Column(

                      children: <Widget>[

                        Container(

                          child:ListView.builder(


                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),


                            itemBuilder: (BuildContext context, int index) {
                              return new AppointmentData(
                                discount: appoinmentdatalist[index]['discount'],
                                dark_color: appoinmentdatalist[index]['dark_color'],
                                light_color: appoinmentdatalist[index]['light_color'],
                              );
                            },
                            itemCount: 1,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10, top: 25),
                          alignment: Alignment.topLeft,

                          child: Text(
                            "Appointment ' s History",
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 20),

                          child:ListView.builder(


                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),


                            itemBuilder: (BuildContext context, int index) {
                              return new DoneAppointmentData(
                                discount: appoinmentdatalist1[index]['discount'],
                                dark_color: appoinmentdatalist1[index]['dark_color'],
                                light_color: appoinmentdatalist1[index]['light_color'],
                              );
                            },
                            itemCount: appoinmentdatalist1.length,
                          ),
                        ),







                      ],

                    ),




                  ),

                ),
                //
                // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
