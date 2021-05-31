import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';


class CustomCheckBox extends StatefulWidget {
 final double price;
 final int index;

  const CustomCheckBox({Key key, this.price, this.index}) : super(key: key);

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
    final _notifier = Provider.of<AuthViewModel>(context);

    final List<Map<String, dynamic >>serviceTime = [];
    List<int> _selectedItems = List<int>();
    List<int> selectedIndex=[];



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

              if(_value){
                if(_selectedItems.contains(widget.index)){
                  setState(() {
                    _selectedItems.removeWhere((val) => val == widget.index);
                  });
                }
                 _notifier.priceAdd(widget.price);


                print("--------------${widget.index}--------------");
                selectedIndex.add(widget.index);

              }
              else{
                if(! _selectedItems.contains(widget.index)){
                  setState(() {
                    _selectedItems.add(widget.index);
                  });
                }



                 _notifier. priceSub(widget.price);



              }
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
