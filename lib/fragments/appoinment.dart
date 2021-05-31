import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_tatto/ResponseModel/UpcomingAppointmentResponse.dart' ;
import 'package:the_tatto/ResponseModel/UpcomingAppointmentResponse.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/model/appointmentdata.dart';
import 'package:the_tatto/screens/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_api_ref.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_constant.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'package:http/http.dart' as _http;
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:io';
import 'dart:convert';
class Appoinment extends StatefulWidget {

  @override
  _Appoinment createState() => new _Appoinment();
}


class _Appoinment extends State<Appoinment> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();
  var body;
  List<UpcomingAppointmentResponse> upcomingAppointmentResponse=[] ;
  List servicesName;
  String string;

  @override
  void initState() {
    // TODO: implement initState
        () async {
           await getUpcomingAppointment();
    } ();
    super.initState();
  }
  bool isUpcomingAppointment = false;
  var authMsg;
  Future<void> getUpcomingAppointment() async {
    print("-----------------${PreferenceUtils.getString(kLoginAccessToken)}------------------");
    isUpcomingAppointment = false;
    try {
      final response = await http.get(kGetAppointmentApi,headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${PreferenceUtils.getString(kLoginAccessToken)}',
      });
       body = json.decode(response.body) as List;
       string =response.body;
      print("-----------------$body------------------");
      if (response.statusCode==200) {
        setState(() {
          isUpcomingAppointment = true;
        });
        upcomingAppointmentResponse=  upcomingAppointmentResponseFromJson(string);


      } else {
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
        return null;
      }

      print("not success");

    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      return null;

      authMsg = "Error ${e.message.toString()}";

    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScaffold(
      backgroundColor:kAppPrimaryColor,
      appBarHeading: "Appointment",
      bottomBarIndex: 0,
      isBackArrow: false,
      body: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor:Colors.transparent,
          key: _drawerscaffoldkey,
          drawer: new DrawerOnly(),
          body:
          !isUpcomingAppointment ?
          Container(
            child: SpinKitWave(
              color: Colors.white,
              size: 20,
            ),
          ):
          Stack(
            children: <Widget>[
              new SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[


                    // Container(
                    //   margin: EdgeInsets.only(top: 20),
                    //   child: Center(
                    //     child: Text(
                    //       "Not Found",
                    //       style: TextStyle(
                    //           color: kPrimaryTextColor,
                    //           fontSize: 15),
                    //     ),
                    //   ),
                    // )
                         Container(
                        margin: EdgeInsets.only(top: 5.0,left: 10,right: 10),

                        child:GestureDetector(
                          onTap: (){
                          },

                          child:ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),


                            itemBuilder: (BuildContext context, int index) {
                              return  AppointmentData(
                                servicesDetail:upcomingAppointmentResponse[index].servicesDetail,
                                time:upcomingAppointmentResponse[index].appointmentDate ,

                              );
                            },
                            //itemCount: upcomingAppointmentResponse.length
                            itemCount: 2
                          ),

                        )


                    ),
                  ],
                ),
              ),

            ],

          )

      ),
    );
    }

  void showcancledialog(BuildContext context) {

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


            title: Center(child: Text('Cancel Appointment !',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "Are you sure you want to cancel your appointment?  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 18,fontFamily: 'Montserrat'
                    ),
                  ),
                ),

              ],
            ),
          );
        });




  }







  }


