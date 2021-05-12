import 'package:flutter_svg/svg.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';

class CustomView extends StatefulWidget {
  const CustomView({Key key}) : super(key: key);

  @override
  _CustomView createState() => _CustomView();
}

class _CustomView extends State<CustomView> {
  @override
  // implement wantKeepAlive

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        //    bottomNavigationBar: new BottomBar1(),

        child: Container(
          color:kAppPrimaryColor,
          alignment: FractionalOffset.center,
          height: 50,

          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen(0)));
                  },
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.calendar_today,
                        color: kPrimaryTextColor,
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen(1)));
                  },
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.pin_drop_rounded,
                        color: kPrimaryTextColor,
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen(2)));
                  },
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.home,
                        color: kPrimaryTextColor,
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen(3)));
                  },
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.notification_important,
                        color: kPrimaryTextColor,
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen(4)));
                  },
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.person,
                        color: kPrimaryTextColor,
                      )),
                ),
              ),
            ],
          ),

          // alignment: FractionalOffset.center,

          // color: Colors.pinkAccent,
        ));
  }
}
