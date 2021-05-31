import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/ResponseModel/StyleList.dart';
import 'package:the_tatto/ResponseModel/bannerResponse.dart';
import 'package:the_tatto/ResponseModel/categorydataResponse.dart';
import 'package:the_tatto/ResponseModel/salonResponse.dart';
import 'package:the_tatto/apiservice/Apiservice.dart';
import 'package:the_tatto/apiservice/Retro_Api.dart';
import 'package:the_tatto/constant/appconstant.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:the_tatto/drawerscreen/result_show.dart';
import 'package:the_tatto/model/style_search_items.dart';
import 'package:the_tatto/model/topservicedata.dart';
import 'package:the_tatto/democode/demo.dart';
import 'package:the_tatto/screens/base_scaffold.dart';
import 'package:the_tatto/screens/detailbarber.dart';
import 'package:the_tatto/screens/registerScreen.dart';
import 'package:the_tatto/screens/style_search_page.dart';
import 'package:the_tatto/utils/app_api_ref.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_constant.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_tatto/screens/savelocation.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
import 'package:http/http.dart' as http;

class FgHome extends StatefulWidget {
  FgHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FgHome createState() => _FgHome();
}

class _FgHome extends State<FgHome> {
  List<Data1> banner_image = new List<Data1>();
  List<String> image12 = new List<String>();
  List<CategoryData> categorydataList = new List<CategoryData>();
  List<SalonData> salondataList = new List<SalonData>();
  double lat;
  double lng;

  bool serviceEnabled;

  Position position;
  String str = "one.two";

//Removes everything after first '.'

  Future<void> _determinePosition() async {
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      print("-------------Location services are allow------------");
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lng = position.longitude;
    } else if (!serviceEnabled) {
      print("-------------Location services are disabled------------");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print(
          "-------------Location permissions are permantly denied, we cannot request permissions------------");
      showLocationPermissionDialog(context, () async {
        // AppSettings.openAppSettings();
        Navigator.pop(context);
        _determinePosition();
      }, "You cannot user this application until you allow location,Location permissions are permantly denied please allow form Setting");
    }
    if (permission == LocationPermission.denied) {
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print(
            "-------------Location permissions are denied (actual value: $permission).-----------");
        showLocationPermissionDialog(context, () async {
          await Permission.location.request();
          Navigator.pop(context);
          _determinePosition();
        }, "You cannot user this application until you allow location");
      }
    }
  }

  showLocationPermissionDialog(
      BuildContext context, GestureTapCallback onPressed, String msg) {
    // set up the buttons
    Widget continueButton = FlatButton(child: Text("OK"), onPressed: onPressed);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Location Permission Required"),
      content: Text(msg),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  int index = 0;
  ProgressDialog pr;

  /*  Future<void> getStyleList() async {
    final response = await http.get(kStylesApi);
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print("-----------favorite response : ${response.body}--------------------");
      setState(() {
       // _styleList = favorite.favoriteModelFromJson(responseString);
        _styleList = styleListFromJson(responseString) ;
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
    _determinePosition();
    pr = new ProgressDialog(context);
    isExpandedShopList = false;
    isExpandedArtistList = false;
    isExpandedStyleList = false;
    // getStyleList();
    pr.style(
      message: 'Loading Data...',
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
    PreferenceUtils.init();

    // CheckNetwork();
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> traditionalStyleForm = GlobalKey<FormState>();
  GlobalKey<FormState> artistForm = GlobalKey<FormState>();
  GlobalKey<FormState> shopSearchForm = GlobalKey<FormState>();

  bool isExpandedStyleList = false;
  bool isExpandedArtistList = false;
  bool isExpandedShopList = false;
  int selected = 0;

  // String artistSearchValue;
//  String shopSearchValue;
  ScrollController _scrollController = ScrollController();

  // List<StyleList> _styleList;
  String strImageUrl =
      "https://www.menshairstylesnow.com/wp-content/uploads/2019/09/Cool-Arm-Tattoo-Ideas.jpg";

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    // TODO: implement build
    return BaseScaffold(
        appBarHeading: "Home",
        isBackArrow: false,
        internetFunction: false,
        body: Stack(
          children: [
            Container(),
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 170,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/bg_tattoo_stlye.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Form(
                      key: traditionalStyleForm,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,

                            fontFamily: 'Montserrat'),
                     //   readOnly: true,
                        onSaved: (String value) {
                          value == null
                              ? _notifier.traditionalStyleSearchValue = ""
                              : _notifier.traditionalStyleSearchValue =
                              value.toString().trim();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 10),
                          suffixIcon: InkWell(
                            onTap: ()  {

                              if (traditionalStyleForm.currentState
                                  .validate()) {
                                traditionalStyleForm.currentState.save();
                                if (serviceEnabled) {
                                  print(
                                      "--------------latitude:$lat longitude:$lng-----------------");
                                }
                                if (!isExpandedStyleList) {
                                  setState(() {
                                    isExpandedStyleList = true;
                                    _notifier.lat = lat;
                                    _notifier.lng = lng;
                                    _notifier.getStyleList();
                                  });
                                } else if (isExpandedStyleList) {
                                  setState(() {
                                    isExpandedStyleList = false;
                                  });
                                }

                                // Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new SearchResultShowScreen(0,"Artist Name")));
                              }
                            },
                            child: new Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Traditional Tattoo Style',
                          hintStyle: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black.withOpacity(0.5)),
                          border: InputBorder.none,

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isExpandedStyleList
                      ? Container(
                          child: !_notifier.isStyleList
                              ? Container(
                                  height: 50,
                                  child: SpinKitWave(
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : Container(
                                child:  _notifier.styleList.length == 0
                                    ? Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: Text(
                                      "Not Found",
                                      style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: 15),
                                    ),
                                  ),
                                ):ListView.builder(
                                  shrinkWrap: true,
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(),

                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return StyleSearchItems(
                                        headingName:
                                            "${_notifier.styleList[index].styleName}",
                                        //   imageUrl:"${_notifier.styleList[index].profileImage}" ,
                                        imageUrl:
                                            "https://tattooarts.herokuapp.com${_notifier.styleList[index].profileImage}",
                                        /* dark_color: kGreenColor,
                          light_color: kGreenColor,*/
                                      );
                                    },
                                    itemCount: _notifier.styleList.length,
                                    //   itemCount: _styleList.styleName.length,
                                  ),
                              ),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 170,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/bg_artist.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Form(
                      key: artistForm,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),
                        onSaved: (String value) {
                          value == null
                              ? _notifier.artistSearchValue = ""
                              : _notifier.artistSearchValue =
                                  value.toString().trim();
                        },
                        /* validator: (String value) {
                          if (value.isEmpty) {

                            return "Empty !";
                          } else{
                            setState(() {
                              _notifier.artistSearchValue = value.toString().trim();
                            });
                            return null;
                          }
                        },*/
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 10),
                          suffixIcon: InkWell(
                            onTap: () {
                              if (artistForm.currentState.validate()) {
                                artistForm.currentState.save();

                                if (!isExpandedArtistList)
                                  setState(() {
                                    isExpandedArtistList = true;
                                    FocusScope.of(context).unfocus();
                                    /*_scrollController..animateTo(180.0,
    duration: Duration(milliseconds: 500), curve: Curves.ease);*/
                                    _notifier.getArtistList(lat, lng);
                                  });
                                else if (isExpandedArtistList) {
                                  setState(() {
                                    isExpandedArtistList = false;
                                  });
                                }
                                //  Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new SearchResultShowScreen(0,"Artist Name")));
                              }
                            },
                            child: new Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Search By Artist Name',
                          hintStyle: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black.withOpacity(0.5)),
                          border: InputBorder.none,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isExpandedArtistList
                      ? Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          //left: 20, right: 20),
                          child: !_notifier.isArtistList
                              ? Container(
                                  height: 50,
                                  child: SpinKitWave(
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : Container(
                                  child: _notifier.artistSearchList.length == 0
                                      ? Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Center(
                                            child: Text(
                                              "Not Found",
                                              style: TextStyle(
                                                  color: kPrimaryTextColor,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                    reverse: true,
                                    physics: NeverScrollableScrollPhysics(),


                                    itemBuilder: (BuildContext context,
                                              int index) {
                                            return TopServiceDataNew(
                                              category: _notifier
                                                  .artistSearchList[index].name,
                                              address: _notifier
                                                  .artistSearchList[index]
                                                  .location,
                                              imageUrl: _notifier
                                                  .artistSearchList[index]
                                                  .profileImage,
                                              userId: _notifier
                                                  .artistSearchList[index].id,
                                              distance: _notifier
                                                  .artistSearchList[index]
                                                  .distance,
                                              name: _notifier
                                                  .artistSearchList[index].name,
                                              time:
                                                  "${_notifier.artistSearchList[index].defaultOpening} - ${_notifier.artistSearchList[index].defaultClosing}",
                                            );
                                          },
                                          itemCount:
                                              _notifier.artistSearchList.length,
                                        ),
                                ),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    height: 170.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/bg_shop_name.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: shopSearchForm,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                          /*   validator: (String value) {
                            if (value.isEmpty) {

                              return "Empty !";
                            } else{
                              setState(() {
                                _notifier.artistSearchValue = value.toString().trim();
                              });
                              return null;
                            }
                          },*/
                          onSaved: (String value) {
                            value == null
                                ? _notifier.shopSearchValue = ""
                                : _notifier.shopSearchValue =
                                    value.toString().trim();
                          },
                          decoration: InputDecoration(
                            hintText: 'Search by Shop Name',
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: InkWell(
                              onTap: () {
                                if (shopSearchForm.currentState.validate()) {
                                  shopSearchForm.currentState.save();
                                  if (!isExpandedShopList)
                                    setState(() {
                                      FocusScope.of(context).unfocus();
                                      _notifier.getShopNameList(lat, lng);
                                      isExpandedShopList = true;
                                    });
                                  else if (isExpandedShopList) {
                                    setState(() {
                                      isExpandedShopList = false;
                                    });
                                  }
                                  //  Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new SearchResultShowScreen(0,"Shop Name")));
                                }
                              },
                              child: new Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black.withOpacity(0.5)),
                            contentPadding:
                                EdgeInsets.only(top: 0, bottom: 0, left: 10),
                            border: InputBorder.none,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  isExpandedShopList
                      ? Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          //left: 20, right: 20),
                          child: !_notifier.isShopSearchList
                              ? Container(
                                  child: SpinKitWave(
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : Container(
                                  child: _notifier.shopSearchList.length == 0
                                      ? Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Center(
                                            child: Text(
                                              "Not Found",
                                              style: TextStyle(
                                                  color: kPrimaryTextColor,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                    shrinkWrap: true ,
                                    reverse: true,
                                    physics: NeverScrollableScrollPhysics(),

                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return TopServiceDataNew(
                                              category: _notifier
                                                  .shopSearchList[index].name,
                                              address: _notifier
                                                  .shopSearchList[index]
                                                  .location,
                                              imageUrl: _notifier
                                                  .shopSearchList[index]
                                                  .profileImage,
                                              userId: _notifier
                                                  .shopSearchList[index].id,
                                              distance: _notifier
                                                  .shopSearchList[index]
                                                  .distance,
                                              name: _notifier
                                                  .shopSearchList[index].name,
                                              time:
                                                  "${_notifier.shopSearchList[index].defaultOpening} - ${_notifier.shopSearchList[index].defaultClosing}",
                                            );
                                          },
                                          itemCount:
                                              _notifier.shopSearchList.length,
                                        ),
                                ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ));
  }
}

void toastMessage(String message) {
  /*Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    //timeInSecForIos: 1,
    fontSize: 16.0,
    backgroundColor: Colors.black,
  );*/
}
