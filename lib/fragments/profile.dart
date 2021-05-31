import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/ResponseModel/AppointmentHistoryResponse.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/fragments/editprofile.dart';
import 'package:the_tatto/model/doneappointmentData.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_api_ref.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_constant.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'package:http/http.dart' as _http;
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:io';
import 'dart:convert';



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
  List<AppointmentHistoryResponse> appointmentHistoryResponse;
  var body;
  var authMsg;
   String responseString;
 bool isAppointmentHistory= false;


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
  void initState() {
    // TODO: implement initState
        () async {
           await getUpcomingAppointment();
    } ();
    super.initState();

  }

  Future<void> getUpcomingAppointment() async {
    print("-----------------${PreferenceUtils.getString(kLoginAccessToken)}------------------");
    isAppointmentHistory = false;
    try {
      final response = await http.get(kGetAppointmentHistoryApi,headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${PreferenceUtils.getString(kLoginAccessToken)}',
      });
      body = json.decode(response.body);
       responseString=response.body;
      print("-----------------$body------------------");
      if (response.statusCode==200) {
        setState(() {
          isAppointmentHistory = true;
        });
        appointmentHistoryResponse= appointmentHistoryResponseFromJson(response.body);

       // return appointmentHistoryResponseFromJson(responseString);
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
    final _notifier = Provider.of<AuthViewModel>(context);
    String name= json.decode(PreferenceUtils.getString(kProfilePreferenceId))['username'];
    String imageUrl= json.decode(PreferenceUtils.getString(kProfilePreferenceId))['image'];

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
                        child: imageUrl !=null? Image.network(
                          "${imageUrl}",
                          width: 120,
                          height: 90,
                        ):Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.person_outline,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child:name!=null? Text(
                            "${name}",
                            style: TextStyle(
                                color:kPrimaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'Montserrat'),
                          ):Text(
                            "User Name",
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
                          _notifier.profileImageFile= null;
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

                // Container(
                //   margin: EdgeInsets.only(left: 10, top: 25),
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     'Upcoming Appointments',
                //     style: TextStyle(
                //         color: kPrimaryTextColor,
                //         fontWeight: FontWeight.w600,
                //         fontSize: 18,
                //         fontFamily: 'Montserrat'),
                //   ),
                // ),

                 Container(
                  child: GestureDetector(
                    onTap: () {
                   //   print("----------------${appointmentHistoryResponse[1].servicesDetail[2].servicesName.toString()}---------------");

                    },
                    child: Column(
                      children: <Widget>[

                        // Container(
                        //
                        //   child:ListView.builder(
                        //
                        //
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //
                        //
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return new AppointmentData(
                        //         discount: "lsds",
                        //
                        //       );
                        //     },
                        //     itemCount: 1,
                        //   ),
                        // ),

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
                        !isAppointmentHistory ?
                        Container(
                          padding: EdgeInsets.only(top: 40),
                          child: SpinKitWave(
                            color: Colors.white,
                            size: 20,
                          ),
                        ): Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child:ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return new DoneAppointmentData(
                               servicesDetail:appointmentHistoryResponse[index].servicesDetail,
                                time:appointmentHistoryResponse[index].appointmentDate ,
                              );
                            },
                            itemCount: appointmentHistoryResponse.length,
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
