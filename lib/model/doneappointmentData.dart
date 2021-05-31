import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/ResponseModel/AppointmentHistoryResponse.dart';

import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';

class DoneAppointmentData extends StatelessWidget {
  final List<ServicesDetail> servicesDetail;
  final DateTime time;


  // ignore: non_constant_identifier_names
  const DoneAppointmentData(
      {Key key, this.servicesDetail,this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;
    String baseUrl="https://tattooarts.herokuapp.com/";

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
                              image: NetworkImage("$baseUrl${servicesDetail[index].servicesImage}"),
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

                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: SvgPicture.asset(
                            "images/correct.svg",
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text("Completed",
                              style: TextStyle(
                                  color: const Color(0xFF00d579),
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
