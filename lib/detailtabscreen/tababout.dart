import 'package:flutter_svg/svg.dart';
import 'package:the_tatto/detailtabscreen/website.dart';
import 'package:the_tatto/screens/directiondestination.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';


/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new TabAbout(),
  ));
}*/

class TabAbout extends StatefulWidget {
  @override
  _TabAbout createState() => new _TabAbout();
}

class _TabAbout extends State<TabAbout> {
  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kAppPrimaryColor,
          body: Padding(
              padding: EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 50),

              // padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 11, top: 1),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About Barberque',
                      style: TextStyle(
                          color: kPrimaryTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                      " Lorem Ipsum has been the industry's standard dummy text ever since"
                      " the 1500s, when an unknown printer took a galley of type and scrambled it "
                      "also the leap into electronic typesetting, remaining essentially unchanged."
                      "Lorem Ipsum passages, and more recently with desktop publishing software like"
                      " Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(
                          color:kPrimaryTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Service on Days',
                      style: TextStyle(
                          color:kPrimaryTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Sunday',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9:00am to 10:00pm',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Monday',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9:00am to 10:00pm',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Tuesday',
                            style: TextStyle(
                                color:kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9:00am to 10:00pm',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Wednesday',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9:00am to 10:00pm',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Thursday',
                            style: TextStyle(
                                color:kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9:00am to 10:00pm',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Friday',
                            style: TextStyle(
                                color:kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9:00am to 10:00pm',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Saturday',
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Close',
                            style: TextStyle(
                                color:kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Location',
                      style: TextStyle(
                          color: kPrimaryTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                    width: double.infinity,
                    height: 100,
                    color: kAppPrimaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        new Container(
                          height: 70,
                          width: 70,
                          //  margin: EdgeInsets.only(left: 10),
                          // color: Colors.black,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage("images/maplocation.jpg"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  alignment: Alignment.topCenter,
                                  // width: MediaQuery.of(context).size *widget ,

                                  child: Text(
                                    "Vishwashanti marg, near green lnn fast food, pune",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color:kPrimaryTextColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 2,
                                      // color: Colors.black,

                                      child: MySeparator(),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, left: 20, right: 00),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: kAppPrimaryColor,
                                        alignment: Alignment.topRight,
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.start,

                                          children: <Widget>[


                                            Container(
                                              margin: EdgeInsets.only(top: 1),

                                              child: Container(
                                                margin: EdgeInsets.only(top: 2,left:5),
                                                child: SvgPicture.asset("images/location_icon.svg",width: 10,height: 10,



                                                ),
                                              ),
                                            ),

                                            Container(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 2,left:5),
                                                child: Text("0.05 km",
                                                    style: TextStyle(color: kPrimaryTextColor,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,fontFamily: 'Montserrat')),
                                              ),



                                            ),








                                          ],

                                        ),



                                      ),



                                      GestureDetector(

                                        onTap: (){
                                          // Navigator.push(context,
                                          //     new MaterialPageRoute(builder: (ctxt) => new DirectionDest()));




                                        },

                                        child:Container(

                                          alignment: Alignment.topRight,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.start,

                                            children: <Widget>[


                                              Container(
                                                margin: EdgeInsets.only(top: 1),

                                                child: Container(
                                                  margin: EdgeInsets.only(top: 2,left:5),
                                                  child: SvgPicture.asset("images/direction.svg",width: 10,height: 10,



                                                  ),
                                                ),
                                              ),

                                              Container(
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 2,left:5),
                                                  child: Text("See the direction",
                                                      style: TextStyle(color: const Color(0xFF4a92ff),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,fontFamily: 'Montserrat')),
                                                ),



                                              ),








                                            ],

                                          ),



                                        ),



                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Contact Information',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Row(


                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          alignment: Alignment.topRight,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: <Widget>[


                              Container(
                                margin: EdgeInsets.only(top: 1),

                                child: Container(
                                  margin: EdgeInsets.only(top: 2,left:5),
                                  child: SvgPicture.asset("images/website.svg",width: 12,height: 12,



                                  ),
                                ),
                              ),

                              Container(
                                child: Container(
                                  margin: EdgeInsets.only(top: 2,left:5),
                                  child: Text("Website",
                                      style: TextStyle(color: const Color(0xFFe06287),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,fontFamily: 'Montserrat')),
                                ),



                              ),








                            ],

                          ),



                        ),


                        Container(


                          child:GestureDetector(

                            onTap: (){

                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (ctxt) => new WebSite()));

                            },


                            child: Text(
                              'Visit the Website',
                              style: TextStyle(
                                  color: const Color(0xFF4a92ff),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ),

                        )

                        ),




                      ],
                    ),
                  ),



                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15,bottom: 10),
                    child: Row(


                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          alignment: Alignment.topRight,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: <Widget>[


                              Container(
                                margin: EdgeInsets.only(top: 1),

                                child: Container(
                                  margin: EdgeInsets.only(top: 2,left:5),
                                  child: SvgPicture.asset("images/phone.svg",width: 12,height: 12,



                                  ),
                                ),
                              ),

                              Container(
                                child: Container(
                                  margin: EdgeInsets.only(top: 2,left:5),
                                  child: Text("Call",
                                      style: TextStyle(color: const Color(0xFFe06287),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,fontFamily: 'Montserrat')),
                                ),



                              ),








                            ],

                          ),



                        ),


                        Container(


                          child:GestureDetector(
                            onTap: (){

                                 // UrlLauncher.launch('tel:+${p.phone.toString()}');
                              // launch(('tel://${item.mobile_no}'))
                              launch(('tel://1234567890'));



                            },
                            child: Text(
                              '+91 1234567890',
                              style: TextStyle(
                                  color: const Color(0xFF4a92ff),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ),





                        ),


                        ),




                      ],
                    ),
                  ),



                ],
              ))),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(

          // child: CustomView(),

          ),
    );
  }
}
