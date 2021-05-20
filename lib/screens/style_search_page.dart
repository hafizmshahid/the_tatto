import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/common/inndicator.dart';
import 'package:the_tatto/model/style_search_items.dart';
import 'package:the_tatto/model/topservicedata.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/common/customwidget.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';

import 'base_scaffold.dart';

// ignore: must_be_immutable
class StyleSearchScreen extends StatefulWidget {
  final String imageUrl, heading;

  const StyleSearchScreen({Key key, this.imageUrl, this.heading})
      : super(key: key);

  @override
  _TopService createState() => new _TopService();
}

class _TopService extends State<StyleSearchScreen> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();
  int currentSelectedIndex;

  String categoryname;

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  void initState() {
    super.initState();

    categoryname = widget.imageUrl;
    currentSelectedIndex = 3;
    isResult = false;
  }

  List categorydatalist = [
    {
      "category": "All",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
    {
      "category": "Tattoo Artist Name",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shop Name",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
  ];
  bool isResult = false;
  GlobalKey<FormState> locationSearchFormKay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return BaseScaffold(
      appBarHeading: "Style Search",
      isBackArrow: true,
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.black,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 180,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0),
                            )),
                        child: Center(
                            child: Text(
                          "${widget.heading}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 160,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0),
                            ),
                            color: Colors.white
                            // color: Colors.grey.withOpacity(0.1)
                            ),
                        child: Form(
                          key: locationSearchFormKay,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat'),
                                  showCursor: true,
                               /*   validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Empty !";
                                    } else {
                                      setState(() {
                                        _notifier.locationSearchListValue =
                                            value.toString().trim();
                                      });
                                      return null;
                                    }
                                  },*/
                                  onSaved: (String value) {
                                    value == null
                                        ? _notifier.locationSearchListValue = ""
                                        : _notifier.locationSearchListValue =
                                            value.toString().trim();
                                  },
                                  //  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: 'Location',
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.pin_drop_rounded,
                                      color: Colors.black,
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: MaterialButton(
                                    minWidth: double.infinity,
                                    height: 40,
                                    color: Colors.black,
                                    onPressed: () async {
                                      if (locationSearchFormKay.currentState
                                          .validate()) {
                                        locationSearchFormKay.currentState.save();
                                        if (!isResult) {
                                          setState(() {
                                            isResult = true;
                                            _notifier.getLocationSearchList();
                                          });
                                        } else if (isResult) {
                                          setState(() {
                                            isResult = false;
                                          });
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Search".toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      isResult
                          ? Container(
                              height: 300,
                              child: !_notifier.isLocationSearchList
                                  ? Container(
                                      height: 50,
                                      child: SpinKitWave(
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  : ListView(
                                      children: <Widget>[
                                        Container(
                                          child: _notifier.locationSearchList
                                                      .length ==
                                                  0
                                              ? Container(
                                            height: 300,
                                                  child: Center(
                                                    child: Text(
                                                      "Not Found",
                                                      style: TextStyle(
                                                          color:
                                                              kPrimaryTextColor,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                )
                                              : ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return TopServiceDataNew(
                                                      category:
                                                          "${_notifier.locationSearchList[index].name}",
                                                      address: _notifier
                                                          .locationSearchList[
                                                              index]
                                                          .location,
                                                      imageUrl: _notifier
                                                          .locationSearchList[
                                                              index]
                                                          .profileImage,
                                                      userId: _notifier
                                                          .locationSearchList[
                                                      index]
                                                          .id,
                                                      name:  _notifier
                                                          .locationSearchList[
                                                      index]
                                                          .name,
                                                      time:
                                                          "${_notifier.locationSearchList[index].defaultOpening} - ${_notifier.locationSearchList[index].defaultClosing}",
                                                    );
                                                  },
                                                  itemCount: _notifier
                                                      .locationSearchList
                                                      .length,
                                                ),
                                        ),
                                      ],
                                    ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                // true?

                /*  : Container(),*/
              ],
            ),
          ),
        ),

        // ],
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
