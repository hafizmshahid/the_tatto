import 'package:the_tatto/appbar/searchresult.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/detailtabscreen/website.dart';
import 'package:the_tatto/model/locationcity.dart';
import 'package:the_tatto/model/locationdata.dart';
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
import 'package:url_launcher/url_launcher.dart';

import 'confirmbooking.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SaveLocation(),
  ));
}*/

class SaveLocation extends StatefulWidget {
  @override
  _SaveLocation createState() => new _SaveLocation();
}

class _SaveLocation extends State<SaveLocation> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  List locationdatalist = [
    {
      "location": "Delhi",
    },
    {
      "location": "Mumbai",
    },
    {
      "location": "Pune, Maharashtra",
    },
    {
      "location": "Ahemdabad",
    },
    {
      "location": "Kolkata",
    },
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return new SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        //resizeToAvoidBottomInset: false,
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
            "Set Your Location",
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
            IconButton(
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
                        builder: (ctxt) => new HomeScreen(1)));

                // do something
              },
            ),
          ],
        ),


      body: Container(
          //physics: AlwaysScrollableScrollPhysics(),
          child: new Stack(
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
                              margin: EdgeInsets.only(left: 10, top: 10),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //height: 35,
                                    alignment: FractionalOffset.topLeft,

                                    width: screenwidth * .72,
                                    height: 40,
                                    margin: EdgeInsets.only(top: 10, left: 15),

                                    child: TextField(
                                      autofocus: false,
                                      // initialValue: "darshi123@gmail.com",
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      textAlignVertical: TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600),
                                      decoration: InputDecoration(
                                        filled: true,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.search, size: 22),
                                            onPressed: () {
                                              debugPrint('222');
                                            }),
                                        fillColor: const Color(0xFFf1f1f1),
                                        hintText: 'vishwashanti marg',
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 10.0, top: 0.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFFf1f1f1)),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFFf1f1f1)),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: screenwidth * .15,
                                      margin: EdgeInsets.only(right: 15, top: 10),
                                      // transform: Matrix4.translationValues(5.0, 10.0, 0.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Image.asset(
                                            "images/current_location.png",
                                            width: 40,
                                            height: 40,
                                          ))),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 15.0,left: 30),
                              color: Colors.white,
                              height: 40,



                              child: Text(
                                "Popular Locations",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),

                            ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5.0,left: 25),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                          return new LocationCity(
                                            location: locationdatalist[index]['location'],
                                          );
                                        },
                                        itemCount: locationdatalist.length,
                                      ),
                                    ),
                                  ),


                            Container(
                              margin: EdgeInsets.only(top: 15.0,left: 30),
                              color: Colors.white,
                              height: 40,



                              child: Text(
                                "Search result for......vishwashanti marg",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),

                            ),

                            GestureDetector(

                              onTap: (){
                                showaddlocationdialog(context);




                              },
                              child: Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.0,left: 25,bottom: 30),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      return new LocationData(
                                        location: locationdatalist[index]['location'],
                                      );
                                    },
                                    itemCount: locationdatalist.length,
                                  ),
                                ),
                              ),
                            ),




                          ],



              ),
                    ),







                  ],
                ),
      ),

                // ],


              new Container(child: Body())

              // new Container(child: Body(
              //
              // ))
            ],
          ),
        ),
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
void showaddlocationdialog(BuildContext context) {
  dynamic screenHeight = MediaQuery.of(context).size.height;
  dynamic screenwidth = MediaQuery.of(context).size.width;


  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        Widget cancelButton = FlatButton(
          child: Text("No",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
          onPressed:  () {
            Navigator.pop(context);


          },
        );
        Widget continueButton = FlatButton(
          child: Text("Yes",style: TextStyle(color: const Color(0xFFe06287),fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
          onPressed:  () {
            Navigator.pop(context);

          },
        );


        return AlertDialog(
          actions: [
            cancelButton,
            continueButton,
          ],


          title: Center(child: Text('Save Location',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),)),
          content:Builder(


              builder: (context) {

                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Do you want to save this location for future ? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'Montserrat'
                          ),
                        ),
                      ),


                      Container(

                        height: 65,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 1, top:20 ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenwidth * .1,
                              alignment:FractionalOffset.topLeft,
                              margin: EdgeInsets.only(top: 5),
                              child: Icon(Icons.location_searching,size: 25,


                              ),
                            ),
                            Container(
                              //height: 35,
                              alignment:FractionalOffset.topLeft,

                              width: screenwidth * .33,
                              transform: Matrix4.translationValues(0.0, 5.0, 0.0),




                              child: Column(


                                children: [
                                  Text(
                                    'Vishwashanti marg',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        fontFamily: 'Montserrat'),
                                  ),

                                  Text(
                                    'Pune, Maharastra, india',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                        fontFamily: 'Montserrat'),
                                  ),



                                ],

                              ),
                            ),

                            Container(

                              width: screenwidth * .11,
                              margin: EdgeInsets.only(left:15,right: 3),
                              transform: Matrix4.translationValues(0.0, -10.0, 0.0),

                              child: Text("0.5 km" ,style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  fontFamily: 'Montserrat'),
                              ),


                            ),


                          ],
                        ),
                      ),




                    ],
                );



              },

          ),





        );
      });




}


