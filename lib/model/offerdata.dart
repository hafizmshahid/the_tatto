import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';

class OfferData extends StatelessWidget {
  final String discount;
  final Color dark_color;
  final Color light_color;

  const OfferData({Key key, this.discount, this.dark_color, this.light_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    return new Container(
        color: kAppPrimaryColor,
        // width: 210,

        child: Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(10.0),
          width: screenwidth,

          decoration: BoxDecoration(
            color: this.light_color,
            borderRadius: BorderRadius.circular(6),

          ),

          // margin: EdgeInsets.only(left: 5,right: 5,bottom: 0.0),

          child: Container(



            // color: this.imageURL,

            child: new Row(
              children: <Widget>[



                Container(

                    height: 75,
                    // width: 70.0,

                    width:screenwidth * .22,


                    alignment: Alignment.topLeft,

                    decoration: BoxDecoration(
                        color: this.dark_color,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: new Center(
                      child: new Text(this.discount,
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

                      // mainAxisAlignment: MainAxisAlignment.start,



                      children: <Widget>[

                        Container(
                          transform: Matrix4.translationValues(5.0, 0.0, 0.0),
                          child: Text("CJJ662HS2",style: TextStyle(color: Color(0xFFfff9fb),fontSize: 14,fontWeight: FontWeight.w800,  fontFamily: 'Montserrat'),),

                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),

                          child: Text("Use coupon code to get 10% off on your service ",style: TextStyle(color: Color(0xFFfff9fb),fontSize: 11,fontWeight: FontWeight.w600,  fontFamily: 'Montserrat'),),

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
                      child: Text("Apply",style: TextStyle(color: this.dark_color,  fontFamily: 'Montserrat',fontSize: 11,fontWeight: FontWeight.w600),),
                    )





                ),








              ],
            ),
          ),
        )
      // ],

    );
  }


}
