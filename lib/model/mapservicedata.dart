import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/screens/detailbarber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapServiceData extends StatelessWidget {
  final String category;
  final Color dark_color;
  final Color light_color;

  const MapServiceData({Key key, this.category, this.dark_color, this.light_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    return new Container(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        // width: 210,

        child: Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 0),



          // margin: EdgeInsets.only(left: 5,right: 5,bottom: 0.0),

          child: Container(
            alignment: Alignment.topCenter,
            height: 120,
            color: Colors.white,

            child:Row(
              children: <Widget>[
                new Container(


                  height:80,
                  width:screenwidth * .18 ,
                  margin: EdgeInsets.only(left: 10),
                  // color: Colors.black,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                          "images/smallbarber.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),


                ),




                // IntrinsicWidth(
                  // height: 100,
                  // width: MediaQuery
                  //     .of(context)
                  //     .size
                  //     .width * 1,
                  // margin: EdgeInsets.only(left: 10,top:20),
                  // color: Colors.grey,
                  // alignment: Alignment.topLeft,

                    // child:
                    Column(

                      children: <Widget>[

                        Expanded(

                          flex:9,

                          child:
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 0,left: 5,right: 5),
                                width: screenwidth * .50,
                                child:ListView(



                                  physics: NeverScrollableScrollPhysics(),

                                  children: <Widget>[

                                    Container(

                                      margin: EdgeInsets.only(top:10.0,left: 5),

                                      child: Text("Barberque", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat'

                                      ),),
                                    ),
                                    Container(

                                      margin: EdgeInsets.only(top: 5.0,left: 5),

                                      child: Text("vishwashanti marg, near lnn, pune ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Color(0xFFb9b9b9),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Montserrat'

                                        ),),
                                    ),


                                    Container(


                                      child: Row(

                                        children: <Widget>[


                                        /*  Container(
                                            margin: EdgeInsets.only(top: 1),

                                            child: Container(
                                              margin: EdgeInsets.only(top: 2,left:2),
                                              child: SvgPicture.asset("images/star.svg",width: 10,height: 10,



                                              ),
                                            ),
                                          ),

                                          Container(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 2,left:5),
                                              child: Text("4.0 ",
                                                  style: TextStyle(color: const Color(0xFFffc107),
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w600,fontFamily: 'Montserrat')),
                                            ),



                                          ),*/





                                          Container(
                                            margin: EdgeInsets.only(left: 2),


                                            child: Text("08:00 am - 09:00 pm ",style: TextStyle(color: const Color(0xFF00d14d),fontSize: 11,
                                                fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),

                                          )



                                        ],

                                      ),

                                    ),









                                  ],
                                ),
                              ),




                              Container(
                                width: screenwidth * .20,
                                margin: EdgeInsets.only(top: 0),

                                child:Column(



                                  children: <Widget>[

                                    Container(
                                      child: FlatButton(
                                        minWidth: screenwidth * .23,
                                        height: 30,
                                        onPressed: (){

                                          Navigator.push(context,
                                              new MaterialPageRoute(builder: (ctxt) => new DetailBarber()));

                                        },
                                        // shape: RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(5),
                                        //     side: BorderSide(color: const Color(0xFFe06287),width: 2)
                                        // ),


                                        child: Text('BOOK',style: TextStyle(color: const Color(0xFFe06287),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 11),

                                        ),
                                      ),





                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [

                                              WidgetSpan(
                                                child: Container(
                                                    margin:EdgeInsets.only(right: 2),
                                                    child: SvgPicture.asset("images/distance.svg",width: 14,height: 14,)),
                                              ),
                                              TextSpan(
                                                  text: "1km",
                                                  style: TextStyle(color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,fontFamily: 'Montserrat')
                                              ),



                                            ],
                                          ),
                                        )






                                    ),









                                  ],


                                ),




                              ),





                            ],

                          ),




                        ),








                        // Container(
                        //
                        //   child: Divider(color: Colors.grey,),
                        // )


                      ],

                    )

















                // ),
              ],

            ),


            // Container(
            //
            //   child: Divider(color: Colors.grey,height: 2.0,),
            //
            // )













          ),



        )
      // ],

    );
  }


}
