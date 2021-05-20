import 'dart:async';
import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/bottombar.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:the_tatto/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

// ignore: must_be_immutable
class BaseScaffold extends StatefulWidget {
  final Widget body;
  final Color backgroundColor;
  final String appBarHeading;
  final bool internetFunction;
  final bool isAppBarShow;
  final bool isBackArrow;
  final int bottomBarIndex;
  const BaseScaffold(
      {@required this.body,
        this.backgroundColor,this.internetFunction = true, this.appBarHeading, this.bottomBarIndex=2, this.isBackArrow= false, this.isAppBarShow=true,
       });

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  bool _isNetworkConnected = true;
  Connectivity _connectivity;
  StreamSubscription _subscription;
  @override
  void initState() {
    _connectivity = Connectivity();
    _subscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          //Conncted to mobile or wifi
          print("----------------------Internet Connected-----------------");
          _isNetworkConnected = true;
        });
      } else {
        setState(() {
          print(
              "----------------------Internet Not Connected-----------------");
          _isNetworkConnected = false;
        });
      }
    });

    super.initState();
  }
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return SafeArea(
      child: Container(
        child: Scaffold(
          key: _drawerscaffoldkey,
            appBar:widget.isAppBarShow ? appbar(context, '${widget.appBarHeading}', _drawerscaffoldkey, widget.isBackArrow): null,
            drawer:DrawerOnly(),
           // drawer:widget.isBackArrow ? DrawerOnly(): null,
           // bottomNavigationBar: new BottomBar(widget.bottomBarIndex),
           /* bottomNavigationBar:  new TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calendar_today,color: Colors.black,)),
                Tab(icon: Icon(Icons.pin_drop_rounded,color: Colors.black,)),
                Tab(icon: Icon(Icons.home,color: Colors.black,)),
                Tab(icon: Icon(Icons.notification_important,color: Colors.black,)),
                Tab(icon: Icon(Icons.person,color: Colors.black,)),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(0.0),
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,

            ),*/

            body: ( _isNetworkConnected || !widget.internetFunction) ?
            Container(
              width: double.infinity,
              color: widget.backgroundColor ?? Colors.black,
              child: widget.body,
            ) :  Container(

            )),
      ),
    );
  }
}
