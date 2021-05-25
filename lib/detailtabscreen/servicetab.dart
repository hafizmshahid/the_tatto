import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/common/customcheckbox.dart';
import 'package:the_tatto/common/customwidget.dart';
import 'package:the_tatto/model/checklist.dart';
import 'package:the_tatto/screens/bookapointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:the_tatto/separator/separator.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';



/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServiceTab(),
    );
  }
}*/

class ServiceTab extends StatefulWidget {
  ServiceTab({Key key}) : super(key: key);

  @override
  _ServiceTab createState() => _ServiceTab();
}

class _ServiceTab extends State<ServiceTab> {
  int currentSelectedIndex;
  String categoryname;

  bool _value = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_notifier.totalPrice =0;
  }

  @override
  Widget build(BuildContext context) {


    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;
    final _notifier = Provider.of<AuthViewModel>(context);


    String baseUrl="https://tattooarts.herokuapp.com";
    List aboutStyleName = [
      "${_notifier.aboutDataList[0].firstServicesDetail.servicesName}",
      "${_notifier.aboutDataList[0].secondServicesDetail.servicesName}",
      "${_notifier.aboutDataList[0].thirdServicesDetail.servicesName}",
      "${_notifier.aboutDataList[0].fourServicesDetail.servicesName}",
      "${_notifier.aboutDataList[0].fiveServicesDetail.servicesName}",
    ];
    List aboutStyleImageURl = [
      "$baseUrl${_notifier.aboutDataList[0].firstServicesDetail.servicesImage}",
      "$baseUrl${_notifier.aboutDataList[0].secondServicesDetail.servicesImage}",
      "$baseUrl${_notifier.aboutDataList[0].thirdServicesDetail.servicesImage}",
      "$baseUrl${_notifier.aboutDataList[0].fourServicesDetail.servicesImage}",
      "$baseUrl${_notifier.aboutDataList[0].fiveServicesDetail.servicesImage}",
    ];
    List<int> aboutStylePrice = [
      _notifier.aboutDataList[0].firstServicesDetail.servicesPrice,
      _notifier.aboutDataList[0].secondServicesDetail.servicesPrice,
      _notifier.aboutDataList[0].thirdServicesDetail.servicesPrice,
      _notifier.aboutDataList[0].fourServicesDetail.servicesPrice,
      _notifier.aboutDataList[0].fiveServicesDetail.servicesPrice,
    ];
    return SafeArea(
      child: Scaffold(
        body: new Container(
            color: Colors.blue,
            margin: EdgeInsets.only(bottom: 50),
            child: Stack(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              // height: 50,
                              color: Colors.white,
                              // color: Colors.red,
                              alignment: FractionalOffset.topCenter,
                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  Container(
                                    // height: screenHeight * 0.31,
                                    height: 300,
                                    child: ListView(
                                        children: <Widget>[
                                          InkWell(

                                            child: Container(
                                              margin: EdgeInsets.only(top: 0.0,left: 10,right: 10,bottom: 130),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index) {

                                                  return InkWell(
                                                    onTap: (){
                                                      // if(_notifier.valueCheckBox){
                                                      //   print("-------------------$index ---  ${aboutStylePrice[index]}-------------------");}
                                                      // setState(() {
                                                      //   _notifier.totalPrice +=aboutStylePrice[index];
                                                      //   print("-------------------totalPrice :${_notifier.totalPrice}-------------------");
                                                      //   //  _notifier.valueChechBoox = !_notifier.valueChechBoox;
                                                      // });
                                                    },
                                                    child: Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        new Container(
                                                          margin: EdgeInsets.only(left: 10, top: 5),
                                                          width: 20,
                                                          height: 20,
                                                          color: Colors.white,

                                                         // child: CustomCheckBox(check:_value),
                                                          child: CustomCheckBox(price: aboutStylePrice[index],index: index,),
                                                        ),
                                                        new Container(
                                                          margin: EdgeInsets.only(left: 10, top: 5),
                                                          height: 35,
                                                          width: 35,
                                                          //  margin: EdgeInsets.only(left: 10),
                                                          // color: Colors.black,
                                                          alignment: Alignment.topLeft,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            image: DecorationImage(
                                                              image: NetworkImage(aboutStyleImageURl[index]),
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment.topCenter,
                                                            ),
                                                          ),
                                                        ),
                                                        new Container(
                                                            margin: EdgeInsets.only(left: 10, top: 10),
                                                            height: 50,
                                                            // margin: EdgeInsets.only(left: 10,top: 10),
                                                            // width: double.infinity,

                                                            child: Column(
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
                                                                          '${aboutStyleName[index]}',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 12,
                                                                              fontFamily: 'Montserrat'),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: Text(
                                                                          '${aboutStylePrice[index]}',
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
                                                                  width: MediaQuery.of(context).size.width * .65,
                                                                  height: 10,
                                                                  margin: EdgeInsets.only(left: 1, top: 8, right: 10),
                                                                  child: MySeparator(),
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  );
                                                 // return  Checklist(styleName: aboutStyleName[index],stylePrice: aboutStylePrice[index],);
                                                },
                                                itemCount: 5,
                                              ),

                                            ),
                                          ),


                                        ]

                                    ),



                                  ),
                                  // ),
                                ],
                              ),
                            ),
                          ],),

                      ),

                      Container(
                        height: 100,
                        // color: Colors.red,
                        alignment: FractionalOffset.bottomCenter,


                        child:Row(

                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[

                            Container(
                              width:screenwidth * .35,
                              margin: EdgeInsets.only(left: 10),
                              alignment: FractionalOffset.centerLeft,
                              child: Text(
                                "Total ${_notifier.totalPrice} \u0024",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),

                            ),
                            Container(
                              width: screenwidth * .45,
                              margin: EdgeInsets.only(left: 10),
                              alignment: FractionalOffset.center,
                                child:   FlatButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        new MaterialPageRoute(builder: (ctxt) => new BookApointment()));
                                  },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text("Book service",style: TextStyle(color: Colors.blue,  fontWeight: FontWeight.w600,  fontFamily: 'Montserrat',fontSize: 14),),
                                )

                            ),
                            // Container(
                            //   width: screenwidth * .05,
                            //   margin: EdgeInsets.only(left: 5),
                            //   alignment: FractionalOffset.center,
                            //
                            //   child: SvgPicture.asset("images/cancel.svg",
                            //
                            //   ),
                            //
                            // ),


                          ],

                        ),

                      ),



                    ],
                  ),

                ),

              ],
            )

          /*

        ),*/

        ),
      ),
    );
  }
}