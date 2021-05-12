import 'package:the_tatto/model/topservicedata.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:flutter/material.dart';
class Expansionpanel extends StatefulWidget {
  Expansionpaneltate createState() =>  Expansionpaneltate();
}
class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}
class Expansionpaneltate extends State<Expansionpanel> {


  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          "HEADER HERE",
          style: TextStyle(
            color: isExpanded ? Colors.pink : Colors.teal,
          ),
        ),
        // Change header (which is a Container widget in this case) background colour here.
        color: isExpanded ? Colors.orange : Colors.green,
      ),
      leading: Icon(
        Icons.face,
        size: 36.0,
      ),
      children: <Widget>[
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return new TopServiceDataNew(
                    category:"fdsads",
                    dark_color: kGreenColor,
                    light_color: kGreenColor,
                  );
                },
                itemCount:5,
              ),
            ),
          ],
        )],
      onExpansionChanged: (bool expanding) => setState(() => this.isExpanded = expanding),
    );
  }
}
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "Title",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[

                ListTile(
                  title: Text(
                      'data'
                  ),

                )
              ],
            ),
          ],
        ),
      ),
    );
  }*/
