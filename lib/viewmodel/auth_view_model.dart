import "package:flutter/material.dart";
import 'package:http/http.dart' as _http;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_tatto/ResponseModel/AboutData.dart';
import 'package:the_tatto/ResponseModel/ArtistSearchList.dart';
import 'package:the_tatto/ResponseModel/StyleList.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/model/LocationSearchList.dart';
import 'package:the_tatto/model/ShopSearchList.dart';
import 'package:the_tatto/utils/app_api_ref.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'package:the_tatto/utils/app_constant.dart';
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
  // String kLoginPreferenceId = "LoginPreferenceId";
  // String kProfilePreferenceId = "profileID";
  File profileImageFile;



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
  //bool isUpcomingAppointment = false;
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
  double totalPrice=0;


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
      print("-----------------statusCode:${response.statusCode}------------------");
      print("-----------------$body------------------");
      if (response.statusCode == 200) {
       // print("-----------------klsfdgjld------------------");
        isSignIn = true;
        setState(ViewState.kIdle);
          prefs.setInt(kLoginUserId, body['response']['id']);
         prefs.setString(kLoginRefreshToken, body['response']['tokens']['refresh']);
         prefs.setString(kLoginAccessToken, body['response']['tokens']['access']);
        getProfile(body['response']['id']);
       print("--------------------kLoginUserId:  ${prefs.getInt(kLoginUserId)}------");
       print("--------------------kLoginRefreshToken: ${prefs.getString(kLoginRefreshToken)}-----------");
       print("--------------------kLoginAccessToken:  ${prefs.getString(kLoginAccessToken)}-----------");
        authError = false;
        authMsg = "Login Successfully";
        // //   authMsg = body['message'];
      } else {
        authError = true;
        authMsg ="${body['error']}";
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
        setState(ViewState.kIdle);
        isSignUp = true;
        authError = false;
        authMsg = body['message'];
        /*  prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);*/
      } else {
        authError = true;
        authMsg = "${body['error']}";
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
    isForget = false;
    setState(ViewState.kBusy);
    try {
      // if (validateAndSave(formstate: signUpForm.currentState)) {
      print("------------------Email: $forgetEmail--------------");
      final response = await http.post(kForgetPasswordApi, body: {
        "email": forgetEmail,
      });
      var body = json.decode(response.body);
      print("-----------------$body------------------");
      if (response.statusCode ==200) {
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
        print("-------------------Sign up not success ${authMsg = body['message']}----------------");
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
   // String token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYyMjEwMTc4MCwianRpIjoiYTk5OWNhMmQ1OTc5NDQzNTg4NTc4OTliZGIxY2RhMWEiLCJ1c2VyX2lkIjozfQ.NpdbGrcTfmVCJvNc7x_9-KJcLDbRBxRpVSzFv8pdh5Y";
   print("----------------------${PreferenceUtils.getString(kLoginRefreshToken)}--------------");
  //  print("-----------------token $token------------------");

    setState(ViewState.kBusy);
    try {
      final response = await http
          .post(kLogoutApi, body: {
        "refresh": "${PreferenceUtils.getString(kLoginRefreshToken)}"
        //"refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYyMjEwMzA1MCwianRpIjoiZmMyNDMxYjI3NTI1NDc4MDhmZTdlODlkZDNmZWJhZWYiLCJ1c2VyX2lkIjozfQ.i5F9uZIRbqD3Fcf6KpnlQySXefAmlj_anGRrOKC41Rg"
      });
      var body = json.decode(response.body);
      print("-----------------status ${response.statusCode}------------------");
     print("-----------------logout $body------------------");
       if (response.statusCode ==200) {
        setState(ViewState.kIdle);
        isLogout = true;
        authError = false;
        authMsg = "Logout Successfully";
      } else {
        authError = true;
        authMsg = "Logout error";
        print(
            "-------------------Sign  in not success ${authMsg = body['message']}----------------");
      }
      authError = false;
    } catch (e) {
      print("-------------------Sign  in not success ${e.message.toString()}----------------");
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
      } else {
        authError = true;
        // authMsg = body['message'];
        print("-------------------Sign  in not success ${authMsg = body['message']}----------------");
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
     final response = await http.get("https://tattooarts.herokuapp.com/Shop_artist/$aboutDataID");
     // final response = await http.get("https://tattooarts.herokuapp.com/Shop_artist/1");
      var body = json.decode(response.body);
        print("-----------------$body------------------");
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
  Future<void> priceAdd(double price) async {
    totalPrice +=price;
    notifyListeners();
  }
  Future<void> priceSub(double price) async {
    totalPrice -=price;
    notifyListeners();
  }
  Future<void> getProfile(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    print("-----------------$traditionalStyleSearchValue------------------");
  //  isStyleList = false;
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
  Future<void> validateAndSubmitProfile(int id) async {
    setState(ViewState.kBusy);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {

      //  if (validateAndSave(formstate: signInForm.currentState)) {

      print(
          "------------------id $id validateAndSubmitProfile: $profileNewName  ,profileImageFile :$profileImageFile--------------");
      final file = await http.MultipartFile.fromPath('image',profileImageFile.path );
      final imageUploadRequest =
      http.MultipartRequest('PUT', Uri.parse("https://tattooarts.herokuapp.com/auth/update_user/$id/"));
      imageUploadRequest.fields['username'] = "$profileNewName";

      imageUploadRequest.files.add(file);
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
    //  final response = await http.put(, body: {"username": profileNewName, "image":profileImageFile});
      print("-----------------${response.statusCode}------------------");

     var body = json.decode(response.body);
   //  print("-----------------$body------------------");
      if (response.statusCode == 200) {
        isProfileIn= true;
        // setState(ViewState.kIdle);
        // prefs.setString(kLoginPreferenceId, json.encode(body));
        // loginResponseSharePreference = prefs.getString(kLoginPreferenceId);
        // authError = false;
        // authMsg = "Login Successfully";
        print("-----------------dfaskljfalldks------------------");
        prefs.setString(kProfilePreferenceId, json.encode(body));
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

  // Future<void> getUpcomingAppointment() async {
  //   print("-----------------${PreferenceUtils.getString(kLoginAccessToken)}------------------");
  //   isUpcomingAppointment = false;
  //   setState(ViewState.kBusy);
  //   try {
  //     final response = await http.get(kGetAppointmentApi,headers:{
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${PreferenceUtils.getString(kLoginAccessToken)}',
  //     });
  //     //final response = await http.get("https://tattooarts.herokuapp.com/auth/get_user/5");
  //     var body = json.decode(response.body);
  //     print("-----------------$body------------------");
  //     if (response.statusCode ==200) {
  //       isUpcomingAppointment = true;
  //
  //     } else {
  //       authError = true;
  //       // authMsg = body['message'];
  //       print(
  //           "-------------------Sign  in not success ${authMsg = body['message']}----------------");
  //     }
  //
  //     print("not success");
  //     authError = false;
  //   } catch (e) {
  //     //print("-------------------Sign  in not success ${e.message.toString()}----------------");
  //     authMsg = "Error ";
  //     // authMsg = "Error ${e.message.toString()}";
  //     authError = true;
  //   }
  //   setState(ViewState.kIdle);
  // }

}
