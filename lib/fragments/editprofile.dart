import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/appbar/searchresult.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/screens/savelocation.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new EditProfile(),
  ));
}*/

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => new _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();
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
    {
      "discount": "50%",
      "dark_color": const Color(0xFFb5b8ff),
      "light_color": const Color(0xFFc8caff)
    },
    {
      "discount": "30%",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
  ];

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
        //  resizeToAvoidBottomInset: false,

          backgroundColor: Colors.white,
         appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Colors.black,size: 30,),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Edit Profile",
            style: TextStyle(color: Colors.black, fontFamily: 'Montserrat',fontSize: 16,fontWeight: FontWeight.w600),),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,

            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,

                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (ctxt) => new SearchResult()));





                  // do something
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctxt) =>  HomeScreen(0)));




                  // do something
                },
              ),
            ],
          ),

          key: _drawerscaffoldkey,

          //set gobal key defined above

          // drawer: new DrawerOnly(),

          body: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: const Color(0xFFf1f1f1), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            "images/roundprofile.png",
                            width: 90,
                            height: 90,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          // width: 150,
                          child: Center(
                            child: Text(
                              'Darshi Patel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 11, top: 25),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Personal Info',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Edit your name',
                      style: TextStyle(
                          color: const Color(0xFF999999),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: TextFormField(
                      autofocus: false,
                      initialValue: "Darshi Patel",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFf1f1f1),
                        hintText: 'Enter your Name',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
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
                    margin: EdgeInsets.only(left: 20, top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Edit your EmailId',
                      style: TextStyle(
                          color: const Color(0xFF999999),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: TextFormField(
                      autofocus: false,
                      initialValue: "darshi123@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFf1f1f1),
                        hintText: 'Enter your EmailId',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
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
                    margin: EdgeInsets.only(left: 20, top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Edit your Contact Number',
                      style: TextStyle(
                          color: const Color(0xFF999999),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: TextFormField(
                      autofocus: false,
                      initialValue: "1234567890",
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFf1f1f1),
                        hintText: 'Enter your Contact Number',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
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

                    margin: EdgeInsets.only(left: 10,top: 20,right: 10,bottom: 10),


                    child: MySeparator(),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 11, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Manage Your Location',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ),

                  GestureDetector(

                    onTap: (){

                      Navigator.push(context,
                          new MaterialPageRoute(builder: (ctxt) => new SaveLocation()));
                      },

                    child:     Container(
                      margin: EdgeInsets.only(left: 11, top: 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '+ Add New Location',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Montserrat'),
                      ),
                    ),


                  ),




                  Container(
                    margin: EdgeInsets.only(left: 11, top: 10),


                    child:   Container(

                      height: 60,


                      width: double.infinity,
                      margin: EdgeInsets.only(left: 1, top:00 ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenwidth * .1,
                            alignment:FractionalOffset.topCenter,
                            margin: EdgeInsets.only(top: 10),
                            child: SvgPicture.asset("images/location_black.svg",width: 20,
                              height: 20,


                            ),
                          ),
                          Container(
                            //height: 35,
                            alignment:FractionalOffset.topLeft,

                            width: screenwidth * .5,
                            transform: Matrix4.translationValues(0.0, 5.0, 0.0),




                            child: Column(


                              children: [
                                Text(
                                  'Vishwashanti marg',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat'),
                                ),

                                Text(
                                  'Pune, Maharastra, india',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      fontFamily: 'Montserrat'),
                                ),



                              ],

                            ),
                          ),

                          Container(

                              width: screenwidth * .25,
                              margin: EdgeInsets.only(right: 5),
                              transform: Matrix4.translationValues(5.0, -10.0, 0.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [

                                    WidgetSpan(

                                      child: Container(

                                        margin:EdgeInsets.only(top: 5),
                                        child: SvgPicture.asset("images/delete.svg",
                                          color: const Color(0xFFff4040),),
                                      ),
                                    ),
                                    WidgetSpan(


                                      child: Container(
                                        margin: EdgeInsets.only(top: 5,left: 5),

                                        child: Text("Remove", style: TextStyle(color: const Color(0xFFff4040),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),

                                      ),


                                    ),




                                  ],
                                ),
                              )

                          ),


                        ],
                      ),
                    ),







                  ),
                  Container(
                    margin: EdgeInsets.only(left: 11, top: 10),


                    child:   Container(

                      height: 60,


                      width: double.infinity,
                      margin: EdgeInsets.only(left: 1, top:00 ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenwidth * .1,
                            alignment:FractionalOffset.topCenter,
                            margin: EdgeInsets.only(top: 10),
                            child: SvgPicture.asset("images/location_black.svg",width: 20,
                              height: 20,


                            ),
                          ),
                          Container(
                            //height: 35,
                            alignment:FractionalOffset.topLeft,

                            width: screenwidth * .5,
                            transform: Matrix4.translationValues(0.0, 5.0, 0.0),




                            child: Column(


                              children: [
                                Text(
                                  'Vishwashanti marg',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat'),
                                ),

                                Text(
                                  'Pune, Maharastra, india',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      fontFamily: 'Montserrat'),
                                ),



                              ],

                            ),
                          ),

                          Container(

                              width: screenwidth * .25,
                              margin: EdgeInsets.only(right: 5),
                              transform: Matrix4.translationValues(5.0, -10.0, 0.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [

                                    WidgetSpan(

                                      child: Container(

                                        margin:EdgeInsets.only(top: 5),



                                        child: SvgPicture.asset("images/delete.svg",
                                          color: const Color(0xFFff4040),),
                                      ),
                                    ),
                                    WidgetSpan(


                                      child: Container(
                                        margin: EdgeInsets.only(top: 5,left: 5),

                                        child: Text("Remove", style: TextStyle(color: const Color(0xFFff4040),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),

                                      ),


                                    ),



                                  ],
                                ),
                              )

                          ),


                        ],
                      ),
                    ),

                  ),

                  Container(
                    margin: EdgeInsets.only(left: 11, top: 20),

                    child: Center(



                      child: RaisedButton(

                        onPressed: (){
                          print('click');

                        },

                        child: Text('Change this',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),


                        textColor: Colors.white,
                        color: Color(0xFF4a92ff),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                    ),




                  ),

                  Container(


                  )




                ],
              )
          )
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

        // child: CustomView(),

      ),
    );
  }
}
