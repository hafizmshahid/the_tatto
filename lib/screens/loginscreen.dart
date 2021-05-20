import 'dart:convert';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gson/gson.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/ResponseModel/loginResponse.dart';
import 'package:the_tatto/apiservice/Apiservice.dart';
import 'package:the_tatto/apiservice/Retro_Api.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/screens/otpscreen.dart';
import 'package:the_tatto/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';

import 'forgotpassword.dart';
import 'homescreen.dart';
import 'package:email_validator/email_validator.dart';
/*
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new LoginScreen(),
    theme: ThemeData(
      primarySwatch: Colors.black,
    ),
  ));
}*/

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => new _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  FocusNode myFocusNode;
  String _username, _email, _password = "";
  final _formKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  ProgressDialog pr;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> signInForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    pr = new ProgressDialog(context);
    pr.style(
      message: 'Please Wait...',
      borderRadius: 5.0,
      backgroundColor: Colors.white,
      progressWidget: SpinKitFadingCircle(color: Color(0xFFe06287)),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat'),
      messageTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat'),
    );

    return new SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: signInForm,
          child: Stack(children: <Widget>[
             Container(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/bg_image.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            new ListView(
              children: [
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(top: 150.0, left: 100.0),
                    alignment: FractionalOffset.topLeft,
                    child: Text(
                      "The",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0.0, left: 130.0),
                  alignment: FractionalOffset.topLeft,
                  child: Text(
                    "Tattoo.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  alignment: FractionalOffset.topCenter,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (email) => EmailValidator.validate(email)
                        ? null
                        : "Invalid email address",
                    //   onSaved: (email) => _email = email,
                    onSaved: (value) => _notifier.signInEmail = value,
                    onFieldSubmitted: (_) {
                      fieldFocusChange(
                          context, _emailFocusNode, _passwordFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent.withOpacity(0.50),
                      hintText: 'Email id',
                      hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent.withOpacity(0.50)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent.withOpacity(0.50)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  alignment: FractionalOffset.topCenter,
                  child: TextFormField(
                    obscureText: true,
                    focusNode: _passwordFocusNode,
                    validator: (password) {
                      Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(password))
                        return 'Invalid password';
                      else
                        return null;
                    },
                    onSaved: (value) => _notifier.signInPassword = value,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent.withOpacity(0.50),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent.withOpacity(0.50)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent.withOpacity(0.50)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10, right: 15.0),
                    alignment: FractionalOffset.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat'),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: FractionalOffset.center,
                    // width: 500,
                    // height: 50,
                    // color: Colors.pink,

                    child: MaterialButton(
                      minWidth: 300,
                      height: 35,
                      //  color: const Color(0xFF18FF10),
                      color: kGreenColor,
                      onPressed: () async {
                        if(signInForm.currentState.validate()){
                          signInForm.currentState.save();

                 /*       Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => HomeScreen(2)));*/
                        showProcessBar(context);
                        await _notifier.validateAndSubmitSignIn();
                        if (_notifier.isSignIn) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(2)),
                            // var savedValue = preferences.getString('value_key');
                          );
                         // _notifier.isSignIn = false;
                          // Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                        } else {
                          Navigator.pop(context);
                          print("----------------not ok  ${_notifier.authMsg}------------------");
                          Fluttertoast.showToast(
                            msg: _notifier.authMsg,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }

                        /*  if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                             var connectivityResult = await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.mobile) {
                              pr.show();
                              CallApiForLogin(_email,_password);
                            } else if (connectivityResult == ConnectivityResult.wifi) {
                              pr.show();
                              CallApiForLogin(_email,_password);
                            }else{

                              toastMessage("No Internet Connection");
                            }

                              toastMessage("Email: $_email\nPassword: $_password");
                            var preferences = await SharedPreferences.getInstance();
                            preferences.setString('email', _email);
                            preferences.setString('password', _password);

                         */ /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(2)),

                            // var savedValue = preferences.getString('value_key');
                          );*/ /*
                        }*/
                      } else {

                          Fluttertoast.showToast(
                            msg: "Please fill all field",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }

                        },
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          alignment: FractionalOffset.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Montserrat'),
                                ),
                                new Text(
                                  ' Register.',
                                  style: TextStyle(
                                      color: kGreenColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Montserrat'),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      PreferenceUtils.init();
    });
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      //  timeInSecForIos: 1,
      fontSize: 16.0,
      backgroundColor: Colors.black,
    );
  }

  // @override
  // void dispose() {
  //   // Clean up the focus node when the Form is disposed.
  //   myFocusNode.dispose();
  //
  //   super.dispose();
  // }

  /*Login Api Call*/

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

  Future<void> CallApiForLogin(String email, String password) async {
    String fcmtoken = PreferenceUtils.getString(AppConstant.fcmtoken);

    RestClient(Retro_Api().Dio_Data())
        .login(email, password, fcmtoken)
        .then((response) {
      setState(() {
        // gson.decode(response);
        print(response.toString());
        final body = json.decode(response);

        bool sucess = body['success'];
        print(sucess);

        pr.hide();

        if (sucess == true) {
          var token = body['data']['token'];

          PreferenceUtils.setString(AppConstant.headertoken, token);

          print(token);
          toastMessage("login successfully");

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(2)),
          );
        } else if (sucess == false) {
          var msg = body['msg'];
          print(msg);

          if (msg == "Verify your account") {
            toastMessage("Verify your account");

            var userid = body['data'].toString();
            print("loginuserid:$userid");
            PreferenceUtils.setString(AppConstant.userid, userid);
            PreferenceUtils.setString(AppConstant.useremail, email);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpScreen()),
            );
          }
        }
      });
    }).catchError((Object obj) {
      pr.hide();
      print("error:$obj.");
      print(obj.runtimeType);

      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print(res);

          var responsecode = res.statusCode;
          // print(responsecode);

          if (responsecode == 401) {
            toastMessage("Invalid email or password");

            print("Got error : ${res.statusCode} -> ${res.statusMessage}");
            print("Invalid email or password");
            pr.hide();
          } else if (responsecode == 422) {
            print("Invalid Data");
            pr.hide();
          }

          break;
        default:
      }
    });
  }
}
