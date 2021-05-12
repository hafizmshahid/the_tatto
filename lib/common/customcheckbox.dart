import 'package:flutter/material.dart';


class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key key}) : super(key: key);

  @override
  _CustomCheckBox createState() => _CustomCheckBox();
}

class _CustomCheckBox extends State<CustomCheckBox> {
  @override
  // implement wantKeepAlive


  @override
  void initState() {
    super.initState();
  }
  bool _value = false;

  @override
  Widget build(BuildContext context) {


    var  color = _value
        ? Color(0xFFe06287)
        : Color(0xFFa5a5a5);



    return Container(
          width: 15,
          height: 15,
          child: InkWell(
            onTap: () {
              setState(() {
                _value = !_value;
                print(_value);
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: color, border:  Border.all(color: const Color(0xFFdddddd),),borderRadius:BorderRadius.circular(8),),

              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: _value
                    ? Icon(
                  Icons.check,
                  size: 15.0,
                  color: Colors.white,
                )
                    : Icon(
                  Icons.check_box_outline_blank_outlined,
                  size: 15.0,
                  color: color,
                ),
              ),
            ),
          )
    );
  }}
