import 'package:the_tatto/appbar/searchresult.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/detailtabscreen/website.dart';
import 'package:the_tatto/drawerscreen/top_offers.dart';
import 'package:the_tatto/fragments/appoinment.dart';
import 'package:the_tatto/model/offerdata.dart';
import 'package:the_tatto/model/timedata.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new ConfirmBooking(),
  ));
}*/

class ConfirmBooking extends StatefulWidget {
  @override
  _ConfirmBooking createState() => new _ConfirmBooking();
}

class _ConfirmBooking extends State<ConfirmBooking> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  String _result = "paypal";
  int _radioValue = -1;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _result = "paypal";
          _sucesspayment(context,_radioValue);


          break;
        case 1:
          _result = "rozarpay";
          _sucesspayment(context,_radioValue);

          break;
        case 2:
          _result = "stripe";
          _sucesspayment(context,_radioValue);

          break;
      }
    });
  }

  List timedatalist = [
    {"time": "09:00AM",}, {"time": "09:30AM",}, {"time": "10:00AM",}, {"time": "10:30AM",}, {"time": "11:00AM",}, {"time": "11:30AM",},
    {"time": "12:00PM",}, {"time": "12:30PM",}, {"time": "01:00PM",}, {"time": "01:30PM",},
    {"time": "02:00PM",}, {"time": "02:30PM",}, {"time": "03:00PM",}, {"time": "03:30PM",},
    {"time": "04:00PM",}, {"time": "04:30PM",}, {"time": "05:00PM",}, {"time": "05:30PM",},
    {"time": "06:00PM",}, {"time": "06:30PM",}, {"time": "07:00PM",}, {"time": "07:30PM",},
    {"time": "08:00PM",}, {"time": "08:30PM",}, {"time": "09:00PM",}, {"time": "10:00PM",},
  ];
  int currentSelectedIndex;
  String categoryname;
  int _groupValue = -1;

  bool viewVisible = false;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  DateTime _currentDate = new DateTime.now();
  DateTime _currentDate2 = new DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];

  EventList<Event> _markedDateMap = new EventList<Event>();

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return new SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Book Appointment",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
           /* IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (ctxt) => new SearchResult()));

                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (ctxt) => new HomeScreen(0)));

                // do something
              },
            ),*/
          ],
        ),
        body: Scaffold(
            resizeToAvoidBottomInset: true,
            key: _drawerscaffoldkey,
            backgroundColor: Colors.white,
            //set gobal key defined above

            body: new Stack(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: new ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              color: Colors.white,
                              child: Text(
                                "Confirmation Your Booking",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),

                            Container(
                              height: 120,
                              margin: EdgeInsets.all(10),
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                height: 120,
                                // constraints: BoxConstraints.expand(),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFf1f1f1), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),

                                child: ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.only(
                                                left: 5.0, top: 0.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: new Container(
                                                    height: 70,
                                                    width: 70,
                                                    // width: screenwidth * .3,
                                                    // color: Colors.black,
                                                    alignment:
                                                        Alignment.topLeft,

                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/the_barber.jpg"),
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            Alignment.topCenter,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                new Container(
                                                    // height: 100.0,
                                                    width: screenwidth * .67,
                                                    height: 110,
                                                    margin: EdgeInsets.only(
                                                        left: 5.0, top: 0.0),
                                                    alignment:
                                                        Alignment.topLeft,
                                                    color: Colors.white,
                                                    child: ListView(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 25.0),
                                                            child: Text(
                                                              "Barberque",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'Montserrat'),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 5.0,
                                                                    left: 0.0),
                                                            child: Text(
                                                              "vishwashanti marg, near lnn, pune ",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily:
                                                                      'Montserrat'),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            children: <Widget>[
                                                             /* Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0.0,
                                                                          top:
                                                                              5.0),
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        WidgetSpan(
                                                                          child:
                                                                              Icon(
                                                                            Icons.star,
                                                                            size:
                                                                                14,
                                                                            color:
                                                                                Colors.yellow,
                                                                          ),
                                                                        ),
                                                                     *//*   TextSpan(
                                                                            text:
                                                                                "4.0 ",
                                                                            style: TextStyle(
                                                                                color: Colors.grey,
                                                                                fontSize: 11,
                                                                                fontWeight: FontWeight.w600)),
                                                                        TextSpan(
                                                                            text:
                                                                                "Rating",
                                                                            style: TextStyle(
                                                                                color: Colors.grey,
                                                                                fontSize: 11,
                                                                                fontWeight: FontWeight.w600)),*//*
                                                                      ],
                                                                    ),
                                                                  )),*/
                                                              /*Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 5.0,
                                                                height: 5.0,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5.0,
                                                                        top:
                                                                            5.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),*/
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0.0,
                                                                          top:
                                                                              5.0,
                                                                          right:
                                                                              0),
                                                                  child:
                                                                      RichText(
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textScaleFactor:
                                                                        1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        WidgetSpan(
                                                                          child:
                                                                              Icon(
                                                                            Icons.calendar_today,
                                                                            size:
                                                                                14,
                                                                            color:
                                                                                const Color(0xFFe06287),
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                            text:
                                                                                "06:00 pm - June 21,2020",
                                                                            style: TextStyle(
                                                                                color: Colors.grey,
                                                                                fontSize: 11,
                                                                                fontWeight: FontWeight.w600)),
                                                                      ],
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ))),
                                  ],
                                ),

                                // color: Colors.grey,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              color: Colors.white,
                              child: Text(
                                "Service You Selected",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 15.0,
                              ),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      'Simple Tattoo',
                                      style: TextStyle(
                                          color: const Color(0xFF999999),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '250  ₹',
                                      style: TextStyle(
                                          color: const Color(0xFF999999),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                                margin: EdgeInsets.only(
                                  top: 30.0,
                                  bottom: 10.0,
                                  left: 20.0,
                                  right: 15.0,
                                ),

                                // child: MySeparator(),
                                child: FDottedLine(
                                  color: Colors.grey,
                                  width: screenwidth * .8,
                                  strokeWidth: 1.0,
                                  dottedLength: 10.0,
                                  space: 1.0,
                                )),

                            Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 20),
                                child: FDottedLine(
                                  color: Color(0xFF5eb58f),
                                  strokeWidth: 2.0,
                                  dottedLength: 8.0,
                                  space: 3.0,
                                  corner: FDottedLineCorner.all(6.0),

                                  /// add widget
                                  child: Container(
                                    color: Color(0xFF80dcb4),
                                    width: screenwidth * .8,
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            'You have a coupon to use',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (ctxt) =>
                                                        new TopOffers()));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'Click here',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),

                            Container(
                              margin: EdgeInsets.only(
                                top: 20.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              color: Colors.white,
                              child: Text(
                                "Select Payment Method",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),

                            Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 20.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Image.asset(
                                      "images/paypal.png",
                                      width: 60,
                                      height: 40,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Radio(
                                      value: 0,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                      activeColor: Color(0xFFe06287),

                                      // selected: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 0.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Image.asset(
                                      "images/rozarpay.png",
                                      width: 60,
                                      height: 40,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Radio(
                                      value: 1,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                      activeColor: Color(0xFFe06287),
                                      // selected: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 0.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Image.asset(
                                      "images/stripe.png",
                                      width: 50,
                                      height: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Radio(
                                      value: 2,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                      activeColor: Color(0xFFe06287),
                                      // selected: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomView(),
                ),
              ], // new Container(child: Body(viewVisible))],
            )),
      ),
    );
  }

  void _sucesspayment(BuildContext context, int radioValue) {

    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                margin: EdgeInsets.only(top: 30, left: 15, bottom: 20),
                // height: screenHeight,

                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 1,
                ),
                // You can wrap this Column with Padding of 8.0 for better design
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0, left: 0.0),
                          alignment: FractionalOffset.center,
                          child: Image.asset(
                            "images/passwordchangedone.png",
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,

                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0, left: 15.0,right: 15),

                          child: Text(
                            "Your Appointment booking is successfully.",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                            maxLines: 2,
                            textAlign: TextAlign.center,



                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,

                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0, left: 15.0,right: 15),

                          child: Text(
                            "You can see your upcoming appointment in APPOINTMENT section",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,

                                fontSize: 14),
                            maxLines: 2,
                            textAlign: TextAlign.center,



                          ),
                        ),
                      ),

                      GestureDetector(

                        onTap: (){

                       _radioValue = -1;
                       Navigator.push(context,
                           new MaterialPageRoute(builder: (ctxt) => new Appoinment()));

                        },


                        child:  Align(
                          alignment: Alignment.center,

                          child: Container(
                            margin: const EdgeInsets.only(top: 40.0, left: 15.0,right: 15,bottom: 20),

                            child: Text(
                              "GO there",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,

                                  fontSize: 14),
                              maxLines: 2,
                              textAlign: TextAlign.center,



                            ),
                          ),
                        ),


                      ),









                    ]),
              );
            },
          );
        });
  }
}
