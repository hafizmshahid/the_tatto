import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/model/notificationdata.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';


class Notification1 extends StatelessWidget {

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();




  List offerdatalist = [
    {"discount": "10%", "dark_color":const Color(0xFFffb5cc) , "light_color": const Color(0xFFffc8de),},
    {"discount": "50%", "dark_color": const Color(0xFFb5b8ff), "light_color": const Color(0xFFc8caff)},
    {"discount": "30%", "dark_color": const Color(0xFFffb5b5), "light_color": const Color(0xFFffc8c8)},


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
    // TODO: implement build
    return new SafeArea(

      child: Scaffold(




        body: Scaffold(
            backgroundColor: kAppPrimaryColor,
            appBar: appbar(context, 'Notifications', _drawerscaffoldkey,false),

            resizeToAvoidBottomInset: true,
            key: _drawerscaffoldkey,
            //set gobal key defined above

            drawer: new DrawerOnly(),

            body: new Stack(
              children: <Widget>[
                new SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[




                      Center(

                        child: Container(

                          margin: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          color: kAppPrimaryColor,

                          height: 20,

                          child: Row(

                            children: [


                              Expanded(
                                flex:1,

                                  child:
                                  Container(
                                    margin: EdgeInsets.only(left: 10),


                                    child: Text('NEW',style: TextStyle(color: Colors.grey,fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                  ),


                              ),

                              Expanded(
                                flex:7,


                                child:
                                Container(
                                  margin: EdgeInsets.only(right: 10,left: 5),


                                  child: DottedLine(
                                    direction: Axis.horizontal,
                                    lineLength: double.infinity,
                                    lineThickness: 1.0,
                                    dashLength: 5.0,
                                    dashColor:  Colors.grey,
                                    dashRadius: 0.0,
                                    dashGapLength: 8.0,
                                    dashGapColor: Colors.transparent,
                                    dashGapRadius: 0.0,
                                  )

                                ),


                              ),




                            ],
                          ),
                        ),





                      ),

                      Container(

                        margin: EdgeInsets.only(top: 0.0,left: 10,right: 10),
                        color: Colors.white,


                        child:Container(
                          child:ListView.builder(

                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),


                            itemBuilder: (BuildContext context, int index) {
                              return new NotificationData(
                                discount: offerdatalist[index]['discount'],
                                dark_color: offerdatalist[index]['dark_color'],
                                light_color: offerdatalist[index]['light_color'],
                              );
                            },
                            itemCount: offerdatalist.length,
                          ),



                        ),

                        // height: 50,
                      ),
                    ],
                  ),
                ),






              ],

            )



        ),
      ),
    );


  }

}

