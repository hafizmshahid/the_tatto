import "package:flutter/material.dart";
import 'package:http/http.dart' as _http;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/ResponseModel/StyleList.dart';
import 'package:the_tatto/utils/app_api_ref.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'dart:convert' as JSON;
import 'dart:io';
import 'dart:convert';

import 'package:the_tatto/viewmodel/BaseViewmodel.dart';
import 'package:the_tatto/viewmodel/app_satate.dart';

class AuthApi {
  bool isSignupApi;

  AuthApi({@required this.isSignupApi});

  postData(data) async {
    return await _http.post(
      isSignupApi ? kSignUpApi : kSignInApi,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  getData() async {
    return await _http.get(
      isSignupApi ? kSignUpApi : kSignInApi,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}

class AuthViewModel extends BaseViewModel {
  String kLoginPreferenceId = "LoginPreferenceId";

  String signUpUserName,
      signUpEmail,
      signUpPassword,
      signUpPhone,
      signUpName,
      signInEmail,
      loginResponseSharePreference,
      forgetEmail,
      signInPassword;
  var authMsg;
  bool authError = true;
  bool isSignIn = false;
  bool isLogout = false;
  bool isStyleList = false;
  bool isSignUp = false;
  bool isForget = false;
  List titleList = [
    "Realism or Realistic Tattoo Style",
    "Watercolor Tattoo Style",
    "Tribal Tattoo Style",
    "New School Tattoo Style",
    "Neo Traditional Tattoo Style",
    "Japanese Tattoo Style",
    "Blackwork Tattoo Style"
  ];
  StyleList styleList;

  GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  GlobalKey<FormState> forgetForm = GlobalKey<FormState>();

  bool validateAndSave({
    @required FormState formstate,
  }) {
    final form = formstate;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> getStyleList() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      final response = await http.get(kStylesApi);
      var body = json.decode(response.body);
      print("-----------------$body------------------");
      if (body['status']) {
        print("-----------------$body------------------");
        styleList = body;
        setState(ViewState.kIdle);
        isStyleList = true;
        authError = false;
        authMsg = body['message'];
        /*  prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);*/
      } else {
        authError = true;
        authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }

  Future<void> validateAndSubmitSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: signInForm.currentState)) {
        print(
            "------------------Email: $signInEmail  Password : $signInPassword --------------");
        final response = await http.post(kSignInApi,
            body: {"email": signInEmail, "password": signInPassword});
        var body = json.decode(response.body);
        print("-----------------$body------------------");
        if (!body['error']) {
          //  print("-----------------$body------------------");
          setState(ViewState.kIdle);
          prefs.setString(kLoginPreferenceId, json.encode(body));
          loginResponseSharePreference = prefs.getString(kLoginPreferenceId);
          print(
              "---------------------name :${json.decode(loginResponseSharePreference)['response'][0]['username']}-----------------");
          isSignIn = true;
          authError = false;
          authMsg = body['message'];
          /*  prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);*/
        } else {
          authError = true;
          authMsg = body['message'];
          print(
              "-------------------Sign  in not success ${authMsg = body['message']}----------------");
        }
      } else {
        authMsg = "Please fill all field";
      }
      print("not success");
      authError = false;
    } catch (e) {
      print(
          "-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }

  Future<void> getUserLogout() async {
    String strTokenRefresh =
        json.decode(loginResponseSharePreference)['response'][0]['tokens']
            ['refresh'];
    setState(ViewState.kBusy);
    try {
      print("------------------refresh:$strTokenRefresh--------------");
      final response = await http.post(kLogoutApi, body: {"refresh": strTokenRefresh});
      var body = json.decode(response.body);
      print("-----------------dsafd ad $body------------------");
      if (!body['error']) {
        setState(ViewState.kIdle);
        isLogout = true;
        authError = false;
        authMsg = body['message'];
      } else {
        authError = true;
        authMsg = body['detail'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      print(
          "-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }

  Future<void> validateAndSubmitSignUp() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: signUpForm.currentState)) {
        print(
            "------------------Name :$signUpName Email: $signUpEmail Phone No :$signUpPhone Password : $signUpPassword Phone--------------");
        final response = await http.post(kSignUpApi, body: {
          "username": signUpName,
          "email": signUpEmail,
          "phone_number": signUpPhone,
          "password": signUpPassword
        });
        var body = json.decode(response.body);
        print("-----------------asdfdas$body------------------");
        if (!body['error']) {
          print("-----------------$body------------------");
          setState(ViewState.kIdle);
          isSignUp = true;
          authError = false;
          authMsg = body['message'];
          /*  prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);*/
        } else {
          authError = true;
          authMsg = body['message'];
          print(
              "-------------------Sign up not success ${authMsg = body['message']}----------------");
        }
      } else {
        authMsg = "Please fill all field";
      }
      print("not success");
      authError = false;
    } catch (e) {
      print(
          "-------------------Sign up not success ${e.message.toString()}----------------");
      authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }

  Future<void> validateAndSubmitForget() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: signUpForm.currentState)) {
        print("------------------Email: $forgetEmail--------------");
        final response = await http.post(kSignUpApi, body: {
          "email": forgetEmail,
        });
        var body = json.decode(response.body);
        print("-----------------$body------------------");
        if (body['status']) {
          print("-----------------$body------------------");
          setState(ViewState.kIdle);
          isForget = true;
          authError = false;
          authMsg = body['message'];
          /*  prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);*/
        } else {
          authError = true;
          authMsg = body['message'];
          print(
              "-------------------Sign up not success ${authMsg = body['message']}----------------");
        }
      } else {
        authMsg = "Please fill all field";
      }
      print("not success");
      authError = false;
    } catch (e) {
      print(
          "-------------------Sign up not success ${e.message.toString()}----------------");
      authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
}
