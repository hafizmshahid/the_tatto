import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/utils.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:the_tatto/model/mapservicedata.dart';
import 'package:flutter/services.dart';

import 'fghome.dart';


/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Map(),
  ));
}*/

class Map extends StatefulWidget {
  @override
  _Map createState() => new _Map();
}



class _Map extends State<Map> {

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  new GlobalKey<ScaffoldState>();

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allmarkers = [];


  List userdetails = [
    {"first_name": "1", "last_name": "11", "imageURL": "Salon"},
    {"first_name": "2", "last_name": "11", "imageURL": "Styling"},
    {"first_name": "3", "last_name": "11", "imageURL": "Mackup"},
    {"first_name": "3", "last_name": "11", "imageURL": "Shaving"},
    {"first_name": "3", "last_name": "11", "imageURL": "Shampoo"},

  ];

  List categorydatalist = [
    {
      "category": "All",
      "dark_color": const Color(0xFFffb5cc),
      "light_color": const Color(0xFFffc8de),
    },
    {
      "category": "Salon",
      "dark_color": const Color(0xFFb5b8ff),
      "light_color": const Color(0xFFc8caff)
    },
    {
      "category": "Styling",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Mackup",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shaving",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
    {
      "category": "Shampoo",
      "dark_color": const Color(0xFFffb5b5),
      "light_color": const Color(0xFFffc8c8)
    },
  ];



  @override
  Future<void> initState()  {
    super.initState();
    setCustomMapPin();

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'images/marker.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });

  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'images/marker.png');
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));


    LatLng pinPosition = LatLng(22.3039, 70.8022);

    // these are the minimum required values to set
    // the camera position
    CameraPosition initialLocation = CameraPosition(
        zoom: 11,
        bearing: 30,
        target: pinPosition
    );

    return new SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: appbar(context, 'Near By you',_drawerscaffoldkey,false),
        resizeToAvoidBottomInset: false,

        //second scaffold
        key: _drawerscaffoldkey,
        drawer: new DrawerOnly(),

          body:Container(

            child: Stack(

              children: <Widget>[

                Expanded(

                  child:Container(





                      child: GoogleMap(
                        myLocationEnabled: true,
                        scrollGesturesEnabled: false,
                          zoomControlsEnabled: false,

                markers: Set.from(allmarkers),
                        initialCameraPosition: initialLocation,
                        onMapCreated: (GoogleMapController controller) {
                          // controller.setMapStyle(Utils.mapStyles);
                          _controller.complete(controller);
                          setState(() {
                            allmarkers.add(
                              Marker(
                                markerId: MarkerId('markar1'),
                                position: LatLng(22.2814,70.7658),
                                icon: pinLocationIcon,
                                infoWindow: InfoWindow(title: "Barberque",)  ,

                              ),);

                            allmarkers.add(
                              Marker(
                                markerId: MarkerId('markar2'),
                                position: LatLng(22.2432,70.8000),
                                icon: pinLocationIcon,
                                infoWindow: InfoWindow(title: "Barberque",)  ,
                              ),





                            );
                          });

                        }
                    ),
            ),









                ),





               /*    Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 120,
                      color: Colors.white,
                      margin: EdgeInsets.all(10),

                      child:Container(

                        child: ListView.builder(

                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return new MapServiceData(
                              category: categorydatalist[index]
                              ['category'],
                              dark_color: categorydatalist[index]
                              ['dark_color'],
                              light_color: categorydatalist[index]
                              ['light_color'],
                            );
                          },
                          itemCount: categorydatalist.length,
                        ),


                      ),
                    ),
                   ),*/


          Align(
            alignment: FractionalOffset.bottomCenter,
            // child: Container(
            //
            //         margin: EdgeInsets.all(15.0),
            //         color: Colors.white,
            //         height: 130,

                    child:Container(
                      height: 120,

                      margin: EdgeInsets.only(left: 10,top: 10,right: 20,bottom: 10),

                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return new MapServiceData(
                              category: categorydatalist[index]
                              ['category'],
                              dark_color: categorydatalist[index]
                              ['dark_color'],
                              light_color: categorydatalist[index]
                              ['light_color'],
                              // imageURL: userdetails[index]['image_url'],
                            );
                          },
                          itemCount: categorydatalist.length,
                        )

                    )




                // ),

          ),

              ],
          ),


            ),

          ),











    );


  }

}

