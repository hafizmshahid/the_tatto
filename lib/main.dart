import 'dart:async';
import 'package:provider/provider.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:the_tatto/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_constant.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'constant/preferenceutils.dart';
import 'fcm.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ], child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      home: StatUpLogic(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new LoginScreen()
      },
    );
  }
}


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }


  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    //_firebaseMessaging.getToken().then((String token) {
    /*   assert(token != null);
      setState(() {
        PreferenceUtils.init();




        print("Token123:$token");

        savetoken(token);
      });

    });*/

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/bg_image.jpg'),
                  fit: BoxFit.fill,
                ),
              ),

              /* child: Stack(
            children: <Widget>[

              // Expanded(

                  // child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 45.0,left: 70.0),
                          alignment: FractionalOffset.bottomLeft,

                          child: Text("The",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w500,fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ],
                  ),

              // ),

              // Expanded(
              //     child:
                  Container(
                    margin: const EdgeInsets.only(top: 1.0,left: 110.0),


                    alignment: FractionalOffset.bottomLeft,
                    child: Text("BARBER.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),
                    ), )
              // )





            ],


          )*/


              /*

          ),*/
            ),
            Align(alignment: Alignment.center,


              child: Text("Tattoo", style: TextStyle(fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Dancing Script',
                  fontWeight: FontWeight.w900)),)
          ],
        ),
      ),


    );
  }

  Future<void> savetoken(String token) async {
    PreferenceUtils.setString(AppConstant.fcmtoken, token);


/*
    var preferences = await SharedPreferences.getInstance();// Save a value
    preferences.setString('fcmtoken', token);// Retrieve value later*/


  }
}

class StatUpLogic extends StatelessWidget {
  const StatUpLogic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (_, prefs) {
        if (prefs.hasData) {
          if (prefs.data.getString(kLoginAccessToken) != null) {
            return HomeScreen(0);
            // return MyProfilePage();
          } else {
            return SplashScreen();
          }
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}