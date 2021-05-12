import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/model/appointmentdata.dart';
import 'package:the_tatto/screens/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';




/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Appoinment(),
  ));
}*/
class Appoinment extends StatefulWidget {

  @override
  _Appoinment createState() => new _Appoinment();
}


class _Appoinment extends State<Appoinment> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();

  List appoinmentdatalist = [
    {"discount": "10%", "dark_color":const Color(0xFFffb5cc) , "light_color": const Color(0xFFffc8de),},
    // {"discount": "50%", "dark_color": const Color(0xFFb5b8ff), "light_color": const Color(0xFFc8caff)},
    // {"discount": "30%", "dark_color": const Color(0xFFffb5b5), "light_color": const Color(0xFFffc8c8)},


  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;
    return BaseScaffold(
      backgroundColor:kAppPrimaryColor,
      appBarHeading: "Appointment",
      bottomBarIndex: 0,
      isBackArrow: false,
      body: Scaffold(

          resizeToAvoidBottomInset: true,
          backgroundColor:Colors.transparent,

          //second scaffold
          key: _drawerscaffoldkey,

          //set gobal key defined above

          drawer: new DrawerOnly(),

          body: new Stack(
            children: <Widget>[
              new SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Container(
                        margin: EdgeInsets.only(top: 5.0,left: 10,right: 10),

                        child:GestureDetector(

                          onTap: (){

                            print('item clicked');

                          },

                          child:ListView.builder(


                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),


                            itemBuilder: (BuildContext context, int index) {
                              return new AppointmentData(
                                discount: appoinmentdatalist[index]['discount'],
                                dark_color: appoinmentdatalist[index]['dark_color'],
                                light_color: appoinmentdatalist[index]['light_color'],
                              );
                            },
                            itemCount: appoinmentdatalist.length,
                          ),

                        )


                    ),
                  ],
                ),
              ),

            ],

          )

      ),
    );
    }

  void showcancledialog(BuildContext context) {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {

          Widget cancelButton = FlatButton(
            child: Text("No",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
            onPressed:  () {
              Navigator.pop(context);


            },
          );
          Widget continueButton = FlatButton(
            child: Text("Yes",style: TextStyle(color: const Color(0xFFe06287),fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
            onPressed:  () {
              Navigator.pop(context);

            },
          );

          return AlertDialog(
            actions: [
              cancelButton,
              continueButton,
            ],


            title: Center(child: Text('Cancel Appointment !',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "Are you sure you want to cancel your appointment?  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 18,fontFamily: 'Montserrat'
                    ),
                  ),
                ),

              ],
            ),
          );
        });




  }







  }


