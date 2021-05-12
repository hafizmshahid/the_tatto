import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:the_tatto/utils/app_color.dart';



/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryView(),
    );
  }
}*/

class GalleryView extends StatefulWidget {
  GalleryView({Key key}) : super(key: key);

  @override
  _GalleryView createState() => _GalleryView();
}

class _GalleryView extends State<GalleryView> {
  int currentSelectedIndex;
  String categoryname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 45),



          // margin: EdgeInsets.only(top: 5.0),
          color: kAppPrimaryColor,
          height: double.infinity,
          child:StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) =>


            new Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),

                ),


                // color: Colors.grey,
                child: new Container(
                  decoration: BoxDecoration(

                    image:DecorationImage(
                      image: AssetImage("images/the_barber.jpg"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ) ,
                    borderRadius: BorderRadius.circular(10.0),

                  ),


                )),
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )


      ),
    );
  }
}