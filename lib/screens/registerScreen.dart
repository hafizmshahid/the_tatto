import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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
  ProgressDialog pr;
  String _selectedCountryCode = ' +91';
  List<String> _countryCodes = [' +91', ' +23', ' +8'];
  final _formKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  String _username, _email, _password, _phoneno = "";

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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

    var countryDropDown = Container(
      decoration: new BoxDecoration(
        color: const Color(0xFFf1f1f1),
        border: Border(
          right: BorderSide(width: 0.5, color: const Color(0xFFf1f1f1)),
        ),
      ),
      // height: 45.0,

      // margin: const EdgeInsets.all(3.0),
      //width: 300.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: false,
          child: DropdownButton(
            // iconSize: 0.0,
            value: _selectedCountryCode,
            items: _countryCodes.map((String value) {
              return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    style: TextStyle(fontSize: 12.0),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountryCode = value;
              });
            },
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );

    final _notifier = Provider.of<AuthViewModel>(context);
    GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
    AppSizes().init(context);
    return BaseScaffold(
      internetFunction: true,
      isBackArrow: true,

      isAppBarShow: false,
      body:Container(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              //  key: _scaffoldKey,
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
              body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('images/bg_image.jpg'),
                    fit: BoxFit.fill,
                    alignment:Alignment.topCenter,
                  ),
                ),
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: new Container(
                    decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    child: Form(
                      key: signUpForm,
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          Container(
                            child: Container(
                              margin:
                              const EdgeInsets.only(top: 50.0, left: 35.0),
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
                              onSaved: (value) => _notifier.signUpName = value,
                              onFieldSubmitted: (_) {
                                fieldFocusChange(context, _usernameFocusNode,
                                    _emailFocusNode);
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
                                hintStyle: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
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
                              validator: (email) =>
                              EmailValidator.validate(email)
                                  ? null
                                  : "Invalid email address",
                              onSaved: (value) => _notifier.signUpEmail = value,
                              onFieldSubmitted: (_) {
                                fieldFocusChange(
                                    context, _emailFocusNode, _phoneFocusNode);
                              },
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent.withOpacity(0.50),
                                hintText: 'Enter your email id',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                hintStyle: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
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
                            alignment: FractionalOffset.topLeft,
                            margin: const EdgeInsets.only(
                                top: 5.0, left: 20.0, right: 20.0),
                            child: TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              onSaved: (value) => _notifier.signUpPhone = value,
                             focusNode: _phoneFocusNode,
                              validator: (phone) {
                                Pattern pattern = r'^[0-9]*$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(phone))
                                  return 'Invalid Phone number';
                                else
                                  return null;
                              },
                             /* onFieldSubmitted: (_) {
                                fieldFocusChange(
                                    context, _emailFocusNode, _phoneFocusNode);
                              },*/
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent.withOpacity(0.50),
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
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
                                Pattern pattern =
                                    r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(password))
                                  return 'Invalid password';
                                else
                                  return null;
                              },
                              onSaved: (value) =>
                              _notifier.signUpPassword = value,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent.withOpacity(0.50),
                                hintText: 'Enter your Password',
                                hintStyle: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.50)),
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
                                    borderRadius:
                                    new BorderRadius.circular(5.0)),
                                minWidth: 300,
                                height: 40,
                                color: kGreenColor,
                                onPressed: () async {
                                  if(signUpForm.currentState.validate()){
                                    signUpForm.currentState.save();
                                  showProcessBar(context);
                                  await _notifier.validateAndSubmitSignUp();
                                  if (_notifier.isSignUp) {
                                    Navigator.pop(context);
                                    // Navigator.pushNamed(context, DogsBuyMeetSlider.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(0)),

                                      // var savedValue = preferences.getString('value_key');
                                    );
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
                                  /*if(_formKey.currentState.validate()){
                                    _formKey.currentState.save();

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen(2)),
                                    );*/

                                  /*   var connectivityResult = await (Connectivity().checkConnectivity());
                                    if (connectivityResult == ConnectivityResult.mobile) {
                                      pr.show();
                                      CallRegisterapi(_username,_email,_phoneno,_password,0,_selectedCountryCode);

                                    } else if (connectivityResult == ConnectivityResult.wifi) {
                                      pr.show();
                                      CallRegisterapi(_username,_email,_phoneno,_password,0,_selectedCountryCode);

                                    }else{
                                      toastMessage("No Internet Connection");
                                    }*/

                                  // toastMessage("Email: $_email\nPassword: $_password");
                                }},
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
                                              builder: (context) =>
                                                  LoginScreen()),
                                        );
                                      },
                                      child: new Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
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
                    ),
                  ),
                ),

              ),
            ),
          ),
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('images/bg_image.jpg'),
            fit: BoxFit.fill,
            alignment:Alignment.topCenter,
          ),
        ),
      ) ,
    );
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void toastMessage(String message) {
    /*  Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
     //   timeInSecForIos: 1,
        fontSize: 16.0
    );*/
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      PreferenceUtils.init();
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.

    super.dispose();
  }

  void CallRegisterapi(String username, String email, String phoneno,
      String password, int verify, String selectedCountryCode) {
    print("name:$username" +
        "email:$email" +
        "phoneno:$phoneno" +
        "password:$password" +
        "verify:$verify" +
        "selectedcode:$selectedCountryCode");

    RestClient(Retro_Api().Dio_Data())
        .register(
            username, email, phoneno, password, verify, selectedCountryCode)
        .then((response) {
      setState(() {
        print(response.success);
        if (response.success = true) {
          print("sucess");
          toastMessage(response.message);

          PreferenceUtils.setString(
              AppConstant.userid, response.data.id.toString());
          PreferenceUtils.setString(AppConstant.username, response.data.name);
          PreferenceUtils.setString(AppConstant.useremail, response.data.email);
          PreferenceUtils.setString(
              AppConstant.userotp, response.data.otp.toString());
          PreferenceUtils.setString(AppConstant.userphone, response.data.phone);
          PreferenceUtils.setString(
              AppConstant.userphonecode, response.data.code);
          PreferenceUtils.setString(
              AppConstant.imagePath, response.data.imagePath);
          pr.hide();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen()),
          );
        }
      });
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;

          var responsecode = res.statusCode;
          var msg = res.statusMessage;

          if (responsecode == 401) {
            pr.hide();
            toastMessage("Invalid Data");
            print(responsecode);
            print(res.statusMessage);
          } else if (responsecode == 422) {
            pr.hide();
            toastMessage("The email has already been taken.");
            print("code:$responsecode");
            print("msg:$msg");

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpScreen()),
            );
          }

          break;
        default:
      }
    });
  }

  void showProcessBar(BuildContext context) {
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
