import 'package:flutter/material.dart';

class TimeData extends StatefulWidget {
  final String time;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  const TimeData({
    this.time,
    Key key,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
  })  : assert(index != null),
   assert(time != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _TimeData createState() => _TimeData();
}

class _TimeData extends State<TimeData> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        height: 7,
        margin: EdgeInsets.all(1.0),

        child: FlatButton(
          onPressed: null,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     side: BorderSide(color: const Color(0xFFe06287))
          // ),


          child: Text(widget.time,style: TextStyle(color:widget.isSelected
          ? Colors.white
              : Colors.black,fontSize: 11,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,),
          color: Colors.white,




        ),

        decoration: widget.isSelected

        // ?Container()
        // :Container(),








            ? BoxDecoration(color: const Color(0xFF4a92ff), border:  Border.all(color: const Color(0xFF4a92ff),),borderRadius:BorderRadius.circular(8),
         )

            : BoxDecoration(),
      ),
    );
  }
}