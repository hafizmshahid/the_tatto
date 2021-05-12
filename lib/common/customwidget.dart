import 'package:flutter/material.dart';
import 'package:the_tatto/utils/app_color.dart';

class CustomWidget extends StatefulWidget {
  final String category;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  const CustomWidget({
    this.category,
    Key key,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
  })  : assert(index != null),
   assert(category != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {

  @override
  Widget build(BuildContext context) {


    // var innerBorder = Border.all(
    //     width: 1.0,
      var  color = widget.isSelected
            ? kGreenColor
            : Color(0xFFa5a5a5);
    return GestureDetector(
      onTap: widget.onSelect,
       child: Container(
                margin: EdgeInsets.all(5.0),

                child: FlatButton(
                  onPressed: null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: color)
                  ),


                  child: Text("${widget.category}",style: TextStyle(color:widget.isSelected
                      ? Colors.white
                      : Color(0xFFa5a5a5),fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,),
                  color: Colors.white,




                ),

                decoration: widget.isSelected

                // ?Container()
                // :Container(),








                    ? BoxDecoration(color: kGreenColor,borderRadius:BorderRadius.circular(8),

                )

                    : BoxDecoration(),
              ),



    );
  }
}