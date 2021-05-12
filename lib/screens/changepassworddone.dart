import 'package:flutter/material.dart';

import 'loginscreen.dart';



/*void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new ChangePasswordDone(),

  ));
}*/

class ChangePasswordDone extends StatefulWidget {
  @override
  _ChangePasswordDone createState() => new _ChangePasswordDone();
}
class _ChangePasswordDone extends State<ChangePasswordDone> {
  @override
  Widget build(BuildContext context) {




    return new Scaffold(

      resizeToAvoidBottomInset : true,
      backgroundColor: Colors.white,

      body: Container(

        child: Stack(

          children: <Widget>[


                ListView(
                  children: [


                    Container(
                      child: Container(
                        margin: const EdgeInsets.only(top: 200.0, left: 0.0),
                        alignment: FractionalOffset.center,
                        child: Image.asset(
                          "images/passwordchangedone.png",
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 100.0, left: 0.0),
                        alignment: FractionalOffset.center,
                        child: Text(
                          'Congratulation!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 5.0, left: 0.0),
                        alignment: FractionalOffset.center,
                        child: Text(
                          'Your password has been changed sucessfully.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0, left: 5.0),
                      alignment: FractionalOffset.center,
                      child: GestureDetector(
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },

                        child:Text(
                          "Go To Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFF4a92ff),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),

                        )

                      ),
                    ),















                  ],




                )







          ],


        ),


      ),
    );

  }




}

