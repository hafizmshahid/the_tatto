import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/apiservice/StripeTransactionResponse.dart';
import 'package:the_tatto/appbar/searchresult.dart';
import 'package:the_tatto/common/ZButtonRaised.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/detailtabscreen/website.dart';
import 'package:the_tatto/model/offerdata.dart';
import 'package:the_tatto/model/timedata.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'confirmbooking.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new BookApointment(),
  ));
}*/

class BookApointment extends StatefulWidget {
  @override
  _BookApointment createState() => new _BookApointment();
}

class _BookApointment extends State<BookApointment> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  List timedatalist = [
    {
      "time": "09:00AM",
    },
    {
      "time": "09:30AM",
    },
    {
      "time": "10:00AM",
    },
    {
      "time": "10:30AM",
    },
    {
      "time": "11:00AM",
    },
    {
      "time": "11:30AM",
    },
    {
      "time": "12:00PM",
    },
    {
      "time": "12:30PM",
    },
    {
      "time": "01:00PM",
    },
    {
      "time": "01:30PM",
    },
    {
      "time": "02:00PM",
    },
    {
      "time": "02:30PM",
    },
    {
      "time": "03:00PM",
    },
    {
      "time": "03:30PM",
    },
    {
      "time": "04:00PM",
    },
    {
      "time": "04:30PM",
    },
    {
      "time": "05:00PM",
    },
    {
      "time": "05:30PM",
    },
    {
      "time": "06:00PM",
    },
    {
      "time": "06:30PM",
    },
    {
      "time": "07:00PM",
    },
    {
      "time": "07:30PM",
    },
    {
      "time": "08:00PM",
    },
    {
      "time": "08:30PM",
    },
    {
      "time": "09:00PM",
    },
    {
      "time": "10:00PM",
    },
  ];
  int currentSelectedIndex;
  String categoryname;

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
  String _currentMonth = DateFormat.yMd().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  _onTapImage(BuildContext context,String msg) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Transaction Alert'),
          content:Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$msg",style: TextStyle(fontSize: 20),overflow:TextOverflow.ellipsis ,),
                SizedBox(height: 30,),
                ZButtonRaised(
                  text: 'Done',
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  onTap: () => Navigator.pop(context),),
              ],
            ),
          ),
        ));
  }

//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];

  EventList<Event> _markedDateMap = new EventList<Event>();
  //   payViaNewCard(BuildContext context,int price) async {
  //     print("----------------$price---------------");
  //   ProgressDialog dialog = new ProgressDialog(context);
  //   dialog.style(message: 'Please wait...');
  //   await dialog.show();
  //   var response = await StripeService.payWithNewCard(amount: '$price', currency: 'EUR',context: context);
  //   await dialog.hide();
  //   Scaffold.of(context).showSnackBar(SnackBar(
  //     content: Text(response.message),
  //     duration:
  //     new Duration(milliseconds: response.success == true ? 1200 : 3000),
  //   ));
  //   _onTapImage(context,response.message);
  //
  // }
  @override
  void initState() {
    // TODO: implement initState
   // StripeService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.white,

      viewportFraction: 1,
      dayPadding: .5,
      daysTextStyle: TextStyle(color: Colors.black, fontSize: 11),
      selectedDayButtonColor: Colors.blue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      thisMonthDayBorderColor: Colors.white,
      weekFormat: false,
      weekdayTextStyle: TextStyle(color: Colors.black),
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: screenHeight * .40,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.blue)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 11,
        color: Colors.blue,
      ),
      showHeader: false,
      selectedDayBorderColor: Colors.blue,

      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),

      todayButtonColor: Colors.white,

      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 11,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 11,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    final _notifier = Provider.of<AuthViewModel>(context);

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
              if (viewVisible == false) {
                Navigator.of(context).pop();
              }

              if (viewVisible == true) {
                // print(viewVisible);
                currentSelectedIndex = -1;
                hideWidget();
              }

              /*  if (viewVisible = true) {
                    viewVisible = false;

                    hideWidget();
                  } else if(viewVisible = false) {
                    print(viewVisible);
                    Navigator.of(context).pop();
                  }*/
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
            /*    IconButton(
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
                                top: 1.0,
                                left: 15,
                                right: 15,
                              ),
                              color: Colors.white,
                              height: screenHeight * .5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  //custom icon
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: _calendarCarousel,
                                  ),
                                  // This trailing comma makes auto-formatting nicer for build methods.
                                  //custom icon without header
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 00.0,
                                      bottom: 000.0,
                                      left: 15.0,
                                      right: 0.0,
                                    ),
                                    child: new Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(
                                          _currentMonth,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              fontFamily: 'Montserrat'),
                                        )),
                                        FlatButton(
                                          child:
                                              Icon(Icons.keyboard_arrow_left),
                                          onPressed: () {
                                            setState(() {
                                              _targetDateTime = DateTime(
                                                  _targetDateTime.year,
                                                  _targetDateTime.month - 1);
                                              _currentMonth = DateFormat.yMMM()
                                                  .format(_targetDateTime);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          child:
                                              Icon(Icons.keyboard_arrow_right),
                                          onPressed: () {
                                            setState(() {
                                              _targetDateTime = DateTime(
                                                  _targetDateTime.year,
                                                  _targetDateTime.month + 1);
                                              _currentMonth = DateFormat.yMMM()
                                                  .format(_targetDateTime);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: _calendarCarouselNoHeader,
                                  ),
                                  //
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                top: 00.0,
                                bottom: 00.0,
                                left: 30.0,
                                right: 0.0,
                              ),
                              child: Text(
                                "Select The Time",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                viewVisible = true;
                                showWidget;
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 30.0, left: 15, right: 15, bottom: 70),
                                color: Colors.white,
                                height: screenHeight * 0.4,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: timedatalist.length,
                                  itemBuilder: (context, index) {
                                    return TimeData(
                                      time: timedatalist[index]['time'],
                                      index: index,
                                      isSelected: currentSelectedIndex == index,
                                      onSelect: () {
                                        setState(() {
                                          categoryname =
                                              timedatalist[index]['category'];
                                          currentSelectedIndex = index;
                                          viewVisible = true;
                                          showWidget;
                                        });
                                      },
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            5),
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 1,
                                  ),
                                ),
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
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Expanded(
                        child: Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: viewVisible,
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 50),
                            color: Colors.white,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 1.0, left: 15, right: 15),
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Your Total Payment',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 5, left: 10),
                                          child: Text(
                                            '${_notifier.totalPrice} \u0024',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      margin: EdgeInsets.only(left: 10),
                                      alignment: FractionalOffset.center,
                                      child: FlatButton(
                                        onPressed: () {
                                          String date=DateFormat.yMd().format(_currentDate2);
                                         _notifier.appointDateSelect="$date,${timedatalist[currentSelectedIndex]['time']}";
                                          print("=---------------appointDateSelect:${_notifier.appointDateSelect}--------");
                                          print("=---------------totalPrice:${_notifier.totalPrice}--------");

                                        //  print("=----------------${_currentDate2}--------");

                                        //  payViaNewCard(context,_notifier.totalPrice);
                                          // Navigator.push(
                                          //     context,
                                          //     new MaterialPageRoute(
                                          //         builder: (ctxt) =>
                                          //             new ConfirmBooking()));
                                        },
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(
                                          "Make Payment",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat',
                                              fontSize: 14),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: CustomView(),
                      ),

                      // child:
                    ],
                  ),
                ),
              ], // new Container(child: Body(viewVisible))],
            )),
      ),
    );
  }
}

class Body extends StatelessWidget {
  bool viewVisible;

  Body(this.viewVisible);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Expanded(
            child: Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisible,
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 50),
                color: Colors.blue,
                height: 50,
              ),
            ),
          ),

          Expanded(
            child: CustomView(),
          ),

          // child:
        ],
      ),
    );
  }
}
