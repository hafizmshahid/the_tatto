import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewData extends StatelessWidget {
  final String discount;
  final Color dark_color;
  final Color light_color;

  const ReviewData({Key key, this.discount, this.dark_color, this.light_color, category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(

      child: Container(

        alignment: Alignment.topLeft,
        // margin: EdgeInsets.all(10.0),
        width: screenwidth,
        height: 80,
        color: Colors.white,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[


            Container(
              width: screenwidth * .2,
              height: 75,
              // color: Colors.white,
              alignment: Alignment.center,



              child: Column(

                children: <Widget>[


                  Container(

                    margin: EdgeInsets.only(top: 20),
                    height: 40.0,
                    width: 40.0,


                    child:CircleAvatar(
                      radius: 55,
                      // backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/the_barber.jpg'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top:1),
                    height: 12.0,
                    width: 70.0,

                    child: Text("4.0",style: TextStyle(color: const Color(0xFFffc107),fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),



                    ),


                  )



                ],


              ),


            ),

            Container(
              alignment: Alignment.topCenter,
              margin:EdgeInsets.only(top: 10,left: 5,right: 5),
              width: screenwidth * .65,

              height: 75,

              decoration: BoxDecoration(
                color: const Color(0xFFf1f1f1),
                borderRadius: BorderRadius.circular(8),

              ),



              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[

                  Container(
                    height: 30,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[

                        Container(

                          margin:EdgeInsets.only(left: 5),
                          child: Text("Darshi",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Montserrat',),
                          ),
                        ),
                        Container(

                          margin:EdgeInsets.only(left: 5,right: 5),
                          child: Text("15 Hours Ago.",style: TextStyle(color: Color(0xFF999999),fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Montserrat',),
                          ),
                        ),








                      ],



                    ),

                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5,right: 5),
                    height: 40,

                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since",
                      style: TextStyle(color: Color(0xFF999999),fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Montserrat',),


                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),

                    // color: Colors.yellow

                  ),






                ],

              ),




            ),





          ],



        ),


      ),



















      // ],

    );
  }


}
