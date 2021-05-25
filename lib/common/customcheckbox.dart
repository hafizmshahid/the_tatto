import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';


class CustomCheckBox extends StatefulWidget {
 final int price;
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
    List<int> aboutStyleID = [
      _notifier.aboutDataList[0].firstServicesDetail.id,
      _notifier.aboutDataList[0].secondServicesDetail.id,
      _notifier.aboutDataList[0].thirdServicesDetail.id,
      _notifier.aboutDataList[0].fourServicesDetail.id,
      _notifier.aboutDataList[0].fiveServicesDetail.id,
    ];
    List aboutStyleName = [
      {
        "first_services": _notifier.aboutDataList[0].firstServicesDetail.id },{
        "second_services": _notifier.aboutDataList[0].secondServicesDetail.id,},{
        "third_services": _notifier.aboutDataList[0].thirdServicesDetail.id,},{
        "four_services": _notifier.aboutDataList[0].fourServicesDetail.id,},{
        "five_services": _notifier.aboutDataList[0].fiveServicesDetail.id,},{
      },
    ];



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
              print("--------------price ${widget.price}-----------");
              if(_value){
               // _notifier.totalPrice +=widget.price;
                _notifier.priceAdd(widget.price);

              print("--------------totalPrice ${_notifier.totalPrice}-----------");
              print("--------------aboutStylePrice ${aboutStyleID[widget.index]}-----------");
              print("--------------aboutStyleTitle---- ${_notifier.aboutStyleTitle[widget.index]}:${aboutStyleID[widget.index]}-----------");
                _notifier.aboutSelectServices .add("${_notifier.aboutStyleTitle[widget.index]}:${aboutStyleID[widget.index]}");

              }
              else{
               // _notifier.totalPrice -= widget.price;
                _notifier. priceSub(widget.price);
                print("--------------totalPrice ${_notifier.totalPrice}-----------");
               // if(_notifier.totalPrice >0){


               // }

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
