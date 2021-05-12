import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';

class AppointmentData extends StatelessWidget {
  final String discount;
  final Color dark_color;
  final Color light_color;

  // ignore: non_constant_identifier_names
  const AppointmentData(
      {Key key, this.discount, this.dark_color, this.light_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return new Container(
      color: kAppPrimaryColor,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: 200,
        // constraints: BoxConstraints.expand(),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFf1f1f1), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),

        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 5.0, top: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Container(
                            height: 75,
                            width: screenwidth * .33,
                            // color: Colors.black,
                            alignment: Alignment.topLeft,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage("images/smallbarber.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        new Container(
                            // height: 100.0,
                            width: screenwidth * .67,
                            height: 110,
                            margin: EdgeInsets.only(left: 5.0, top: 0.0),
                            alignment: Alignment.topLeft,

                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      "Barberque",
                                      style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 5.0, left: 0.0),
                                    child: Text(
                                      "vishwashanti marg, near lnn, pune ",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Color(0xFF9e9e9e),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                   /*   Container(
                                        margin:
                                            EdgeInsets.only(top: 2, left: 0),
                                        child: SvgPicture.asset(
                                          "images/star.svg",
                                          width: 10,
                                          height: 10,
                                        ),
                                      ),
                                      Container(
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: 2, left: 2),
                                          child: Text("4.0 Rating",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFF999999),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat')),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 5.0,
                                        height: 5.0,
                                        margin: EdgeInsets.only(
                                            left: 5.0, top: 5.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF9e9e9e),
                                        ),
                                      ),*/
                                      Container(
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
                                                        "06:00 pm - June 21,2020",
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
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ))),
            Expanded(
                child: Container(
              child: Container(
                margin: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: MySeparator(color: Color(0xFF9e9e9e)),
              ),
            )),
            Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: screenwidth * .33,
                        height: 80,
                        margin: EdgeInsets.only(left: 5.0, right: 10.0),
                        color: kAppPrimaryColor,
                        alignment: Alignment.topLeft,
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                           /* Container(
                              transform:
                                  Matrix4.translationValues(5.0, 0.0, 0.0),
                              child: Text(
                                "Service Type",
                                style: TextStyle(
                                    color: Color(0xFFb3b3b3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),*/
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Multiple Tribal Tattoo",
                                style: TextStyle(
                                    color: Color(0xFF4b4b4b),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                "see all...",
                                style: TextStyle(
                                    color: Color(0xFF4a92ff),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      // height: 100.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 90,
                      // transform: Matrix4.translationValues(5.0, -20.0, 0.0),
                      // margin: EdgeInsets.only(
                      //     left: 15.0, top: 1.0, bottom: 10.0),
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 10, right: 10),
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
                                    margin: EdgeInsets.only(top: 5, left: 5),
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
                  ],
                ))
          ],
        ),

        // color: Colors.grey,
      ),
    );
  }

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
}
