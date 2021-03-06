import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/appbar/searchresult.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/fragments/appoinment.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_tatto/screens/loginscreen.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';

Widget appbar(BuildContext context, String title, dynamic otherData,bool isBackArrow) {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = otherData;


  return AppBar(


          backgroundColor: Colors.black,
           brightness: Brightness.light,

          centerTitle: true,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.white),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontSize: 16,fontWeight: FontWeight.w600),
          ),
          leading:!isBackArrow ?  IconButton(
            onPressed: () {
              _drawerscaffoldkey.currentState.openDrawer();
            },
            icon: Icon(Icons.menu,color: Colors.white,),
          ):IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
               showcancledialog(context);
              },
              child:

              Container(

                  margin: EdgeInsets.only(top: 1,right: 10),

                  child: Icon(Icons.logout,color: Colors.white,)
              ),
            ),


            /*
            GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (ctxt) => new HomeScreen(0)));
                },
                child:   Container(
                    margin: EdgeInsets.only(top: 1,right: 20,left: 10),

                    child: SvgPicture.asset("images/calendar.svg",width: 18,height: 18,
                    color: appon
                        ? Colors.pink
                        : Colors.black,)
                )
            ),*/
          ],





  );

}
void showcancledialog(BuildContext context) {

  showProcessBar(BuildContext context) {
    AlertDialog alert = AlertDialog(
        backgroundColor: Color(0x01000000),
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        content: Container(
          height: 50,
          child: SpinKitWave(
            color: Colors.white,
            size: AppSizes.appVerticalLg * 0.55,
          ),
        ));
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final _notifier = Provider.of<AuthViewModel>(context);


        Widget cancelButton = FlatButton(
          child: Text("No",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
          onPressed:  () {
            Navigator.pop(context);


          },
        );
        Widget continueButton = FlatButton(
          child: Text("Yes",style: TextStyle(color: const Color(0xFFe06287),fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
          onPressed:  () async {
            // SharedPreferences preferences = await SharedPreferences.getInstance();
            // await preferences.clear();

            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //     LoginScreen()), (Route<dynamic> route) => false);

           // Navigator.pop(context);
            showProcessBar(context);
             await _notifier.getUserLogout();
            if(_notifier.isLogout){
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  LoginScreen()), (Route<dynamic> route) => false);
              print("------------------- ok-----------------");
            }else{
              print("-------------------not ok-----------------");
            }


          },
        );

        return AlertDialog(
          actions: [
            cancelButton,
            continueButton,
          ],


          title: Center(child: Text('Logout !',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text(
                  "Are you sure you want logout?  ",
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
