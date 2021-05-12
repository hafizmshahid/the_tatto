import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';

class NotificationData extends StatelessWidget {
  final String discount;
  final Color dark_color;
  // ignore: non_constant_identifier_names
  final Color light_color;

  const NotificationData({Key key, this.discount, this.dark_color, this.light_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return new Container(
      color: kAppPrimaryColor,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        // constraints: BoxConstraints.expand(),
        width: double.infinity,
        height: 70,
        child: new Row(
          children: <Widget>[
            new Container(
              height: 40,
              width: 40,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(



                  image: AssetImage(
                    "images/smallbarber.png",
                  ),
                  fit: BoxFit.fitWidth,



                  alignment: Alignment.topCenter,
                ),
              ),
            ),


            Container(
                // width: 190,
                width: screenwidth * .55,

                height: 35,

                margin: EdgeInsets.only(left: 1.0,right: 10.0,top: 1),

                alignment: Alignment.topLeft,
                child: ListView(

                  children: <Widget>[

                    Container(
                      transform: Matrix4.translationValues(5.0, 0.0, 0.0),

                      child:Text("Barberque", style: TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'

                      ),
                      ),



                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("get upto 50% off on Japanese Tattoo",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,

                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'

                        ),

                      ),



                    ),

                  ],

                )





            ),

            Container(
              width: screenwidth * .17,

                // width: 55,
                height: 20,

                margin: EdgeInsets.only(left: 1.0),
                alignment: Alignment.topCenter,

                child:Visibility(



                  child: RaisedButton(


                    textColor: Colors.white,
                    color: Color(0xFFff0000),
                    child: Text("NEW",  style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,

                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'

                    ),),
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),





                ),



                // child:   FlatButton(
                //   onPressed: () {},
                //   color: Colors.white,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Text("NEW",style: TextStyle(color: this.dark_color,  fontFamily: 'Montserrat',fontSize: 11),),
                // )





            ),








          ],
        ),


        // color: Colors.grey,


      ),
    );

  }



}
