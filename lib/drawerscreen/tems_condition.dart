import 'package:the_tatto/appbar/app_bar_only.dart';
import 'package:the_tatto/common/common_view.dart';
import 'package:the_tatto/drawer/drawer_only.dart';
import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';


/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new TermsCondition(),
  ));
}*/

class TermsCondition extends StatefulWidget {
  @override
  _TermsCondition createState() => new _TermsCondition();
}

class _TermsCondition extends State<TermsCondition> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child:Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kAppPrimaryColor,
        appBar: appbar(context, 'Terms & Conditions', _drawerscaffoldkey,false),
        key: _drawerscaffoldkey,
        drawer: new DrawerOnly(),
        body: new Stack(children: <Widget>
        [

          Expanded(
            flex:5,


            child:      Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 60),

              // child: Text("Hello"),

              child: new SingleChildScrollView(

                scrollDirection: Axis.vertical,//.horizontal
                child: new Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                      " Lorem Ipsum has been the industry's standard dummy text ever since"
                      " the 1500s, when an unknown printer took a galley of type and scrambled it "
                      "to make a type specimen book. It has survived not only five centuries, but "
                      "also the leap into electronic typesetting, remaining essentially unchanged."
                      " It was popularised in the 1960s with the release of Letraset sheets containing "
                      "Lorem Ipsum passages, and more recently with desktop publishing software like"
                      " Aldus PageMaker including versions of Lorem Ipsum."+"                                                                                    "
                      "                                                         " +
                      "It is a long established fact that a reader will be distracted by the"
                          " readable content of a page when looking at its layout. The point of "
                          "using Lorem Ipsum is that it has a more-or-less normal distribution of "
                          "letters, as opposed to using 'Content here, content here', making it look"
                          " like readable English. Many desktop publishing packages and web page "
                          "editors now use Lorem Ipsum as their default model text, and a"
                          " search for 'lorem ipsum' will uncover many"
                          " web sites still in their infancy. Various versions"
                          " have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",


                  style: new TextStyle(
                      fontSize: 14.0, color:kPrimaryTextColor,fontWeight: FontWeight.w500,fontFamily: 'Montserrat',letterSpacing:1.5,wordSpacing: 1

                  ),
                ),
              ),




              /*     child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  new Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: new Text(
                      "Some Heading Text",
                      style: new TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical,//.horizontal
                      child: new Text(
                        "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " +
                            "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " +
                            "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                            "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                            "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                            "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                            "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                            "8 Description that is too long in text format(Here Data is coming from API)" +
                            "9 Description that is too long in text format(Here Data is coming from API)" +
                            "10 Description that is too long in text format(Here Data is coming from API)"+
                            "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " +
                            "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " +
                            "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                            "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                            "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                            "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                            "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                            "8 Description that is too long in text format(Here Data is coming from API)" +
                            "9 Description that is too long in text format(Here Data is coming from API)" +
                            "10 Description that is too long in text format(Here Data is coming from API)",
                        style: new TextStyle(
                          fontSize: 16.0, color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/






            ),




          ),



          new Container(
              alignment: Alignment.bottomCenter,


              child: Body()
          )




        ]

        )


        ,
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: CustomView(),
      ),
    );
  }
}
