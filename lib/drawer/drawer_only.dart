import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/drawerscreen/about.dart';
import 'package:the_tatto/drawerscreen/privacypolicy.dart';
import 'package:the_tatto/drawerscreen/tems_condition.dart';
import 'package:the_tatto/drawerscreen/top_offers.dart';
import 'package:the_tatto/drawerscreen/top_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share/share.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/screens/location_demo.dart';
import 'package:the_tatto/screens/loginscreen.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/utils/routes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';


class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    final _notifier = Provider.of<AuthViewModel>(ctxt);
    return new Drawer(

        //   enableOpenDragGesture: true,
        // dragStartBehavior:,

/*        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("DRAWER HEADER.."),
              decoration: new BoxDecoration(
                  color: Colors.orange
              ),
            ),
            new ListTile(
              title: new Text("Item => 1"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstFragment()));
              },
            ),
            new ListTile(
              title: new Text("Item => 2"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstFragment()));
              },
            ),
          ],
        )*/

        child: Container(
      color: Colors.black,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0.0, top: 10.0),
            color: Colors.black,
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            child: Text(
              'User Name',
              //     'UserName',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ),
          Container(
              height: 0,
              child: Divider(
                color: Colors.white,
                thickness: 1,
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "images/home.svg",
                        color: Colors.white,
                      ),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    ctxt,
                    MaterialPageRoute(builder: (context) => HomeScreen(0)),

                    // var savedValue = preferences.getString('value_key');
                  );
                },
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset("images/top_offers.svg",
                          color: Colors.white),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Top Offers',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                onTap: () {
                   Navigator.push(ctxt,
                          new MaterialPageRoute(builder: (ctxt) =>  TopOffers()));

                //  Navigator.pushNamed(ctxt, Constants.ROUTE_SIGN_IN_PAGE);


                },
              )),
          // Container(
          //     alignment: Alignment.centerLeft,
          //     margin: EdgeInsets.only(left: 10.0, top: 0.0),
          //     child: ListTile(
          //       title: Row(
          //         children: [
          //           Container(
          //             child: SvgPicture.asset("images/top_services.svg",
          //                 color: Colors.white),
          //             width: 20,
          //             height: 20,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             'Top Services',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w600,
          //                 fontFamily: 'Montserrat'),
          //           ),
          //         ],
          //       ),
          //       onTap: () {
          //         Navigator.push(
          //             ctxt,
          //             new MaterialPageRoute(
          //                 builder: (ctxt) => new TopService(0, "Explore All")));
          //       },
          //     )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, top: 0.0),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset("images/terms-and-conditions.svg",
                          color: Colors.white),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new TermsCondition()));
                },
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, top: 0.0),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset("images/privacy.svg",
                          color: Colors.white),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Privacy & Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new PrivacyPolicy()));
                },
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, top: 0.0),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset("images/invitation.svg",
                          color: Colors.white),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Invite a friends',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                onTap: () {
                  Share.share('the barber app link');
                },
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, top: 0.0),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset("images/about.svg",
                          color: Colors.white),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(ctxt,
                      new MaterialPageRoute(builder: (ctxt) => new SelectListItem()));
                },
              )),
          // Container(
          //     alignment: Alignment.centerLeft,
          //     margin: EdgeInsets.only(left: 10.0, top: 0.0),
          //     child: ListTile(
          //       title: Row(
          //         children: [
          //           Container(
          //             child: SvgPicture.asset("images/logout.svg",
          //                 color: Colors.white),
          //             width: 20,
          //             height: 20,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             'Logout',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w600,
          //                 fontFamily: 'Montserrat'),
          //           )
          //         ],
          //       ),
          //       onTap: ()  async {
          //         // SharedPreferences preferences = await SharedPreferences.getInstance();
          //         // await preferences.clear();
          //
          //         // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //         //     LoginScreen()), (Route<dynamic> route) => false);
          //
          //         // Navigator.pop(context);
          //
          //         await _notifier.getUserLogout();
          //         if(_notifier.isLogout){
          //           SharedPreferences preferences = await SharedPreferences.getInstance();
          //           await preferences.clear();
          //           Navigator.pop(ctxt);
          //           Navigator.of(ctxt).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //               LoginScreen()), (Route<dynamic> route) => false);
          //           print("------------------- ok-----------------");
          //         }else{
          //           print("-------------------not ok-----------------");
          //         }
          //
          //
          //       }
          //     )),
        ],
        // Drawer content here
        // design your own drawer menu here.
      ),
    ));
  }
  showProcessBar(BuildContext context) {
    AlertDialog alert = AlertDialog(
        backgroundColor: Color(0x01000000),
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        content: Container(
          height: 50,
          child: SpinKitWave(
            color: Colors.white,
            size: AppSizes.appVerticalLg * 0.55,
          ),
        ));
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

