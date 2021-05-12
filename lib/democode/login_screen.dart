// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool isRememberMe = false;
//   bool _passwordVisible = true;
//
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//
//
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFFAFAFA),
//         body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints viewportConstraints) {
//             return SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints:
//                     BoxConstraints(minHeight: viewportConstraints.maxHeight),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     HeroImage(),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(30.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             AppLableWidget(
//                               title: 'Email',
//                             ),
//                             CardTextFieldWidget(
//                               hintText: 'Enter Your Email ID',
//                               textInputType: TextInputType.emailAddress,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 AppLableWidget(
//                                   title: 'Password',
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 15.0),
//                                   child: GestureDetector(
//                                     onTap: (){
//                                       Navigator.of(context).push(
//                                           Transitions(
//                                               transitionType: TransitionType.fade,
//                                               curve: Curves.bounceInOut,
//                                               reverseCurve: Curves.fastLinearToSlowEaseIn,
//                                               widget: ChangePassword())
//                                       );
//                                     },
//                                     child: Text(
//                                       'Forgot Password ?',
//                                       style: TextStyle(
//                                           fontSize: 14.0,
//                                           fontFamily: Constants.app_font),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             CardPasswordTextFieldWidget(
//                                 hintText: 'Enter Your Password',
//                                 isPasswordVisible: _passwordVisible),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: ClipRRect(
//                                     clipBehavior: Clip.hardEdge,
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(5)),
//                                     child: SizedBox(
//                                       width: 40.0,
//                                       height: 40.0,
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0),
//                                         ),
//                                         child: Container(
//                                           child: Theme(
//                                             data: ThemeData(
//                                               unselectedWidgetColor:
//                                                   Colors.transparent,
//                                             ),
//                                             child: Checkbox(
//                                               value: isRememberMe,
//                                               onChanged: (state) => setState(
//                                                   () => isRememberMe =
//                                                       !isRememberMe),
//                                               activeColor: Colors.transparent,
//                                               checkColor:
//                                                   Color(Constants.color_theme),
//                                               materialTapTargetSize:
//                                                   MaterialTapTargetSize.padded,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   'Remember Me',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontFamily: Constants.app_font),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: RoundedCornerAppButton(
//                                 onPressed: (){
//                                   Navigator.of(context).pushReplacement(
//                                       Transitions(
//                                           transitionType: TransitionType.slideUp,
//                                           curve: Curves.bounceInOut,
//                                           reverseCurve: Curves.fastLinearToSlowEaseIn,
//                                           widget: DashboardScreen())
//                                   );
//                                 },
//                                 btn_lable: 'Login',
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).push(
//                                     Transitions(
//                                         transitionType: TransitionType.slideUp,
//                                         curve: Curves.bounceInOut,
//                                         reverseCurve: Curves.fastLinearToSlowEaseIn,
//                                         widget: CreateNewAccount())
//                                 );
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Don\'t have an account ? ',
//                                     style: TextStyle(
//                                         fontFamily: Constants.app_font),
//                                   ),
//                                   Text(
//                                     'Create Now',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: Constants.app_font),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset(
//                           'images/ic_login_page11.png',
//                           fit: BoxFit.cover,
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//
// }
//
//
//
//
