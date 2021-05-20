import 'package:the_tatto/common/inndicator.dart';
import 'package:the_tatto/detailtabscreen/galleryview.dart';
import 'package:the_tatto/detailtabscreen/reviewtab.dart';
import 'package:the_tatto/detailtabscreen/servicetab.dart';
import 'package:the_tatto/detailtabscreen/tababout.dart';

import 'package:the_tatto/drawerscreen/privacypolicy.dart';
import 'package:the_tatto/drawerscreen/tems_condition.dart';
import 'package:the_tatto/drawerscreen/top_offers.dart';
import 'package:the_tatto/fragments/editprofile.dart';
import 'package:the_tatto/screens/base_scaffold.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/model/offerdata.dart';
import 'package:flutter/material.dart';

/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new DetailBarber(),
  ));
}*/

class DetailBarber extends StatefulWidget {
  final String name;

  const DetailBarber({Key key, this.name}) : super(key: key);
  @override
  _DetailBarber createState() => new _DetailBarber();
}

class _DetailBarber extends State<DetailBarber>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  BaseScaffold(
      backgroundColor: kAppPrimaryColor,
      isBackArrow: true,
      appBarHeading: '${widget.name}',

      body: Scaffold(
          resizeToAvoidBottomInset: true,
          key: _drawerscaffoldkey,
          //set gobal key defined above

          drawer: new DrawerOnly(),
          body: new Stack(
            children: <Widget>[
              Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        // color: Colors.amber,
                        height: 200,
                        width: double.infinity,
                        alignment: Alignment.topCenter,

                        child: Image.asset(
                          "images/the_barber_small.png",
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        // child: Text('darshi'),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 10,
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          height: 50,
                          // color: Colors.grey,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: kAppPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 10.0,
                              ),
                            ],
                          ),

                          child: TabBar(
                            controller: _controller,
                            tabs: [
                              new Tab(
                                text: 'About',
                              ),
                              new Tab(
                                text: 'Gallery',
                              ),
                              new Tab(
                                text: 'Service',
                              ),
                            /*  new Tab(
                                text: 'Review',
                              ),*/
                            ],
                            labelColor:kGreenColor,
                            unselectedLabelColor: kPrimaryTextColor,
                            labelStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat'),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorPadding: EdgeInsets.all(0.0),
                            indicatorColor: kGreenColor,
                            indicatorWeight: 5.0,
                            indicator: MD2Indicator(
                              indicatorSize: MD2IndicatorSize.full,
                              indicatorHeight: 8.0,
                              indicatorColor: kGreenColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: kAppPrimaryColor,
                      child: new TabBarView(
                        controller: _controller,
                        children: <Widget>[
                          TabAbout(name: "${widget.name}",),
                          GalleryView(),
                          // Container(

                          // transform: Matrix4.translationValues(),
                          ServiceTab(),
                        //  ReViewTab(),

                          // ),

                          //

                          // TabAbout(),
                          /*   Container(
                                margin: EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 45),




                            ),
                            Container(
                                margin: EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 45),


                                child:
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30,left: 0,right: 0,bottom: 50),


                              child:

                            ),*/

                          // Container(
                          //
                          //   child: Center(
                          //     child: Text('Review',style: TextStyle(color:Colors.black,fontSize: 15),),
                          //
                          //   ),
                          // ),

                          // EditProfile(),
                          // EditProfile(),
                          // EditProfile(),
                          // EditProfile(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              new Container(child: Body())
            ],
          )),
    );
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
