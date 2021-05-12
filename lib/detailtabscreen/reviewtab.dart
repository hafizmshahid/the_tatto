import 'package:the_tatto/common/customwidget.dart';
import 'package:the_tatto/detailtabscreen/website.dart';
import 'package:the_tatto/model/checklist.dart';
import 'package:the_tatto/model/reviewdata.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Checked Listview',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ReViewTab(title: 'Flutter Checked Listview'),
    );
  }
}
*/

class ReViewTab extends StatefulWidget {
  ReViewTab({Key key, this.title}) : super(key: key);
  final String title;



  @override
  _ReViewTab createState() => _ReViewTab();
}

class _ReViewTab extends State<ReViewTab> {

  List<bool> inputs = new List<bool>();
  int currentSelectedIndex;
  String categoryname;
  var rating = 0.0;






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

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      for(int i=0;i<20;i++){
        inputs.add(true);
      }
    });
  }

  void ItemChange(bool val,int index){
    setState(() {
      inputs[index] = val;
    });
  }
  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
              padding: EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 50),

              // padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[


                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Review',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          ),

                        ),
                        GestureDetector(

                          onTap: (){


                            _newTaskModalBottomSheet(context);

                          },
                          child: Text(
                            '+ Add Your Review',
                            style: TextStyle(
                                color: const Color(0xFF4a92ff),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Total Review (117)',
                      style: TextStyle(
                          color: const  Color(0xFFaeaeae),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat'),
                    ),
                  ),



                  ListView(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),


                      children: <Widget>[


                        Container(

                          margin: EdgeInsets.only(top: 0.0,left: 0,right: 10,bottom: 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {

                              return new ReviewData(
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










                ],
              ))),
    );




  }

  void _newTaskModalBottomSheet(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;
    double height = 900.0;


    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                margin:EdgeInsets.only(top: 30,left: 15,bottom: 20),
                // height: screenHeight,


                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal:1,
                ),
                // You can wrap this Column with Padding of 8.0 for better design
                child:
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: <Widget>[
                  new Container(

                    margin:EdgeInsets.only(top: 5,left: 10),


                    child: Text(
                      'Share Your Experience',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,fontFamily: "Montserrat"),
                    ),
                    alignment: Alignment.topLeft,

                  ),


                      Container(

                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 25,left: 5,right: 10,bottom: 5),
                        width: screenwidth,
                        height: 70,
                        color: Colors.white,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[


                            Container(
                              width: screenwidth * .2,
                              height: 70,
                              // color: Colors.white,
                              alignment: Alignment.center,



                              child: Column(

                                children: <Widget>[


                                  Container(

                                    margin: EdgeInsets.only(top: 10),
                                    height: 40.0,
                                    width: 40.0,


                                    child:CircleAvatar(
                                      radius: 55,
                                      // backgroundColor: Color(0xffFDCF09),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage('images/the_barber.jpg'),
                                      ),
                                    ),
                                  ),





                                ],


                              ),


                            ),

                            Container(
                              alignment: Alignment.topLeft,
                              margin:EdgeInsets.only(top: 10,left: 5,right: 5),
                              width: screenwidth * .65,

                              height: 90,

                              decoration: BoxDecoration(
                                color: const Color(0xFFf1f1f1),
                                borderRadius: BorderRadius.circular(8),






                              ),


                              child:  Container(
                                // margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                                child: TextFormField(
                                  autofocus: false,
                                  initialValue: "Excellent Service.",
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  maxLines: 8,

                                  // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFf1f1f1),
                                    hintText: 'Enter review',
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 0.0, top: 5.0,right: 5),
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








                            ),





                          ],



                        ),


                      ),


                      new Container(

                        margin:EdgeInsets.only(top: 10,left: 10),


                        child: Text(
                          'How Many Stars you will Give',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,fontFamily: "Montserrat"),
                        ),
                        alignment: Alignment.topLeft,

                      ),

                      new Container(
                        margin:EdgeInsets.only(top: 10,left: 10),


                        alignment: Alignment.topLeft,

                        child: SmoothStarRating(
                              defaultIconData: Icons.star,
                              spacing: 2.5,
                              rating: 3,
                              color: Color(0xFFffc107),
                              borderColor: Colors.grey,
                              allowHalfRating: false,
                              size: 24,
                              starCount: 5,
                              onRated: (value) {
                                setState(() {
                                  rating = value;
                                  print(value);
                                });
                              },
                            ),









                      ),


                      Container(
                        margin: EdgeInsets.all(10),
                        child: FlatButton(

                          minWidth: double.infinity,
                          height: 40,
                          onPressed: (){
                            Navigator.pop(context);




                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(color: const Color(0xFFe06287),width: 2)
                          ),


                          child: Text('Share Review',style: TextStyle(color: const Color(0xFFe06287),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize:14),

                          ),
                        ),





                      ),

































                    ]

                ),
              );
            },
          );
        });
  }

}