import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/ResponseModel/UpcomingAppointmentResponse.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';


class AppointmentData extends StatelessWidget {
 final  List<ServicesDetail> servicesDetail;
 final String time;
  const AppointmentData(
      {Key key, this.servicesDetail, this.time,})
      : super(key: key);

  void showcancledialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Widget cancelButton = FlatButton(
            child: Text(
              "No",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
          Widget continueButton = FlatButton(
            child: Text(
              "Yes",
              style: TextStyle(
                  color: const Color(0xFFe06287),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );

          return AlertDialog(
            actions: [
              cancelButton,
              continueButton,
            ],
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Cancel Appointment !',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
                textAlign: TextAlign.center,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Are you sure you want to cancel your appointment?  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),

      // constraints: BoxConstraints.expand(),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFf1f1f1), width: 3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),

      child: Wrap(
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 60,
                          // color: Colors.black,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                            image: NetworkImage("${servicesDetail[index].servicesImage}"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "${servicesDetail[index].servicesName}",

                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ));
              },

              itemCount: servicesDetail.length

          ),
          Container(
            width: double.infinity,
              margin: EdgeInsets.only(
                  left: 0.0, top: 5.0, right: 0),
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.calendar_today,
                        size: 14,
                        color:
                        const Color(0xFFe06287),
                      ),

                    ),


                    TextSpan(
                        text:
                        " $time",
                        style: TextStyle(
                            color:
                            Color(0xFF9e9e9e),
                            fontSize: 11,
                            fontWeight:
                            FontWeight.w600,
                            fontFamily:
                            'Montserrat')),
                  ],
                ),
              )),

          Expanded(
              child: Container(
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),

                  child: MySeparator(color: Color(0xFF9e9e9e)),
                ),
              )),

          Container(
            // height: 100.0,
            // width: MediaQuery.of(context).size.width * 0.4,
            // height: 90,
            // transform: Matrix4.translationValues(5.0, -20.0, 0.0),
            margin: EdgeInsets.only(
                left: 15.0, top: 1.0, bottom: 10.0),
            alignment: Alignment.center,

            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius:
            //         BorderRadius.all(Radius.circular(1))),

            child: GestureDetector(
                onTap: () {
                  showcancledialog(context);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: SvgPicture.asset(
                            "images/delete.svg",
                            color: const Color(0xFFff4040),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only( left: 5),
                          child: Text("Cancel Booking",
                              style: TextStyle(
                                  color: const Color(0xFFff4040),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          // Container(
          //     height: 90,
          //     width: MediaQuery.of(context).size.width * 0.9,
          //     alignment: Alignment.topLeft,
          //     margin: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Container(
          //             width: screenwidth * .33,
          //             height: 80,
          //             margin: EdgeInsets.only(left: 5.0, right: 10.0),
          //             color: kAppPrimaryColor,
          //             alignment: Alignment.topLeft,
          //             child: ListView(
          //               shrinkWrap: true,
          //               physics: NeverScrollableScrollPhysics(),
          //               children: <Widget>[
          //                /* Container(
          //                   transform:
          //                       Matrix4.translationValues(5.0, 0.0, 0.0),
          //                   child: Text(
          //                     "Service Type",
          //                     style: TextStyle(
          //                         color: Color(0xFFb3b3b3),
          //                         fontSize: 12,
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'Montserrat'),
          //                   ),
          //                 ),*/
          //                 Container(
          //                   margin: EdgeInsets.only(left: 5),
          //                   child: Text(
          //                     "Multiple Tribal Tattoo",
          //                     style: TextStyle(
          //                         color: Color(0xFF4b4b4b),
          //                         fontSize: 12,
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'Montserrat'),
          //                   ),
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.only(left: 5, top: 5),
          //                   child: Text(
          //                     "see all...",
          //                     style: TextStyle(
          //                         color: Color(0xFF4a92ff),
          //                         fontSize: 12,
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'Montserrat'),
          //                   ),
          //                 ),
          //               ],
          //             )),
          //         Container(
          //           // height: 100.0,
          //           width: MediaQuery.of(context).size.width * 0.4,
          //           height: 90,
          //           // transform: Matrix4.translationValues(5.0, -20.0, 0.0),
          //           // margin: EdgeInsets.only(
          //           //     left: 15.0, top: 1.0, bottom: 10.0),
          //           alignment: Alignment.topRight,
          //           margin: EdgeInsets.only(top: 10, right: 10),
          //           // decoration: BoxDecoration(
          //           //     color: Colors.white,
          //           //     borderRadius:
          //           //         BorderRadius.all(Radius.circular(1))),
          //
          //           child: GestureDetector(
          //               onTap: () {
          //                 showcancledialog(context);
          //               },
          //               child: RichText(
          //                 text: TextSpan(
          //                   children: [
          //                     WidgetSpan(
          //                       child: Container(
          //                         margin: EdgeInsets.only(top: 5),
          //                         child: SvgPicture.asset(
          //                           "images/delete.svg",
          //                           color: const Color(0xFFff4040),
          //                         ),
          //                       ),
          //                     ),
          //                     WidgetSpan(
          //                       child: Container(
          //                         margin: EdgeInsets.only(top: 5, left: 5),
          //                         child: Text("Cancel Booking",
          //                             style: TextStyle(
          //                                 color: const Color(0xFFff4040),
          //                                 fontSize: 12,
          //                                 fontWeight: FontWeight.w500)),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               )),
          //         ),
          //       ],
          //     ))
        ],
      ),

      // color: Colors.grey,
    );
  }





}

//
// class AppointmentData extends StatefulWidget {
//   final String discount;
//   const AppointmentData({Key key, this.discount}) : super(key: key);
//
//   @override
//   _AppointmentDataState createState() => _AppointmentDataState();
// }
//
// class _AppointmentDataState extends State<AppointmentData> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//         () async {
//             await getUpcomingAppointment();
//     } ();
//     super.initState();
//   }
//   bool isUpcomingAppointment = false;
//   var authMsg;
//   Future<void> getUpcomingAppointment() async {
//     print("-----------------${PreferenceUtils.getString(kLoginAccessToken)}------------------");
//     isUpcomingAppointment = false;
//     try {
//       final response = await http.get(kGetAppointmentApi,headers:{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${PreferenceUtils.getString(kLoginAccessToken)}',
//       });
//       //final response = await http.get("https://tattooarts.herokuapp.com/auth/get_user/5");
//       var body = json.decode(response.body);
//       print("-----------------$body------------------");
//       if (response.statusCode ==200) {
//         isUpcomingAppointment = true;
//
//       } else {
//
//         print(
//             "-------------------Sign  in not success ${authMsg = body['message']}----------------");
//       }
//
//       print("not success");
//
//     } catch (e) {
//       print("-------------------Sign  in not success ${e.message.toString()}----------------");
//
//       authMsg = "Error ${e.message.toString()}";
//
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     dynamic screenHeight = MediaQuery.of(context).size.height;
//     dynamic screenwidth = MediaQuery.of(context).size.width;
//
//     // TODO: implement build
//     return   isUpcomingAppointment
//         ? Container(
//       margin: EdgeInsets.only(top: 20),
//       child: Center(
//         child: Text(
//           "Not Found",
//           style: TextStyle(
//               color: kPrimaryTextColor,
//               fontSize: 15),
//         ),
//       ),
//     )
//         : Container(
//           margin: EdgeInsets.only(left: 10, right: 10, top: 10),
//           height: 200,
//           // constraints: BoxConstraints.expand(),
//           width: double.infinity,
//           decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFFf1f1f1), width: 3),
//             borderRadius: BorderRadius.all(Radius.circular(12)),
//           ),
//
//           child: ListView(
//             physics: NeverScrollableScrollPhysics(),
//             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Container(
//                   alignment: Alignment.topLeft,
//                   margin: EdgeInsets.only(left: 5.0, top: 0.0),
//                   child: Row(
//                     children: <Widget>[
//                       new Container(
//                         height: 60,
//                         width: screenwidth * .33,
//                         // color: Colors.black,
//                         alignment: Alignment.topLeft,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           image: DecorationImage(
//                             image: AssetImage("images/smallbarber.png"),
//                             fit: BoxFit.fitWidth,
//                             alignment: Alignment.topCenter,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         // height: 100.0,
//
//                         height: 110,
//                         margin: EdgeInsets.only(left: 5.0, top: 0.0),
//                         alignment: Alignment.topLeft,
//
//                         child: Text(
//                           "Barberque",
//                           style: TextStyle(
//                               color: kPrimaryTextColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Montserrat'),
//                         ),),
//                     ],
//                   )),
//
//               Container(
//                   margin: EdgeInsets.only(
//                       left: 0.0, top: 5.0, right: 0),
//                   child: RichText(
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     textScaleFactor: 1,
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       children: [
//                         WidgetSpan(
//                           child: Icon(
//                             Icons.calendar_today,
//                             size: 14,
//                             color:
//                             const Color(0xFFe06287),
//                           ),
//
//                         ),
//
//
//                         TextSpan(
//                             text:
//                             " 06:00 pm - June 21,2020",
//                             style: TextStyle(
//                                 color:
//                                 Color(0xFF9e9e9e),
//                                 fontSize: 11,
//                                 fontWeight:
//                                 FontWeight.w600,
//                                 fontFamily:
//                                 'Montserrat')),
//                       ],
//                     ),
//                   )),
//               SizedBox(height: 10,),
//               Expanded(
//                   child: Container(
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 1.0, bottom: 1.0),
//                       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                       child: MySeparator(color: Color(0xFF9e9e9e)),
//                     ),
//                   )),
//               Container(
//                 // height: 100.0,
//                 // width: MediaQuery.of(context).size.width * 0.4,
//                 // height: 90,
//                 // transform: Matrix4.translationValues(5.0, -20.0, 0.0),
//                 // margin: EdgeInsets.only(
//                 //     left: 15.0, top: 1.0, bottom: 10.0),
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.only(top: 10, right: 10),
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     borderRadius:
//                 //         BorderRadius.all(Radius.circular(1))),
//
//                 child: GestureDetector(
//                     onTap: () {
//                       showcancledialog(context);
//                     },
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           WidgetSpan(
//                             child: Container(
//                               margin: EdgeInsets.only(top: 5),
//                               child: SvgPicture.asset(
//                                 "images/delete.svg",
//                                 color: const Color(0xFFff4040),
//                               ),
//                             ),
//                           ),
//                           WidgetSpan(
//                             child: Container(
//                               margin: EdgeInsets.only(top: 5, left: 5),
//                               child: Text("Cancel Booking",
//                                   style: TextStyle(
//                                       color: const Color(0xFFff4040),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//               ),
//               // Container(
//               //     height: 90,
//               //     width: MediaQuery.of(context).size.width * 0.9,
//               //     alignment: Alignment.topLeft,
//               //     margin: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //       children: <Widget>[
//               //         Container(
//               //             width: screenwidth * .33,
//               //             height: 80,
//               //             margin: EdgeInsets.only(left: 5.0, right: 10.0),
//               //             color: kAppPrimaryColor,
//               //             alignment: Alignment.topLeft,
//               //             child: ListView(
//               //               shrinkWrap: true,
//               //               physics: NeverScrollableScrollPhysics(),
//               //               children: <Widget>[
//               //                /* Container(
//               //                   transform:
//               //                       Matrix4.translationValues(5.0, 0.0, 0.0),
//               //                   child: Text(
//               //                     "Service Type",
//               //                     style: TextStyle(
//               //                         color: Color(0xFFb3b3b3),
//               //                         fontSize: 12,
//               //                         fontWeight: FontWeight.w600,
//               //                         fontFamily: 'Montserrat'),
//               //                   ),
//               //                 ),*/
//               //                 Container(
//               //                   margin: EdgeInsets.only(left: 5),
//               //                   child: Text(
//               //                     "Multiple Tribal Tattoo",
//               //                     style: TextStyle(
//               //                         color: Color(0xFF4b4b4b),
//               //                         fontSize: 12,
//               //                         fontWeight: FontWeight.w600,
//               //                         fontFamily: 'Montserrat'),
//               //                   ),
//               //                 ),
//               //                 Container(
//               //                   margin: EdgeInsets.only(left: 5, top: 5),
//               //                   child: Text(
//               //                     "see all...",
//               //                     style: TextStyle(
//               //                         color: Color(0xFF4a92ff),
//               //                         fontSize: 12,
//               //                         fontWeight: FontWeight.w600,
//               //                         fontFamily: 'Montserrat'),
//               //                   ),
//               //                 ),
//               //               ],
//               //             )),
//               //         Container(
//               //           // height: 100.0,
//               //           width: MediaQuery.of(context).size.width * 0.4,
//               //           height: 90,
//               //           // transform: Matrix4.translationValues(5.0, -20.0, 0.0),
//               //           // margin: EdgeInsets.only(
//               //           //     left: 15.0, top: 1.0, bottom: 10.0),
//               //           alignment: Alignment.topRight,
//               //           margin: EdgeInsets.only(top: 10, right: 10),
//               //           // decoration: BoxDecoration(
//               //           //     color: Colors.white,
//               //           //     borderRadius:
//               //           //         BorderRadius.all(Radius.circular(1))),
//               //
//               //           child: GestureDetector(
//               //               onTap: () {
//               //                 showcancledialog(context);
//               //               },
//               //               child: RichText(
//               //                 text: TextSpan(
//               //                   children: [
//               //                     WidgetSpan(
//               //                       child: Container(
//               //                         margin: EdgeInsets.only(top: 5),
//               //                         child: SvgPicture.asset(
//               //                           "images/delete.svg",
//               //                           color: const Color(0xFFff4040),
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     WidgetSpan(
//               //                       child: Container(
//               //                         margin: EdgeInsets.only(top: 5, left: 5),
//               //                         child: Text("Cancel Booking",
//               //                             style: TextStyle(
//               //                                 color: const Color(0xFFff4040),
//               //                                 fontSize: 12,
//               //                                 fontWeight: FontWeight.w500)),
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //               )),
//               //         ),
//               //       ],
//               //     ))
//             ],
//           ),
//
//           // color: Colors.grey,
//         );
//   }
// }


