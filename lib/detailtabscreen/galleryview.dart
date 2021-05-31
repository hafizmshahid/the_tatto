import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:the_tatto/utils/app_api_ref.dart';
import 'package:the_tatto/utils/app_color.dart';
import 'package:the_tatto/viewmodel/auth_view_model.dart';
class GalleryView extends StatefulWidget {
  GalleryView({Key key}) : super(key: key);

  @override
  _GalleryView createState() => _GalleryView();
}

class _GalleryView extends State<GalleryView> {
  int currentSelectedIndex;
  String categoryname;
  String baseUrl="https://tattooarts.herokuapp.com";
  String imageFirst="media/images/ShopImages/allef-vinicius-M47HaQ1D__c-unsplash.jpg";

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    // List aboutImageList = [
    //   "${_notifier.aboutDataList[0].s}",
    //   "${_notifier.aboutDataList[0].shopImageDetail.secondImage}",
    //   "${_notifier.aboutDataList[0].shopImageDetail.thirdImage}",
    //   "${_notifier.aboutDataList[0].shopImageDetail.fourthImage}",
    //   "${_notifier.aboutDataList[0].shopImageDetail.fifthImage}",
    // ];
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 45),
          // margin: EdgeInsets.only(top: 5.0),
          color: kAppPrimaryColor,
          height: double.infinity,
          child:!_notifier.isAboutDataList
              ? Expanded(
            child: Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 20,
              ),
            ),
          ):Container(child:_notifier.aboutDataList.length ==0 ?Expanded(child:Center(child: Text(
            "Not Found",
            style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 15),
          ),) ): StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              // List aboutImageList = [
              //   "${_notifier.aboutDataList[0].imageDetail[index].shopImage.profileImage}",
              //   "${_notifier.aboutDataList[0].shopImageDetail.secondImage}",
              //   "${_notifier.aboutDataList[0].shopImageDetail.thirdImage}",
              //   "${_notifier.aboutDataList[0].shopImageDetail.fourthImage}",
              //   "${_notifier.aboutDataList[0].shopImageDetail.fifthImage}",
              // ];

            return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // color: Colors.grey,
                child: new Container(
                  decoration: BoxDecoration(
                    image:DecorationImage(
                    //  image: NetworkImage("$baseUrl${aboutImageList[index]}"),
                      image: NetworkImage("dsfkl"),
                      fit: BoxFit.fill,
                    ) ,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ));},
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ) ,)



      ),
    );
  }
}