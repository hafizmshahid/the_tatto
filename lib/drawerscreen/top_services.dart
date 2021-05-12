import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/common/customwidget.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/model/topservicedata.dart';
import 'package:the_tatto/screens/savelocation.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:the_tatto/utils/app_color.dart';

/*void main() => runApp(new TopService(0, "Explore All"));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: kGreenColor,
      ),
      home: new TopService(0, "Explore All"),
    );
  }
}*/

class TopService extends StatefulWidget {
  int index;
  String categoryname;

  TopService(this.index, this.categoryname);

  @override
  _TopService createState() => new _TopService();
}

class _TopService extends State<TopService> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();
  int currentSelectedIndex;

  String categoryname;

  bool valuefirst = false;
  bool valuesecond = false;

  bool _rememberMeFlag = false;
  int _groupValue = -1;
  var rating = 0.0;
  double _lowerValue = 250;

  @override
  void initState() {
    super.initState();

    categoryname = widget.categoryname;
    currentSelectedIndex = widget.index;
  }

  List categorydatalist = [
    {
      "category": "All",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
   /* {
      "category": "Style",
      "dark_color": const Color(0xFFb5b8ff),
      "light_color": const Color(0xFFc8caff)
    },*/
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

//  String categoryname = " ";

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(

        appBar: appbar(context, 'Top Services', _drawerscaffoldkey, false),
        body: Scaffold(
          resizeToAvoidBottomInset: true,
          key: _drawerscaffoldkey,
          //set gobal key defined above

          drawer: new DrawerOnly(),
          body: new Stack(
            children: <Widget>[
              new Container(
                color:kAppPrimaryColor,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      color: Colors.white,
                      child: MySeparator(color: Colors.grey),
                    ),
                  /*  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new SaveLocation()));
                      },
                      child: Container(
                        alignment: FractionalOffset.topCenter,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Flexible(
                            //   child:

                          *//*  Container(
                                margin: const EdgeInsets.only(
                                    top: 10.0, left: 15.0),
                                alignment: FractionalOffset.topCenter,
                                child: SvgPicture.asset(
                                  "images/location_home.svg",
                                  width: 20,
                                  height: 20,
                                )),
                            // ),

                            // Flexible(
                            //   // flex:1,
                            //   child:

                            Container(
                              // width: 120,
                              margin:
                                  const EdgeInsets.only(top: 10.0, left: 10.0),
                              // transform: Matrix4.translationValues(-180.0, 0.0, 0.0),
                              alignment: FractionalOffset.topLeft,
                              child: Text(
                                "vishwashanti marg, Pune",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),*//*
                            // ),
                          ],
                        ),
                      ),
                    ),*/
                  /*  Container(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: MySeparator(color: Colors.grey),
                    ),*/
                    Flexible(
                      child: Container(
                        color: kAppPrimaryColor,
                        margin: EdgeInsets.only(top: 10.0, left: 8),
                        // color: Colors.white,
                        height: 45,
                        child: ListView.builder(
                          itemCount: categorydatalist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomWidget(
                              category: categorydatalist[index]['category'],
                              index: index,
                              isSelected: currentSelectedIndex == index,
                              onSelect: () {
                                setState(() {
                                  categoryname =
                                      categorydatalist[index]['category'];
                                  currentSelectedIndex = index;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        color: kAppPrimaryColor,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              alignment: Alignment.topLeft,

                              // child:Text(categoryname.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 18)),
                              child: Text(categoryname,
                                  style: TextStyle(
                                      color: kPrimaryTextColor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16)),
                            ),
                           /* Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      _newTaskModalBottomSheet(context);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Filter ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat',
                                              )),
                                          WidgetSpan(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: SvgPicture.asset(
                                                "images/filter.svg",
                                                width: 15,
                                                height: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))),*/
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return new TopServiceDataNew(
                                  category: categorydatalist[index]['category'],
                                  dark_color: categorydatalist[index]
                                      ['dark_color'],
                                  light_color: categorydatalist[index]
                                      ['light_color'],
                                );
                              },
                              itemCount: categorydatalist.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ],
              ),

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

  void _newTaskModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                // You can wrap this Column with Padding of 8.0 for better design
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  new Container(
                    child: Text(
                      'Sort By',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 5, left: 10),
                  ),
                  new Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin:
                                  new EdgeInsets.only(left: 15.0, right: 5.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      new GestureDetector(
                                        child: new Row(
                                          children: <Widget>[
                                            new Checkbox(
                                              checkColor: Colors.white,
                                              activeColor: Color(0xFFe06287),
                                              value: valuesecond,
                                              onChanged: (value) =>
                                                  setState(() {
                                                valuesecond = !valuesecond;
                                              }),
                                            ),
                                            new Text(
                                              "Most Popular",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: "Montserrat"),
                                            ),
                                          ],
                                        ),
                                        onTap: () => setState(() {
                                          valuesecond = !valuesecond;
                                        }),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                              transform:
                                  Matrix4.translationValues(-25.0, 0.0, 0.0),

                              // margin: new EdgeInsets.symmetric(
                              //     vertical: 5.0, horizontal: 20.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      new GestureDetector(
                                        child: new Row(
                                          children: <Widget>[
                                            new Checkbox(
                                              checkColor: Colors.white,
                                              activeColor: Color(0xFFe06287),
                                              value: valuefirst,
                                              onChanged: (value) =>
                                                  setState(() {
                                                valuefirst = !valuefirst;
                                              }),
                                            ),
                                            new Text(
                                              "Price: Low to High",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: "Montserrat"),
                                            ),
                                          ],
                                        ),
                                        onTap: () => setState(() {
                                          valuefirst = !valuefirst;
                                        }),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                      transform: Matrix4.translationValues(00.0, -20.0, 0.0),
                      margin: new EdgeInsets.only(left: 15.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new GestureDetector(
                                child: new Row(
                                  children: <Widget>[
                                    new Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Color(0xFFe06287),
                                      value: _rememberMeFlag,
                                      onChanged: (value) => setState(() {
                                        _rememberMeFlag = !_rememberMeFlag;
                                      }),
                                    ),
                                    new Text(
                                      "Price: High to Low",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ],
                                ),
                                onTap: () => setState(() {
                                  _rememberMeFlag = !_rememberMeFlag;
                                }),
                              ),
                            ],
                          ),
                        ],
                      )),
                  new Container(
                    transform: Matrix4.translationValues(00.0, -18.0, 0.0),
                    child: Text(
                      'Looking for',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 1, left: 15),
                  ),
                  new Container(
                      transform: Matrix4.translationValues(00.0, -18.0, 0.0),
                      // margin: new EdgeInsets.symmetric(
                      //     vertical: 5.0, horizontal: 20.0),
                      margin: new EdgeInsets.only(left: 5.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: RadioListTile(
                              value: 0,
                              groupValue: _groupValue,
                              title: Text(
                                "Male",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "Montserrat"),
                              ),
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                              activeColor: Color(0xFFe06287),
                              selected: false,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              transform:
                                  Matrix4.translationValues(-30.0, 00.0, 0.0),
                              child: RadioListTile(
                                value: 1,
                                groupValue: _groupValue,
                                title: Text(
                                  "Female",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800),
                                ),
                                onChanged: (newValue) =>
                                    setState(() => _groupValue = newValue),
                                activeColor: Color(0xFFe06287),
                                selected: false,
                              ),
                            ),
                          ),
                        ],
                      )),
                  new Container(
                    transform: Matrix4.translationValues(00.0, -18.0, 0.0),
                    child: Text(
                      'Services',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 1, left: 15),
                  ),
                  new Container(
                    transform: Matrix4.translationValues(00.0, -10.0, 0.0),
                    margin: EdgeInsets.only(top: 0.0, left: 15, right: 15),
                    color: Colors.white,
                    height: 120,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: categorydatalist.length,
                      itemBuilder: (context, index) {
                        return CustomWidget(
                          category: categorydatalist[index]['category'],
                          index: index,
                          isSelected: currentSelectedIndex == index,
                          onSelect: () {
                            setState(() {
                              categoryname =
                                  categorydatalist[index]['category'];
                              currentSelectedIndex = index;
                            });
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 4),
                        crossAxisCount: 4,
                        mainAxisSpacing: 8.0,
                      ),
                    ),
                  ),
                  new Container(
                    transform: Matrix4.translationValues(00.0, -30.0, 0.0),
                    child: Text(
                      'Rating',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 1, left: 15),
                  ),
                  new Container(
                    transform: Matrix4.translationValues(15.0, -10.0, 0.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        SmoothStarRating(
                          defaultIconData: Icons.star,
                          rating: rating,
                          color: Color(0xFFe06287),
                          borderColor: Colors.grey,
                          allowHalfRating: false,
                          size: 20,
                          starCount: 5,
                          onRated: (value) {
                            setState(() {
                              rating = value;
                              print(value);
                            });
                          },
                        ),
                        Container(
                          transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                          child: Text(
                            "(" +
                                rating
                                    .toString()
                                    .replaceAll(RegExp(r'.0'), '') +
                                ")",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Montserrat"),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    transform: Matrix4.translationValues(00.0, 5.0, 0.0),
                    child: Text(
                      'Set your budget',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 1, left: 15),
                  ),
                  new Container(
                    transform: Matrix4.translationValues(00.0, 5.0, 0.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Builder(
                              //Needed to find Scaffold.of(context) and display the snackbar
                              builder: (BuildContext context) {
                            return FlutterSlider(
                              values: [_lowerValue],
                              max: 1000,
                              min: 100,
                              trackBar: FlutterSliderTrackBar(
                                activeTrackBarHeight: 1,
                                activeDisabledTrackBarColor: Color(0xFFe06287),
                                activeTrackBar: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFe06287),
                                ),
                              ),
                              onDragging:
                                  (handlerIndex, lowerValue, upperValue) {
                                setState(() {
                                  _lowerValue = lowerValue;
                                });
                              },
                              onDragCompleted:
                                  (handlerIndex, lowerValue, upperValue) {
                                setState(() {
                                  _lowerValue = lowerValue;
                                });
                              },
                              handler: FlutterSliderHandler(
                                decoration: BoxDecoration(),
                                child: Material(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFe06287),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Expanded(
                          child: Container(
                              child: Text(
                            "$_lowerValue", // should display currentValue
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      transform: Matrix4.translationValues(00.0, -10.0, 0.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 100),
                            alignment: Alignment.topRight,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Montserrat',
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(right: 20),

                              // decoration: BoxDecoration(
                              //   color: const Color(0xFFe06287), border:  Border.all(color: const Color(0xFFe06287),),borderRadius:BorderRadius.circular(10
                              //
                              // ),)

                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Color(0xFFe06287),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 12),
                                ),
                              )),
                        ],
                      )),
                  Container(
                    // transform: Matrix4.translationValues(00.0,-50.0, 0.0),

                    child: Body(),
                  ),
                ]),
              );
            },
          );
        });
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
