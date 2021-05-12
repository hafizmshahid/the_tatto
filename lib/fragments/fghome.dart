import 'dart:convert';
import 'package:provider/provider.dart';
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
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/utils/app_constant.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_tatto/screens/savelocation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/drawerscreen/top_services.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';

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

  int index = 0;
  ProgressDialog pr;
  

  @override
  void initState() {
    super.initState();
    pr = new ProgressDialog(context);
    isExpandedShopList = false;
    isExpandedArtistList = false;
    isExpandedStyleList = false;
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

  void CheckNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      pr.show();
      CallApiforBanner();
      CallApiForCategory();
      CallApiForSalon();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      pr.show();
      CallApiforBanner();
      CallApiForCategory();
      CallApiForSalon();
    } else {
      toastMessage("No Internet Connection");
    }
  }

  void CallApiforBanner() {
    pr.hide();
    RestClient(Retro_Api().Dio_Data()).banners().then((response) {
      setState(() {
        if (response.success = true) {
          print(response.data.length);
          banner_image.addAll(response.data);
          image12.clear();
          for (int i = 0; i < banner_image.length; i++) {
            image12.add(banner_image[i].imagePath + banner_image[i].image);
          }
          int length123 = image12.length;
          print("StringlistSize:$length123");
          pr.hide();
        } else {
          pr.hide();
          toastMessage("No Data");
        }
      });
    }).catchError((Object obj) {
      pr.hide();
      print("error:$obj");
      print(obj.runtimeType);
      toastMessage("Internal Server Error");
    });
  }

  void CallApiForCategory() {
    pr.hide();
    RestClient(Retro_Api().Dio_Data()).categories().then((response) {
      setState(() {
        if (response.success = true) {
          print(response.data.length);
          categorydataList.addAll(response.data);
          int size = categorydataList.length;

          pr.hide();
        } else {
          pr.hide();
          toastMessage("No Data");
        }
      });
    }).catchError((Object obj) {
      pr.hide();
      print("error:$obj");
      print(obj.runtimeType);
      toastMessage("Internal Server Error");
    });
  }

  void CallApiForSalon() {
    pr.hide();
    RestClient(Retro_Api().Dio_Data()).salons().then((response) {
      setState(() {
        if (response.success = true) {
          print(response.data.length);
          salondataList.addAll(response.data);
          int size = categorydataList.length;

          pr.hide();
        } else {
          pr.hide();
          toastMessage("No Data");
        }
      });
    }).catchError((Object obj) {
      pr.hide();
      print("error:$obj");
      print(obj.runtimeType);
      toastMessage("Internal Server Error");
    });
  }

  CarouselSlider carouselSlider;
  int _current = 0;

  List imgList = [
    'images/slider1.jpg',
    'images/slider2.jpg',
    'images/slider3.jpg',
  ];
  List headingList = [
    'Tatto Style',
    'Tatto Style 2',
    'Tatto Style 3',
  ];

  List categorydatalist = [
    {
      "category": "All",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
    {
      "category": "Tattoo Artist Name",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shop Name",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
  ];

  List userdetails = [
    {"first_name": "1", "last_name": "11", "imageURL": "Salon"},
    {"first_name": "2", "last_name": "11", "imageURL": "Styling"},
    {"first_name": "3", "last_name": "11", "imageURL": "Mackup"},
    {"first_name": "3", "last_name": "11", "imageURL": "Shaving"},
    {"first_name": "3", "last_name": "11", "imageURL": "Shampoo"},
  ];

  List servicedetail = [
    {
      "service_name": "Salon",
      "image": "images/salon.svg",
    },
    {"service_name": "Styling", "image": "images/styling.svg"},
    {
      "service_name": "Mackup",
      "image": "images/shampoo.svg",
    },
    {
      "service_name": "Shaving",
      "image": "images/shaving.svg",
    },
    {
      "service_name": "Shampoo",
      "image": "images/shampoo.svg",
    },
  ];


  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  bool isExpandedStyleList = false;
  bool isExpandedArtistList = false;
  bool isExpandedShopList = false;
  int selected = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    // TODO: implement build
    return BaseScaffold(
      appBarHeading: "Home",
        isBackArrow: false,
        body: Stack(
          children: [
            Container(color: Colors.black,height: double.infinity,width: double.infinity,),
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
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
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(

                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              showCursor: true,
                              readOnly: true,

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Traditional Tattoo Style',
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                                hintStyle: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black.withOpacity(0.5)),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(20.0),
                                    topLeft: const Radius.circular(20.0),
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(20.0),
                                    topLeft: const Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                             _notifier.getStyleList();
                              if (!isExpandedStyleList) {
                                setState(() {
                                  isExpandedStyleList = true;
                                });
                              } else if (isExpandedStyleList) {
                                setState(() {
                                  isExpandedStyleList = false;
                                });
                              }

                              // Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new SearchResultShowScreen(0,"Artist Name")));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: const Radius.circular(20.0),
                                    bottomRight: const Radius.circular(20.0),
                                  )),
                              child: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  isExpandedStyleList
                      ? Container(

                    height: 500,
                    child:_notifier.isStyleList ? Container(
                      height: 50,
                      child: SpinKitWave(
                        color: Colors.white,
                        size: 20,
                      ),
                    ): ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return StyleSearchItems(
                          category: "${_notifier.titleList[index]}",
                          dark_color: kGreenColor,
                          light_color: kGreenColor,
                        );
                      },
                      itemCount: 5,
                    ),
                  )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
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
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(

                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              showCursor: true,
                              readOnly: true,

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search By Artist Name',
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                                hintStyle: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black.withOpacity(0.5)),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(20.0),
                                    topLeft: const Radius.circular(20.0),
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(20.0),
                                    topLeft: const Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (!isExpandedArtistList)
                                setState(() {
                                  isExpandedArtistList = true;
                                  _scrollController..animateTo(180.0,
                                      duration: Duration(milliseconds: 500), curve: Curves.ease);
                                });
                              else if (isExpandedArtistList) {
                                setState(() {
                                  isExpandedArtistList = false;
                                });
                              }
                              //  Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new SearchResultShowScreen(0,"Artist Name")));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: const Radius.circular(20.0),
                                    bottomRight: const Radius.circular(20.0),
                                  )),
                              child: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  isExpandedArtistList
                      ? Container(
                    height: 350,
                    margin: EdgeInsets.only(bottom: 100, ),//left: 20, right: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return TopServiceDataNew(
                          category: "Name",
                          dark_color: categorydatalist[index]['dark_color'],
                          light_color: categorydatalist[index]
                          ['light_color'],
                        );
                      },
                      itemCount: 3,
                    ),
                  )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only( right: 20, left: 20),
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
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(

                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search by Shop Name',
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                                hintStyle: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black.withOpacity(0.5)),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(20.0),
                                    topLeft: const Radius.circular(20.0),
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(20.0),
                                    topLeft: const Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (!isExpandedShopList)
                                setState(() {
                                  isExpandedShopList = true;
                                });
                              else if (isExpandedShopList) {
                                setState(() {
                                  isExpandedShopList = false;
                                });
                              }
                              //  Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new SearchResultShowScreen(0,"Shop Name")));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: const Radius.circular(20.0),
                                    bottomRight: const Radius.circular(20.0),
                                  )),
                              child: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  isExpandedShopList ?
                  Container(
                    height: 350,
                    margin: EdgeInsets.only(bottom: 100, ),//left: 20, right: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return TopServiceDataNew(
                          category: "Name",
                          dark_color: categorydatalist[index]['dark_color'],
                          light_color: categorydatalist[index]
                          ['light_color'],
                        );
                      },
                      itemCount: 3,
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
