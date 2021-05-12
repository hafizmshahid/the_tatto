import 'dart:async';
import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';


import 'otpscreen.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new ForgotPassword(),
  ));
}*/

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => new _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {




  final _formKey = GlobalKey<FormState>();


  FocusNode _emailFocusNode = FocusNode();
  String _username,_email,_password= "";



  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    return  SafeArea(
      child:
      Container(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child:Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,

                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: kPrimaryTextColor,size: 30,),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text("Forgot Password",
                    style: TextStyle(color:kPrimaryTextColor, fontFamily: 'Montserrat',fontSize: 16,fontWeight: FontWeight.w600),),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),


                body:Form(
                    key: _notifier.forgetForm,
                    child: Container(
                        child: Column(children: <Widget>[
                          Expanded(
                            child: ListView(
                              children: [

                                Container(
                                  margin: const EdgeInsets.only(top: 50.0, left: 0.0),
                                  alignment: FractionalOffset.center,
                                  child: SvgPicture.asset(
                                    "images/unlock.svg",
                                    color: kPrimaryTextColor,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 70.0, left: 0.0),
                                    alignment: FractionalOffset.center,
                                    child: Text(
                                      'Forgot Password !',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat'),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(top: 2.0, left: 0.0),
                                    alignment: FractionalOffset.center,
                                    child: Text(
                                      'Don\'t worry, we will find your account',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Montserrat'),
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(top: 50.0, left: 50.0),
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    "Email Id",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kPrimaryTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                                Container(
                                  alignment: FractionalOffset.topLeft,
                                  margin:
                                  const EdgeInsets.only(top: 5.0, left: 45.0, right: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    autofocus: false,



                                    focusNode: _emailFocusNode,
                                    validator: (email)=>EmailValidator.validate(email)? null:"Invalid email address",
                                    onSaved:  (value) => _notifier.forgetEmail = value,
                                    onFieldSubmitted: (_){
                                    },



                                    style: TextStyle(fontSize: 14.0, color: Colors.black,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:  Colors.transparent.withOpacity(0.50),
                                      hintText: 'Enter your email id',
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
                                    margin: const EdgeInsets.only(top: 20.0),
                                    alignment: FractionalOffset.center,
                                    // width: 500,
                                    // height: 50,
                                    // color: Colors.pink,

                                    child: MaterialButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(5.0)),
                                      minWidth: 300,
                                      height: 40,
                                      color: kGreenColor ,
                                      onPressed: () async {

                                        showProcessBar(context);
                                        await _notifier.validateAndSubmitForget();
                                        if (_notifier.isForget) {
                                          Navigator.pop(context);
                                          // Navigator.pushNamed(context, DogsBuyMeetSlider.id);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => OtpScreen()),
                                          );
                                          _notifier.isForget = false;
                                          // Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                                        } else {
                                          Navigator.pop(context);
                                          print("----------------not ok------------------");
                                          Fluttertoast.showToast(
                                            msg: "${_notifier.authMsg}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                          );
                                        }
                                        /*   if(_formKey.currentState.validate()){
                                      _formKey.currentState.save();
                                      toastMessage("Email: $_email\nPassword: $_password");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => OtpScreen()),
                                      );


                                    }*/


                                      },
                                      child: Text(
                                        "Send me OTP",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 2, top: 10),
                            alignment: FractionalOffset.bottomCenter,
                            child: Text(
                              "Please check your email.",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),


                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            alignment: FractionalOffset.bottomCenter,
                            child: Text(
                              "we will send you one OTP on your mail.",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Montserrat'),
                            ),
                          )

                        ]
                        )
                    )
                )

            ) ,

          ),
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('images/bg_image.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),


    );

  }

  void toastMessage(String message){
  /*  Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        //timeInSecForIos: 1,
        fontSize: 16.0
    );*/
  }

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



}
