import 'dart:async';
import 'package:the_tatto/apiservice/Apiservice.dart';
import 'package:the_tatto/apiservice/Retro_Api.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'changepassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'loginscreen.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new OtpScreen(),
  ));
}*/

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreen createState() => new _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startTimer();
    setState(() {
      PreferenceUtils.init();
    });
  }

  Timer _timer;
  int _start = 60;
  var otp = "";
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    var otp1 = PreferenceUtils.getString(AppConstant.userotp);
    print(otp1);

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
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w600));

    // var otp = PreferenceUtils.getInt(AppConstant.userotp).toString();
    // print("otp123:$otp");
    return new Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Verification",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
            child: Stack(children: <Widget>[
          // Expanded(
          //
          //    child:
          ListView(
            children: [
              Container(
                child: Container(
                  margin: const EdgeInsets.only(top: 100.0, left: 0.0),
                  alignment: FractionalOffset.center,
                  child: Text(
                    "OTP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: const EdgeInsets.only(top: 1.0, left: 0.0),
                  alignment: FractionalOffset.center,
                  child: Text(
                    "Set your $otp1 here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 0.0),
                  alignment: FractionalOffset.center,
                  child: Text(
                    "00:" + "$_start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xFF999999),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(top: 20.0, left: 0.0),

                alignment: FractionalOffset.center,
                child: PinCodeTextField(
                  autofocus: true,
                  hideCharacter: false,
                  highlight: false,
                  pinBoxColor: const Color(0xFFf1f1f1),
                  highlightColor: const Color(0xFFf1f1f1),
                  defaultBorderColor: const Color(0xFFf1f1f1),
                  hasTextBorderColor: const Color(0xFFf1f1f1),
                  pinBoxBorderWidth: 2,
                  maxLength: 4,
                  onTextChanged: (text) {
                    setState(() {
                      print('hi');
                    });
                  },
                  onDone: (text) async {
                    print("DONE $text");

                    otp = text;

/*

                      var connectivityResult = await (Connectivity().checkConnectivity());
                      if (connectivityResult == ConnectivityResult.mobile) {
                        pr.show();
                        CallOtpcheckApi(otp);

                      } else if (connectivityResult == ConnectivityResult.wifi) {
                        pr.show();
                        CallOtpcheckApi(otp);

                      }else{

                        toastMessage("No Internet Connection");
                      }
*/
                  },
                  pinBoxWidth: 50,
                  pinBoxHeight: 50,
                  pinBoxOuterPadding: const EdgeInsets.all(10.0),
                  pinBoxRadius: 10,
                  hasUnderline: false,

                  wrapAlignment: WrapAlignment.center,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle:
                      TextStyle(fontSize: 22.0, color: const Color(0xFF999999)),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.defaultNoTransition,
                  highlightPinBoxColor: const Color(0xFFf1f1f1),
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
                  highlightAnimationBeginColor: const Color(0xFFf1f1f1),
                  highlightAnimationEndColor: const Color(0xFFf1f1f1),
                  keyboardType: TextInputType.number,
                ), // end PinEntryTextField()
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  alignment: FractionalOffset.center,
                  // width: 500,
                  // height: 50,
                  // color: Colors.pink,

                  child: MaterialButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    minWidth: 300,
                    height: 40,
                    color: const Color(0xFFe06287),
                    onPressed: () async {
                      if (otp.length == 0 && otp.length < 4) {
                        toastMessage("Invalid Text");
                      } else {
                        /*   var connectivityResult = await (Connectivity().checkConnectivity());
                          if (connectivityResult == ConnectivityResult.mobile) {
                            pr.show();
                            CallOtpcheckApi(otp);

                          } else if (connectivityResult == ConnectivityResult.wifi) {
                            pr.show();
                            CallOtpcheckApi(otp);

                          }else{

                            toastMessage("No Internet Connection");
                          }

                        }*/

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()),
                        );
                      }
                    },
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
                        margin: const EdgeInsets.only(top: 20.0),
                        alignment: FractionalOffset.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                           /* var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (connectivityResult ==
                                ConnectivityResult.mobile) {
                              pr.show();
                              CallResendOtpApi();
                            } else if (connectivityResult ==
                                ConnectivityResult.wifi) {
                              pr.show();
                              CallResendOtpApi();
                            } else {
                              toastMessage("No Internet Connection");
                            }*/

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                          },
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                'Don\'t receive OPT ?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),
                              new Text(
                                ' Resend.',
                                style: TextStyle(
                                    color: const Color(0xFFe06287),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),

          // ),
        ])));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  void toastMessage(String message) {
 /*   Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      //timeInSecForIos: 1,
      fontSize: 16.0,
      backgroundColor: Colors.black,
    );*/
  }

  /*Call Api For Check Otp*/

  void CallOtpcheckApi(String otp) {
    var userid = PreferenceUtils.getString(AppConstant.userid);
    print("userid:$userid");

    RestClient(Retro_Api().Dio_Data()).checkotp(otp, userid).then((response) {
      setState(() {
        print(response.success);
        if (response.success = true) {
          toastMessage(response.msg);

          PreferenceUtils.setString(
              AppConstant.userid, response.data.id.toString());
          PreferenceUtils.setString(AppConstant.username, response.data.name);
          PreferenceUtils.setString(AppConstant.useremail, response.data.email);
          PreferenceUtils.setString(
              AppConstant.userotp, response.data.otp.toString());
          PreferenceUtils.setString(AppConstant.userphone, response.data.phone);
          PreferenceUtils.setString(
              AppConstant.userphonecode, response.data.code);
          PreferenceUtils.setString(AppConstant.userimage, response.data.image);
          PreferenceUtils.setString(
              AppConstant.imagePath, response.data.imagePath);
          PreferenceUtils.setString(
              AppConstant.role, response.data.role.toString());
          pr.hide();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else if (response.success = false) {
          print(response.msg);
          toastMessage(response.msg);
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
          var msg = res.statusMessage;
          print(responsecode);
          print(responsecode);

          if (responsecode == 401) {
            toastMessage("Invalid Otp");

            /* print("Got error : ${res.statusCode} -> ${res.statusMessage}");
            print("Invalid email or password");*/
            pr.hide();
          } else if (responsecode == 422) {
            print("Invalid OTP");
            pr.hide();
          } else if (responsecode == 500) {
            toastMessage("Internal Server Error");
            pr.hide();
          }

          break;
        default:
      }
    });
  }

  /*Call Api For resend Api */

  void CallResendOtpApi() {
    var useremail = PreferenceUtils.getString(AppConstant.useremail);
    print("useremail:$useremail");

    RestClient(Retro_Api().Dio_Data()).sendotp(useremail).then((response) {
      setState(() {
        print(response.success);
        if (response.success = true) {
          toastMessage(response.msg);

          PreferenceUtils.setString(
              AppConstant.userid, response.data.id.toString());
          PreferenceUtils.setString(AppConstant.username, response.data.name);
          PreferenceUtils.setString(AppConstant.useremail, response.data.email);
          PreferenceUtils.setString(
              AppConstant.userotp, response.data.otp.toString());
          PreferenceUtils.setString(AppConstant.userphone, response.data.phone);
          PreferenceUtils.setString(
              AppConstant.userphonecode, response.data.code);
          PreferenceUtils.setString(AppConstant.userimage, response.data.image);
          PreferenceUtils.setString(
              AppConstant.imagePath, response.data.imagePath);
          PreferenceUtils.setString(
              AppConstant.role, response.data.role.toString());
          pr.hide();

          startTimer();
        } else if (response.success = false) {
          print(response.msg);
          toastMessage(response.msg);
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
          var msg = res.statusMessage;
          print(responsecode);
          print(responsecode);

          if (responsecode == 401) {
            toastMessage("Invalid Otp");

            /* print("Got error : ${res.statusCode} -> ${res.statusMessage}");
            print("Invalid email or password");*/
            pr.hide();
          } else if (responsecode == 422) {
            print("Invalid OTP");
            pr.hide();
          } else if (responsecode == 500) {
            toastMessage("Internal Server Error");
            pr.hide();
          }

          break;
        default:
      }
    });
  }
}
