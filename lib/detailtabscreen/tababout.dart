import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/detailtabscreen/website.dart';
import 'package:the_tatto/screens/directiondestination.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_constant.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'package:url_launcher/url_launcher.dart';


/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new TabAbout(),
  ));
}*/

class TabAbout extends StatefulWidget {
  final String name;

  const TabAbout({Key key, this.name}) : super(key: key);

  @override
  _TabAbout createState() => new _TabAbout();
}

class _TabAbout extends State<TabAbout> {
  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;
    final _notifier = Provider.of<AuthViewModel>(context);

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kAppPrimaryColor,
          body: Padding(
              padding: EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 50),

              // padding: EdgeInsets.all(10),
              child:!_notifier.isAboutDataList
                  ? Expanded(
                child: Center(
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ):

              Container(
                child: _notifier.aboutDataList.length ==0 ?Expanded(child:Center(child: Text(
                  "Not Found",
                  style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 15),
                ),) ):ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 11, top: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'About ${widget.name}',
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
                        "${_notifier.aboutDataList[0].servicesDetail[0].servicesName}",
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
                            child: _notifier.aboutDataList[0].sundayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ): Text(
                              '${_notifier.aboutDataList[0].sundayOpeningTime} to ${_notifier.aboutDataList[0].sundayCLoseTime} ',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            )
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
                            child: _notifier.aboutDataList[0].mondayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ):Text(
                              '${_notifier.aboutDataList[0].mondayOpeningTime} to ${_notifier.aboutDataList[0].mondayCLoseTime}',
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
                            child:  _notifier.aboutDataList[0].tuesdayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ):Text(
                              '${_notifier.aboutDataList[0].tuesdayOpeningTime} to ${_notifier.aboutDataList[0].tuesdayCLoseTime}',
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
                            child:  _notifier.aboutDataList[0].wednesdayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ):Text(
                              '${_notifier.aboutDataList[0].wednesdayOpeningTime} to ${_notifier.aboutDataList[0].wednesdayCLoseTime}',
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
                            child:_notifier.aboutDataList[0].thursdayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ): Text(
                                '${_notifier.aboutDataList[0].thursdayOpeningTime} to ${_notifier.aboutDataList[0].thursdayCLoseTime}',
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
                            child:_notifier.aboutDataList[0].fridayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ): Text(
                                '${_notifier.aboutDataList[0].fridayOpeningTime} to ${_notifier.aboutDataList[0].fridayCLoseTime}',
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
                            child:_notifier.aboutDataList[0].saturdayOpeningTime ==null ?Text(
                              '$kClosed',
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat'),
                            ): Text(
                              '${_notifier.aboutDataList[0].saturdayOpeningTime} to ${_notifier.aboutDataList[0].saturdayCLoseTime}',
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
                                      "${_notifier.aboutDataList[0].shopArtistNameDetail.location}",
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
                                                  child: Text("${_notifier.aboutDataList[0].shopArtistNameDetail.distance}",
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

                                                InkWell(
                                                  onTap: (){
                                                    launchURL(_notifier.aboutDataList[0].shopArtistNameDetail.latitude,_notifier.aboutDataList[0].shopArtistNameDetail.longitude);
                                                  },
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
                                '${_notifier.aboutDataList[0].website}',
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
                                launch(('tel://${_notifier.aboutDataList[0].phoneNumber}'));



                              },
                              child: Text(
                                '${_notifier.aboutDataList[0].phoneNumber}',
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
                ) ,
              ))),
    );
  }

  launchURL(String lat,String lng) async {

     final String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
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
