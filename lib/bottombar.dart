import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_tatto/fragments/fghome.dart';
import 'package:the_tatto/fragments/map.dart';
import 'package:the_tatto/fragments/notification.dart';
import 'package:the_tatto/fragments/appoinment.dart';
import 'package:flutter/material.dart';

import 'common/inndicator.dart';
import 'fragments/profile.dart';

class BottomBar extends StatefulWidget {
  int index;

  BottomBar(this.index);

  @override
  State<StatefulWidget> createState() {
    return BottomBar1();
  }
}

class BottomBar1 extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      color: Colors.black,
      home: DefaultTabController(
        length: 5,
        initialIndex: widget.index,
        child: new Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Appoinment(),
              Map(),
              FgHome(),
              Notification1(),
              Profile(),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today,color: Colors.white,)),
              Tab(icon: Icon(Icons.pin_drop_rounded,color: Colors.white,)),
              Tab(icon: Icon(Icons.home,color: Colors.white,)),
              Tab(icon: Icon(Icons.notification_important,color: Colors.white,)),
              Tab(icon: Icon(Icons.person,color: Colors.white,)),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(0.0),
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,
            indicator: MD2Indicator(
              indicatorSize: MD2IndicatorSize.full,
              indicatorHeight: 5.0,
              indicatorColor: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
