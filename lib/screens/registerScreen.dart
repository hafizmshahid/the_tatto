import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/common/ZButtonRaised.dart';
import 'package:the_tatto/screens/base_scaffold.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:the_tatto/apiservice/Apiservice.dart';
import 'package:the_tatto/apiservice/Retro_Api.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'loginscreen.dart';
import 'otpscreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => new _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {

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

  final _formKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();

  String _username, _email, _password, _phoneno = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);



    return new SafeArea(
      child: Scaffold(

          body: Scaffold(
            //  resizeToAvoidBottomPadding: true,
            key: _scaffoldKey,

            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: kPrimaryTextColor,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                "Create New Account",
                style: TextStyle(
                    color: kPrimaryTextColor,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),

            body: Form(
              key: _formKey,
              child: new Stack(
                children: <Widget>[
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
                   SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        child: Container(
                          margin: const EdgeInsets.only(top: 50.0, left: 35.0),
                          alignment: FractionalOffset.topLeft,
                          child: Text(
                            "Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                      Container(
                        alignment: FractionalOffset.topLeft,
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 20.0, right: 20.0),
                        child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (name) {
                            Pattern pattern =
                                r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(name))
                              return 'Invalid username';
                            else
                              return null;
                          },
                          onSaved: (name) => _notifier.signUpName = name,
                          onFieldSubmitted: (_) {
                            fieldFocusChange(
                                context, _usernameFocusNode, _emailFocusNode);
                          },
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent.withOpacity(0.50),
                            hintText: 'Enter your full name',
                            hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0, left: 35.0),
                        alignment: FractionalOffset.topLeft,
                        child: Text(
                          "Email id",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      Container(
                        alignment: FractionalOffset.topLeft,
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 20.0, right: 20.0),
                        child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocusNode,
                          validator: (email) => EmailValidator.validate(email)
                              ? null
                              : "Invalid email address",
                          onSaved: (email) => _notifier.signUpEmail = email,
                          onFieldSubmitted: (_) {
                            fieldFocusChange(
                                context, _emailFocusNode, _phoneFocusNode);
                          },
                          style: TextStyle(
                              fontSize: 16.0,
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent.withOpacity(0.50),
                            hintText: 'Enter your email id',
                            hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // decoration: InputDecoration(
                          //   filled: true,
                          //   fillColor: const Color(0xFFf1f1f1),
                          //   hintText: 'Enter your email id',
                          //   contentPadding: const EdgeInsets.only(
                          //       left: 14.0, bottom: 8.0, top: 8.0),
                          //   focusedBorder: OutlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: const Color(0xFFf1f1f1)),
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          //   enabledBorder: UnderlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: const Color(0xFFf1f1f1)),
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          // ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0, left: 35.0),
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                          "Phone Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      Container(
                          alignment: FractionalOffset.centerLeft,
                          margin: const EdgeInsets.only(
                              top: 5.0, left: 20.0, right: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextFormField(
                              focusNode: _phoneFocusNode,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              validator: (phone) {
                                Pattern pattern = r'^[0-9]*$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(phone) || phone.length < 10 )
                                  return 'Invalid Phone number';
                                else
                                  return null;
                              },
                              onSaved: (phone) => _notifier.signUpPhone = phone,
                              onFieldSubmitted: (_) {
                                fieldFocusChange(context, _phoneFocusNode,
                                    _passwordFocusNode);
                              },
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent.withOpacity(0.50),
                                hintText: 'Phone Number ',
                                hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              // decoration: InputDecoration(
                              // //  prefixIcon: countryDropDown,
                              //   filled: true,
                              //   fillColor: const Color(0xFFf1f1f1),
                              //   hintText: 'Phone Number ',
                              //   contentPadding: const EdgeInsets.only(
                              //       left: 14.0, bottom: 8.0, top: 8.0),
                              //   focusedBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(
                              //         color: const Color(0xFFf1f1f1)),
                              //     borderRadius: BorderRadius.circular(5),
                              //   ),
                              //   enabledBorder: UnderlineInputBorder(
                              //     borderSide: BorderSide(
                              //         color: const Color(0xFFf1f1f1)),
                              //     borderRadius: BorderRadius.circular(5),
                              //   ),
                              // ),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0, left: 35.0),
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                          "Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      Container(
                        alignment: FractionalOffset.centerLeft,
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 20.0, right: 20.0),
                        child: TextFormField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          focusNode: _passwordFocusNode,
                          validator: (password) {
                            if (password.length < 6)
                              return 'Password must be 6 character' ;
                            else
                              return null;
                          },
                          onSaved: (password) => _notifier.signUpPassword = password,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent.withOpacity(0.50),
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color:  Colors.transparent.withOpacity(0.50)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // decoration: InputDecoration(
                          //   filled: true,
                          //   fillColor: const Color(0xFFf1f1f1),
                          //   hintText: 'Enter your Password',
                          //   contentPadding: const EdgeInsets.only(
                          //       left: 14.0, bottom: 8.0, top: 8.0),
                          //   focusedBorder: OutlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: const Color(0xFFf1f1f1)),
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          //   enabledBorder: UnderlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: const Color(0xFFf1f1f1)),
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          // ),
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
                            color: kGreenColor,
                            onPressed: () async {

                             // _onTapImage(context,_notifier.authMsg);

                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                showProcessBar(context);
                                await _notifier.validateAndSubmitSignUp();
                                if (_notifier.isSignUp) {
                                  _onTapImage(context,_notifier.authMsg);
                                  _notifier.isSignUp = false;
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




                            }
                              },


                        child: Text(
                              "Create New Account",
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
                                margin: const EdgeInsets.only(top: 20.0),
                                alignment: FractionalOffset.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
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
                                        'Already have an account !',
                                        style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      new Text(
                                        ' Login.',
                                        style: TextStyle(
                                            color: kGreenColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Montserrat'),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      new Container(
                        child: SizedBox(
                          height: 100,
                        ),
                      ),
                      new Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "By clicking Create new account you agree to the following Terms & Condition.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
  _onTapImage(BuildContext context,String msg) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Register Alert'),
          content:Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$msg",style: TextStyle(fontSize: 18),overflow:TextOverflow.ellipsis ,maxLines: 5,),
                ZButtonRaised(
                  text: 'Done',
                 color:kGreenColor ,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  onTap: ()  {
                  //  Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()),
                    );

                  },),
              ],
            ),
          ),
        ));
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
        //   timeInSecForIos: 1,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      PreferenceUtils.init();
    });
  }

}
