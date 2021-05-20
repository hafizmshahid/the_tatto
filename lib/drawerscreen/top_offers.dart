import 'package:the_tatto/ResponseModel/bannerResponse.dart';
import 'package:the_tatto/ResponseModel/offerResponse.dart';
import 'package:the_tatto/ResponseModel/offerbannerResppose.dart';
import 'package:the_tatto/apiservice/Apiservice.dart';
import 'package:the_tatto/apiservice/Retro_Api.dart';
import 'package:the_tatto/constant/preferenceutils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/model/offerdata.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:the_tatto/screens/base_scaffold.dart';
import 'package:the_tatto/utils/app_color.dart';

/*
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new TopOffers(),
  ));
}*/

class TopOffers extends StatefulWidget {
  @override
  _TopOffers createState() => new _TopOffers();
}

class _TopOffers extends State<TopOffers> {
  ProgressDialog pr;
  List<Data> offerdataList = new List<Data>();
  List<Offerbanner> banner_image = new List<Offerbanner>();
  List<String> image12 = new List<String>();

  int index = 0;

  @override
  void initState() {
    super.initState();
    pr = new ProgressDialog(context);
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
      CallApiforOfferData();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      pr.show();
      CallApiforBanner();
      CallApiforOfferData();
    } else {
      toastMessage("No Internet Connection");
    }
  }

  void CallApiforBanner() {
    pr.hide();
    RestClient(Retro_Api().Dio_Data()).offersbanner().then((response) {
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

  void CallApiforOfferData() {
    pr.hide();
    RestClient(Retro_Api().Dio_Data()).coupon().then((response) {
      setState(() {
        if (response.success = true) {
          print(response.data.length);
          offerdataList.addAll(response.data);
          int size = offerdataList.length;
          print("offersize:$size");
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
    'images/the_barber_small.png',
    'images/the_barber_small.png',
    'images/the_barber_small.png',
  ];

  List offerdatalist = [
    {
      "discount": "10%",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
    {
      "discount": "50%",
      "dark_color": const Color(0xFFb5b8ff),
      "light_color": const Color(0xFFc8caff)
    },
    {
      "discount": "30%",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
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

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // pr.show();

    return BaseScaffold(
        appBarHeading: "Top Offers",
        isBackArrow: true,
        backgroundColor: kAppPrimaryColor,
        isAppBarShow: true,
        body:  Container(
          child: Stack(
            children: <Widget>[
              new SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 400,
                      height: screenHeight * 0.25,
                      alignment: Alignment.topCenter,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 180,
                                viewportFraction: 1.0,
                                onPageChanged: (index, index1) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                              items: imgList.map((imgUrl) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        child: Stack(
                                      children: <Widget>[
                                        Material(
                                          color: kAppPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          elevation: 2.0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          type: MaterialType.transparency,
                                          child: Image.asset(
                                            imgUrl,
                                            height: 200,
                                            width: 550,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),

                                        Center(
                                          // child:Row(
                                          // children: map<Widget>(banner_image, (index, url) {
                                          child: Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),

                                                alignment: Alignment.center,
                                                // child:  Text(banner_image[_current].title,style:
                                                child: Text(
                                                  "The Massive Discount upto ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),

                                                alignment: Alignment.center,
                                                // child:  Text(banner_image[_current].discount.toString()+ "%",style:
                                                child: Text(
                                                  '50' + "%",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 45,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Is Coming Soon',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // }),
                                        ),

                                        /*   child:Column(


                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(top: 20),

                                                  alignment: Alignment.center,
                                                  child:  Text(banner_image[index].title,style:
                                                  TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),


                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 10),

                                                  alignment: Alignment.center,
                                                  child:  Text(banner_image[index].discount.toString()+ "%",style:
                                                  TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),


                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 10,bottom: 5),

                                                  alignment: Alignment.center,
                                                  child:  Text('Is Coming Soon',style:
                                                  TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),


                                                ),
                                              ],

                                            ),
                                         */

                                        // )
                                      ],
                                    ));
                                  },
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: map<Widget>(imgList, (index, url) {
                                return Container(
                                  alignment: Alignment.bottomCenter,
                                  width: 9.0,
                                  height: 9.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Color(0xFFe06287)
                                        : Color(0xFFffffff),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5.0, left: 10, right: 10, bottom: 60),
                      color: Colors.white,

                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: offerdatalist.length,
                          itemBuilder: (BuildContext context, int index) {
                            /*Color light_color;
                        Color dark_color;

                        int disc = offerdataList[index].discount;
                        if(disc >= 50){
                          light_color = const Color(0xFFc8caff);
                          dark_color = const Color(0xFFb5b8ff);
                        }else if(disc >= 30){

                          light_color = const Color(0xFFffc8c8);
                          dark_color = const Color(0xFFffb5b5);

                        }else{

                          light_color = const Color(0xFFffc8de);
                          dark_color = const Color(0xFFffb5cc);
                        }

                        String type = offerdataList[index].type;
                        String type1 = "";


                         if(type == "Percentage"){

                           type1 = "%";

                         }else if(type == "Amount"){

                           type1 = "Rs.";



                         }*/

                            /*  return new Container(
                            color: Colors.white,
                            // width: 210,

                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(10.0),
                              width: screenwidth,
                              decoration: BoxDecoration(
                                color: light_color,
                                borderRadius: BorderRadius.circular(6),

                              ),

                              // margin: EdgeInsets.only(left: 5,right: 5,bottom: 0.0),
                              child: Container(
                                child: new Row(
                                  children: <Widget>[
                                    Container(
                                        height: 75,
                                        // width: 70.0,

                                        width:screenwidth * .22,
                                        alignment: Alignment.topLeft,

                                        decoration: BoxDecoration(
                                            color: dark_color,
                                            borderRadius: BorderRadius.all(Radius.circular(6))),
                                        child: new Center(
                                          child: new Text(offerdataList[index].discount.toString() + type1,
                                            style: TextStyle(fontSize: 24, color: Color(0xFF213640),fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),
                                            textAlign: TextAlign.center,),
                                        )
                                    ),

                                    Container(
                                        width: screenwidth * .41,
                                        margin: EdgeInsets.only(left: 1.0,right: 10.0),

                                        alignment: Alignment.topLeft,
                                        child: ListView(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          children: <Widget>[
                                            Container(
                                              transform: Matrix4.translationValues(5.0, 0.0, 0.0),
                                              child: Text(offerdataList[index].code,style: TextStyle(color: Color(0xFFfff9fb),fontSize: 14,fontWeight: FontWeight.w800,  fontFamily: 'Montserrat'),),

                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),

                                              child: Text(offerdataList[index].desc,style: TextStyle(color: Color(0xFFfff9fb),fontSize: 11,fontWeight: FontWeight.w600,  fontFamily: 'Montserrat'),),

                                            ),

                                          ],

                                        )
                                    ),

                                    Container(
                                        width: screenwidth * .20,
                                        height: 35,

                                        margin: EdgeInsets.only(left: 1.0),
                                        alignment: Alignment.topCenter,

                                        child:   FlatButton(
                                          onPressed: () {},
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(7)),
                                          child: Text("Apply",style: TextStyle(color: dark_color,  fontFamily: 'Montserrat',fontSize: 11,fontWeight: FontWeight.w600),),
                                        )





                                    ),








                                  ],
                                ),
                              ),
                            )
                          // ],

                        );

*/

                            return new OfferData(
                              discount: offerdatalist[index]['discount'],
                              dark_color: offerdatalist[index]['dark_color'],
                              light_color: offerdatalist[index]['light_color'],
                            );
                          },
                        ),
                      ),

                      // height: 50,
                    ),
                  ],
                ),
              ),
              new Container(child: Body())
            ],
          ),
        ));
  }

  void toastMessage(String message) {
    /*  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      //timeInSecForIos: 1,
      fontSize: 16.0,
      backgroundColor: Colors.black,
    );*/
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: CustomView(),
      ),
    );
  }
}
