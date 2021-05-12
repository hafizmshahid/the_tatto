import 'package:the_tatto/common/customcheckbox.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {


  const Checklist({

    Key key,

    @required  dark_color, light_color, category,
  })  :


        super(key: key);

  @override
  _Checklist createState() => _Checklist();
}

class _Checklist extends State<Checklist> {

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(




      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,


        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,


          children: <Widget>[

            new Container(
              margin: EdgeInsets.only(left: 10,top:5),
              width: 20,
              height: 20,
              color: Colors.white,

              child: CustomCheckBox(),

              // child: CustomCheckBox(),
              // checkColor: Colors.white,
              // activeColor: Color(0xFFe06287),
              // value: valuesecond,
              // onChanged: (value) =>
              //     setState(() {
              //       valuesecond = !valuesecond;
              //     }),
            ),

            new Container(

              margin: EdgeInsets.only(left: 10,top:5),
              height: 35,
              width: 35,
              //  margin: EdgeInsets.only(left: 10),
              // color: Colors.black,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("images/maplocation.jpg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),


            new Container(
                margin: EdgeInsets.only(left: 10,top: 10),
                height: 50,
                // margin: EdgeInsets.only(left: 10,top: 10),
                // width: double.infinity,

                child:Column(

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[



                    // Expanded(

                    // child:
                    Container(

                      width: MediaQuery.of(context).size.width * .65,
                      height: 30,
                      margin: EdgeInsets.only(left: 1, top: 2, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Container(

                            child: Text(
                              'Traditional Tattoo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          Container(
                            child: Text(
                              '250 ₹',
                              style: TextStyle(
                                  color: const Color(0xFF999999),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ],
                      ),

                    ),



                    Container(
                        width: MediaQuery.of(context).size.width *.65,
                        height: 10,
                        margin: EdgeInsets.only(left: 1, top:8, right: 10),
                        child: MySeparator(),

                    ),









                    // ),



                    /*Row(



                    mainAxisAlignment: MainAxisAlignment.spaceBetween,


                    children: [




                      Container(
                        // width:150,


                        child:Text('Simple HairStyle',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)


                      ),


                      Container(
                        margin: EdgeInsets.only(left: 30,right: 20),


                          child:Text('300₹',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),)


                      ),


                    ],




                  )*/

                  ],

                )


            ),









          ],

        ),


      ),

    );
  }
}