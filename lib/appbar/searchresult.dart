import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/model/topservicedata.dart';
import 'package:flutter/material.dart';



/*void main() => runApp(new SearchResult());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
     // home: new SearchResult(),
    );
  }
}*/

class SearchResult extends StatefulWidget {

  @override
  _SearchResult createState() => new _SearchResult();
}

class _SearchResult extends State<SearchResult> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();
  int currentSelectedIndex = 0;

  String categoryname = "All";

  bool valuefirst = false;
  var rating = 0.0;
  bool valuesecond = false;

  bool _rememberMeFlag = false;
  int _groupValue = -1;
  double _lowerValue = 250;

  List categorydatalist = [
    {
      "category": "All",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
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
  ];




  // @override
  // void initState() {
  //   super.initState();
  //
  //
  //
  // }




  @override
  Widget build(BuildContext context) {
    dynamic screenwidth = MediaQuery.of(context).size.width;



    return new SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomInset: false,
          key: _drawerscaffoldkey,
          //set gobal key defined above

          // drawer: new DrawerOnly(),
          body: new Stack(
            children: <Widget>[
              new Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 10,top: 10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(

                                onTap:(){

                                 Navigator.of(context).pop();


                               },




                              child: Container(




                                  width: screenwidth * .1,
                                  height: 40,
                                  alignment:FractionalOffset.topCenter,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Icon(Icons.keyboard_arrow_left,size: 35,


                                  ),


                              ),
                            ),

                            Container(
                              //height: 35,
                              alignment:FractionalOffset.topLeft,

                              width: screenwidth * .65,
                              height: 40,
                              transform: Matrix4.translationValues(0.0, 5.0, 0.0),

                              child: TextField(
                                autofocus: false,
                                // initialValue: "darshi123@gmail.com",
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.search,size: 22),
                                      onPressed: () {

                                        debugPrint('222');
                                      }),
                                  fillColor: const Color(0xFFf1f1f1),
                                  hintText: 'Search here',
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 10.0, top: 0.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: const Color(0xFFf1f1f1)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: const Color(0xFFf1f1f1)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),





                            ),

                            Container(

                              width: screenwidth * .15,
                              margin: EdgeInsets.only(right: 5),
                              // transform: Matrix4.translationValues(5.0, 10.0, 0.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("cancel",style: TextStyle(color: Color(0xFFff4040),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 14),


                                  )
                              ),

                            ),


                          ],
                        ),
                      ),
                    ),


                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        color: Colors.white,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              alignment: Alignment.topLeft,

                              // child:Text(categoryname.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 18)),
                              child: Text("Search result for.. Hair Style(5)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 10, top: 10),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      // _newTaskModalBottomSheet(context);
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
                                                  FontWeight.w500,fontFamily: "Montserrat")),
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
    );
  }

/*
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
                          fontWeight: FontWeight.w600,fontFamily: "Montserrat"),
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
                                                  fontWeight: FontWeight.w800,fontFamily: "Montserrat"),
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
                                                  fontWeight: FontWeight.w800,fontFamily: "Montserrat"),
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
                      margin: new EdgeInsets.only(
                          left: 15.0),
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
                                          fontWeight: FontWeight.w800,fontFamily: "Montserrat"),
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
                      )
                  ),
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
                      transform:     Matrix4.translationValues(00.0, -18.0, 0.0),
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
                              title: Text("Male", style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,fontFamily: "Montserrat"),),
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                              activeColor: Color(0xFFe06287),
                              selected: false,
                            ),
                          ),
                          Expanded(

                            child:Container(
                              transform: Matrix4.translationValues(-30.0, 00.0, 0.0),
                              child: RadioListTile(
                                value: 1,
                                groupValue: _groupValue,
                                title: Text("Female", style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),),
                                onChanged: (newValue) =>
                                    setState(() => _groupValue = newValue),
                                activeColor: Color(0xFFe06287),
                                selected: false,
                              ),



                            ),

                          ),
                        ],
                      )
                  ),

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
                    margin: EdgeInsets.only(top: 0.0,left: 15,right: 15),
                    color: Colors.white,
                    height: 120,
                    child: GridView.builder(
                      shrinkWrap : true,
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
                      },  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

                    child:Row(
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
                          child: Text("("+rating.toString().replaceAll(RegExp(r'.0'), '')+")",  style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,fontFamily: "Montserrat"),),
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
                          fontWeight: FontWeight.w600,fontFamily: "Montserrat"),
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 1, left: 15),
                  ),


                  new Container(
                    transform: Matrix4.translationValues(00.0,5.0, 0.0),

                    child:Row(

                      children: <Widget>[

                        Flexible(
                          flex: 3,


                          child:

                          Builder(
                            //Needed to find Scaffold.of(context) and display the snackbar
                              builder: (BuildContext context) {
                                return FlutterSlider(
                                  values: [_lowerValue],
                                  max: 1000,
                                  min: 100,
                                  trackBar: FlutterSliderTrackBar(
                                    activeTrackBarHeight:1,
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
                                            shape: BoxShape.circle
                                        ),
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
                      transform: Matrix4.translationValues(00.0,-10.0, 0.0),

                      child:Stack(

                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 100),
                            alignment: Alignment.topRight,


                            child: FlatButton(
                              onPressed: (){

                                Navigator.pop(context);

                              },
                              child: Text("Cancel",style: TextStyle(color: Colors.grey,  fontFamily: 'Montserrat',fontSize: 12),),

                            ),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(right: 20),

                              // decoration: BoxDecoration(
                              //   color: const Color(0xFFe06287), border:  Border.all(color: const Color(0xFFe06287),),borderRadius:BorderRadius.circular(10
                              //
                              // ),)

                              child:   FlatButton(
                                onPressed: () {

                                  Navigator.pop(context);



                                },
                                color: Color(0xFFe06287),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text("Apply",style: TextStyle(color: Colors.white,  fontFamily: 'Montserrat',fontSize: 12),),
                              )
                          ),






                        ],







                      )










                  ),

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
*/


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
