import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/common/customwidget.dart';
import 'package:the_tatto/model/checklist.dart';
import 'package:the_tatto/screens/bookapointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServiceTab(),
    );
  }
}*/

class ServiceTab extends StatefulWidget {
  ServiceTab({Key key}) : super(key: key);

  @override
  _ServiceTab createState() => _ServiceTab();
}

class _ServiceTab extends State<ServiceTab> {


  int currentSelectedIndex;
  String categoryname;

  List categorydatalist = [

    {
      "category": "Salon",
      "dark_color": const Color(0xFFb5b8ff),
      "light_color": const Color(0xFFc8caff)
    },
    {
      "category": "Styling",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Mackup",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shaving",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shampoo",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },

    {
      "category": "Shampoo",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },

    {
      "category": "Shampoo",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shampoo",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shampoo",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
  ];





  @override
  Widget build(BuildContext context) {

    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: new Container(
            color: Colors.blue,

            margin: EdgeInsets.only(bottom: 50),

            child: Stack(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(


                        child: ListView(
                          children: <Widget>[
                            // child:

                            Container(
                              // height: 50,
                              color: Colors.white,
                              // color: Colors.red,
                              alignment: FractionalOffset.topCenter,
                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),

                                children: <Widget>[


                                /*  Container(
                                    color:Colors.white,
                                    margin: EdgeInsets.only(top: 0.0,left: 10,right: 10),
                                    // color: Colors.white,
                                    height: 45,

                                    // height:screenHeight * .06,
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
                                  ),*/

                                /*  Container(
                                    margin: EdgeInsets.only(top: 0.0,left: 10,right: 10),
                                    color: Colors.white,
                                    height: 40,
                                    // height:screenHeight * .06,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 20, top: 5),
                                          alignment: Alignment.topLeft,

                                          // child:Text(categoryname.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 18)),
                                          child: Text("",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 16)),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20, top: 5),
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                                onTap: () {
                                                  //  _newTaskModalBottomSheet(context);
                                                },
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: "Filter ",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight.w600,fontFamily: "Montserrat")),
                                                      WidgetSpan(
                                                        child: Icon(
                                                          Icons.filter_alt_sharp,
                                                          size: 14,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))),
                                      ],
                                    ),
                                  ),*/



                                  // Expanded(
                                  // flex: 2,
                                  //  child:

                                  Container(

                                    // height: screenHeight * 0.31,
                                    height: 300,

                                    child: ListView(

                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),

                                        children: <Widget>[


                                          Container(

                                            margin: EdgeInsets.only(top: 0.0,left: 10,right: 10,bottom: 130),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (BuildContext context, int index) {

                                                return new Checklist(
                                                  category: categorydatalist[index]
                                                  ['category'],
                                                  dark_color: categorydatalist[index]
                                                  ['dark_color'],
                                                  light_color: categorydatalist[index]
                                                  ['light_color'],
                                                );
                                              },
                                              itemCount: categorydatalist.length,
                                            ),

                                          ),


                                        ]

                                    ),



                                  ),
                                  // ),
                                ],



                              ),
                            ),






                          ],),





                      ),



                      Container(
                        height: 50,
                        // color: Colors.red,
                        alignment: FractionalOffset.bottomCenter,


                        child:Row(

                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[

                            Container(
                              width:screenwidth * .35,
                              margin: EdgeInsets.only(left: 10),
                              alignment: FractionalOffset.centerLeft,
                              child: Text(
                                "Total 250 ₹ ",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),

                            ),
                            Container(
                              width: screenwidth * .45,
                              margin: EdgeInsets.only(left: 10),
                              alignment: FractionalOffset.center,
                                child:   FlatButton(
                                  onPressed: () {

                                    Navigator.push(context,
                                        new MaterialPageRoute(builder: (ctxt) => new BookApointment()));


                                  },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text("Book service",style: TextStyle(color: Colors.blue,  fontWeight: FontWeight.w600,  fontFamily: 'Montserrat',fontSize: 14),),
                                )

                            ),

                            Container(
                              width: screenwidth * .05,
                              margin: EdgeInsets.only(left: 5),
                              alignment: FractionalOffset.center,

                              child: SvgPicture.asset("images/cancel.svg",

                              ),

                            ),


                          ],

                        ),

                      ),



                    ],
                  ),

                ),

              ],
            )

          /*

        ),*/

        ),
      ),
    );
  }
}