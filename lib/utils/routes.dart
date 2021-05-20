import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/drawerscreen/top_offers.dart';
import 'package:the_tatto/screens/loginscreen.dart';

class Constants {
  static const String ROUTE_SIGN_IN_PAGE = '/HomeScreen';
  static const String ROUTE_Top_Offers = '/TopOffers';
}

class Routes {

  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_SIGN_IN_PAGE: (context) => LoginScreen(),
    Constants.ROUTE_Top_Offers: (context) => TopOffers(),
  };
/*  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/top_offers':
        return MaterialPageRoute(builder: (_) => TopOffers());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }*/
}


