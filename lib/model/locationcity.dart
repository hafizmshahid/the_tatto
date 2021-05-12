import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationCity extends StatelessWidget {
  final String location;

  const LocationCity({Key key, this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    return new Container(
        color: Colors.white,
        // width: 210,

        child: Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(10.0),
          width: screenwidth,




          child: Container(

            child:Text(location,style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 12),
            )



            // color: this.imageURL,


          ),
        )
      // ],

    );
  }


}
