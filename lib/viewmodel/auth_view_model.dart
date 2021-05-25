import "package:flutter/material.dart";
import 'package:http/http.dart' as _http;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/ResponseModel/AboutData.dart';
import 'package:the_tatto/ResponseModel/ArtistSearchList.dart';
import 'package:the_tatto/ResponseModel/StyleList.dart';
import 'package:the_tatto/model/LocationSearchList.dart';
import 'package:the_tatto/model/ShopSearchList.dart';
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
  String kProfilePreferenceId = "profileID";

  String signUpUserName,
      signUpEmail,
      signUpPassword,
      signUpPhone,
      signUpName,
      signInEmail,
      artistSearchValue,
      profileNewName,
      traditionalStyleSearchValue,
      locationSearchListValue,
      shopSearchValue,
      loginResponseSharePreference,
      profileResponseSharePreference,
      appointDateSelect,
      forgetEmail,
      signInPassword;
  List aboutStyleTitle= [
    "first_services",
    "second_services",
    "third_services",
    "four_services",
    "five_services"
  ];
  var aboutSelectServices;


  //int aboutDataID ;
  bool valueCheckBox = true;
  var authMsg;
  bool authError = true;
  bool isSignIn = false;
  bool isProfileIn = false;
  bool isLogout = false;
  bool isStyleList = false;
  bool isArtistList = false;
  bool isLocationSearchList = false;
  bool isAboutDataList = false;
  bool isShopSearchList = false;
  bool isSignUp = false;
  bool isForget = false;
  double lat;
  double lng;
  List titleList = [
    "Realism or Realistic Tattoo Style",
    "Watercolor Tattoo Style",
    "Tribal Tattoo Style",
    "New School Tattoo Style",
    "Neo Traditional Tattoo Style",
    "Japanese Tattoo Style",
    "Blackwork Tattoo Style"
  ];
  List aboutImageList = [
    "First_Image",
    "Second_Image",
    "Third_Image",
    "Fourth_Image",
    "Fifth_Image",
    "Fifth_Image",
  ];
  List<StyleList> styleList;
  List<ArtistSearchList> artistSearchList;
  List<ShopSearchList> shopSearchList;
  List<LocationSearchList> locationSearchList;
  List<AboutData> aboutDataList;
  int totalPrice=0;


  // GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  // GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  // GlobalKey<FormState> forgetForm = GlobalKey<FormState>();

  bool validateAndSave({@required FormState formstate,}) {
    final form = formstate;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmitSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    isSignIn = false;
    try {
      //  if (validateAndSave(formstate: signInForm.currentState)) {
      print(
          "------------------Email: $signInEmail  Password: $signInPassword --------------");
      final response = await http.post(kSignInApi, body: {"email": signInEmail, "password": signInPassword});
      var body = json.decode(response.body);
      print("-----------------lkads${response.statusCode}------------------");
      print("-----------------$body------------------");
      if (response.statusCode == 200) {
        isSignIn = true;
        setState(ViewState.kIdle);
        prefs.setString(kLoginPreferenceId, json.encode(body));
        loginResponseSharePreference = prefs.getString(kLoginPreferenceId);
        authError = false;
        authMsg = "Login Successfully";
        // //   authMsg = body['message'];
      } else {
        authError = true;
      //  authMsg = body['detail'];
       // print("-------------------Sign  in not success ${authMsg = body['detail']}----------------");
      }
      // }
      print("not success");
      authError = false;
    } catch (e) {
      // print("-------------------Sign  in not success ${e.message.toString()}----------------");
      //  authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateAndSubmitSignUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      // if (validateAndSave(formstate: signUpForm.currentState)) {
      print(
          "------------------Name :$signUpName Email: $signUpEmail Phone No :$signUpPhone Password : $signUpPassword Phone--------------");
      final response = await http.post(kSignUpApi, body: {
        "username": signUpName,
        "email": signUpEmail,
        "phone_number": signUpPhone,
        "password": signUpPassword
      });
      var body = json.decode(response.body);
      print("-----------------$body------------------");
      if (!body['error']) {
        print("-----------------$body------------------");
        prefs.setString(kLoginPreferenceId, json.encode(body));
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
      /* } else {
        authMsg = "Please fill all field";
      }*/
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
      // if (validateAndSave(formstate: signUpForm.currentState)) {
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
      /*   } else {
        authMsg = "Please fill all field";
      }*/
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
  Future<void> getUserLogout() async {
    String strTokenRefresh =
        json.decode(loginResponseSharePreference)['tokens']["refresh"];
    setState(ViewState.kBusy);
    try {
      print("------------------refresh:$strTokenRefresh--------------");
      final response = await http
          .post("https://tattooarts.herokuapp.com/auth/logout/", body: {
        "refresh":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYyMTU3Mzc1NywianRpIjoiNDFjZWE1M2U2NzMxNDdmNjg5ZTQyM2U5ZGY4Y2MyODYiLCJ1c2VyX2lkIjoyfQ.epIN3p76YgB_nJTbhQeY4kemkFz0xSt6lp81EKVMGIE"
      });
      var body = json.decode(response.body);
      print("-----------------logout $body------------------");
      /* if (!body['error']) {
        setState(ViewState.kIdle);
        isLogout = true;
        authError = false;
        authMsg = body['message'];
      } else {
        authError = true;
        authMsg = body['detail'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }*/

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
  Future<void> getStyleList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    print("-----------------$traditionalStyleSearchValue------------------");
    isStyleList = false;
    setState(ViewState.kBusy);
    try {
      final response = await http.get("https://tattooarts.herokuapp.com/traditionalsearch?search=$traditionalStyleSearchValue");
      var body = json.decode(response.body);
      //  print("-----------------$body------------------");
      if (body != null) {
        print("-----------------Response : ${response.body}------------------");
        styleList = styleListFromJson(response.body);
        print(
            "-----------------styleList : ${styleList.length}------------------");
        setState(ViewState.kIdle);
        isStyleList = true;
        authError = false;
        // authMsg = body['message'];
        //   prefs.setString(kLoginId, json.encode(body));
        //   prefs.setBool(kIsLogin, true);
        prefs.setString(kLoginPreferenceId, json.encode(body));
        loginResponseSharePreference = prefs.getString(kLoginPreferenceId);
      } else {
        authError = true;
        // authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ";
      // authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> getArtistList(double lat,double lng) async {
    isArtistList = false;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();\artistSearchValue
    print(
        "-----------------artistSearchValue $artistSearchValue------------------");
    setState(ViewState.kBusy);
    try {
      final response = await http.get("https://tattooarts.herokuapp.com/artistsearch/?search=$artistSearchValue&latitude=$lat&longitude=$lng");
     // final response = await http.get("https://tattooarts.herokuapp.com/artistsearch/?search=8");
      var body = json.decode(response.body);
      //  print("-----------------$body------------------");
      if (body != null) {
        print("-----------------Response : ${response.body}------------------");
        artistSearchList = artistSearchListFromJson(response.body);
        print(
            "-----------------styleList : ${artistSearchList.length}------------------");
        setState(ViewState.kIdle);
        isArtistList = true;
        authError = false;
        // authMsg = body['message'];
        //   prefs.setString(kLoginId, json.encode(body));
        //   prefs.setBool(kIsLogin, true);
        /* prefs.setString(kLoginPreferenceId, json.encode(body));
        loginResponseSharePreference = prefs.getString(kLoginPreferenceId);*/
      } else {
        authError = true;
        // authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ";
      // authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> getShopNameList(double lat,double lng) async {
    isShopSearchList = false;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();\artistSearchValue
    print(
        "-----------------artistSearchValue $shopSearchValue------------------");
    setState(ViewState.kBusy);
    try {
      final response = await http.get(
          "https://tattooarts.herokuapp.com/shopsearch/?search=$shopSearchValue&latitude=$lat&longitude=$lng");
      var body = json.decode(response.body);
      print("-----------------$body------------------");
      if (body != null) {
        print("-----------------Response : ${response.body}------------------");
        shopSearchList = shopSearchListFromJson(response.body);
        print(
            "-----------------styleList : ${shopSearchList.length}------------------");
        setState(ViewState.kIdle);
        isShopSearchList = true;
        authError = false;
        // authMsg = body['message'];
        //   prefs.setString(kLoginId, json.encode(body));
        //   prefs.setBool(kIsLogin, true);
        /* prefs.setString(kLoginPreferenceId, json.encode(body));
        loginResponseSharePreference = prefs.getString(kLoginPreferenceId);*/
      } else {
        authError = true;
        // authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ";
      // authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> getLocationSearchList() async {
    isLocationSearchList = false;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();\artistSearchValue
    print(
        "-----------------locationSearchListValue $locationSearchListValue------------------");
    setState(ViewState.kBusy);
    try {
      final response = await http.get(
          "https://tattooarts.herokuapp.com/locationsearch/?search=$locationSearchListValue&latitude=$lat&longitude=$lng");
      var body = json.decode(response.body);
      //  print("-----------------$body------------------");
      if (body != null) {
        print("-----------------Response : ${response.body}------------------");
        locationSearchList = locationSearchListFromJson(response.body);
        print(
            "-----------------styleList : ${locationSearchList.length}------------------");
        setState(ViewState.kIdle);
        isLocationSearchList = true;
        authError = false;
        // authMsg = body['message'];
        //   prefs.setString(kLoginId, json.encode(body));
        //   prefs.setBool(kIsLogin, true);
        /* prefs.setString(kLoginPreferenceId, json.encode(body));
        loginResponseSharePreference = prefs.getString(kLoginPreferenceId);*/
      } else {
        authError = true;
        // authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ";
      // authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> getAboutDataList(int aboutDataID) async {
    isAboutDataList = false;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();\artistSearchValue
    print("-----------------aboutDataID $aboutDataID------------------");
    setState(ViewState.kBusy);
    try {
    // final response = await http.get("https://tattooarts.herokuapp.com/Shop_artist/$aboutDataID");
      final response = await http.get("https://tattooarts.herokuapp.com/Shop_artist/1");
      var body = json.decode(response.body);
      //  print("-----------------$body------------------");
      if (body != null) {
        print("-----------------Response : ${response.body}------------------");

        aboutDataList = aboutDataFromJson(response.body);
        print(
            "-----------------isAboutDataList : ${aboutDataList.length}------------------");
        setState(ViewState.kIdle);
        isAboutDataList = true;
        authError = false;
        // authMsg = body['message'];
        //   prefs.setString(kLoginId, json.encode(body));
        //   prefs.setBool(kIsLogin, true);
        /* prefs.setString(kLoginPreferenceId, json.encode(body));
        loginResponseSharePreference = prefs.getString(kLoginPreferenceId);*/
      } else {
        authError = true;
        // authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ";
      // authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> priceAdd(int price) async {
    totalPrice +=price;
    notifyListeners();
  }
  Future<void> priceSub(int price) async {
    totalPrice -=price;
    notifyListeners();
  }
  Future<void> getProfile(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    print("-----------------$traditionalStyleSearchValue------------------");
    isStyleList = false;
    setState(ViewState.kBusy);
    try {
      final response = await http.get("https://tattooarts.herokuapp.com/auth/get_user/$id");
      //final response = await http.get("https://tattooarts.herokuapp.com/auth/get_user/5");
      var body = json.decode(response.body);
       print("-----------------$body------------------");
      if (response.statusCode ==200) {


        // authMsg = body['message'];
        //   prefs.setString(kLoginId, json.encode(body));
        //   prefs.setBool(kIsLogin, true);
        prefs.setString(kProfilePreferenceId, json.encode(body));
        profileResponseSharePreference = prefs.getString(kProfilePreferenceId);
        print("-----------------${json.decode(profileResponseSharePreference)['username']}------------------");
        print("-----------------profileResponseSharePreference $profileResponseSharePreference------------------");
      } else {
        authError = true;
        // authMsg = body['message'];
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }

      print("not success");
      authError = false;
    } catch (e) {
      //print("-------------------Sign  in not success ${e.message.toString()}----------------");
      authMsg = "Error ";
      // authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }


  Future<void> validateAndSubmitProfile() async {

    try {
      //  if (validateAndSave(formstate: signInForm.currentState)) {
      print(
          "------------------validateAndSubmitProfile: $profileNewName  --------------");
      final response = await http.put("https://tattooarts.herokuapp.com/auth/update_user/1/", body: {"username": profileNewName, "image":""});
      var body = json.decode(response.body);
      print("-----------------$body------------------");
      if (response.statusCode == 200) {
        isProfileIn= true;
        // setState(ViewState.kIdle);
        // prefs.setString(kLoginPreferenceId, json.encode(body));
        // loginResponseSharePreference = prefs.getString(kLoginPreferenceId);
        // authError = false;
        // authMsg = "Login Successfully";
        print("-----------------dfaskljfalldks------------------");
        // //   authMsg = body['message'];
      } else {
        authError = true;
        //  authMsg = body['detail'];
        // print("-------------------Sign  in not success ${authMsg = body['detail']}----------------");
      }
      // }
      print("not success");
      authError = false;
    } catch (e) {
      // print("-------------------Sign  in not success ${e.message.toString()}----------------");
      //  authMsg = "Error ${e.message.toString()}";
      authError = true;
    }
    setState(ViewState.kIdle);
  }

}
