import 'package:flutter/material.dart';

class ZButtonRaised extends StatelessWidget {
  final GestureTapCallback onTap;
  final EdgeInsets margin;
  final String text;
  final bool isUpperCaseText = true;
  final Color color;
  ZButtonRaised(
      {@required this.text, @required this.onTap, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 48,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: color ?? Theme.of(context).buttonColor,
        child: Text(
          isUpperCaseText ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          onTap();
        },
      ),
    );
  }
}
