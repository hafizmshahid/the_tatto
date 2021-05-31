
import 'package:flutter/material.dart';


const kGoogleApiKey = "AIzaSyAkwHSqsWDFbqHoOHheYh-W8OMFalqhHBA";

class SelectListItem extends StatefulWidget {
  @override
  _SelectListItemState createState() => _SelectListItemState();
}

class _SelectListItemState extends State<SelectListItem> {
  List<int> _selectedItems = List<int>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select List Items'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return
              Container(
                color: (_selectedItems.contains(index)) ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                child: ListTile(
                  onTap: (){
                   // print("----------${selectedIndex.length}-------------");
                    if(_selectedItems.contains(index)){
                      setState(() {
                        _selectedItems.removeWhere((val) => val == index);
                      });
                    }
                  },
                  onLongPress: (){
                    if(! _selectedItems.contains(index)){
                      setState(() {
                        _selectedItems.add(index);
                      });
                    }
                  },
                  title: Text('$index'),
                ),
              );
          },
        ),
      ),
    );
  }
}


// class MyDemo extends StatefulWidget {
//   @override
//   _MyDemoState createState() => _MyDemoState();
// }
//
// class _MyDemoState extends State<MyDemo> {
//   double padValue = 0;
//
//   List<Paint> paints = <Paint>[
//     Paint(1, 'Red', Colors.red),
//     Paint(2, 'Blue', Colors.blue),
//     Paint(3, 'Green', Colors.green),
//     Paint(4, 'Lime', Colors.lime),
//     Paint(5, 'Indigo', Colors.indigo),
//     Paint(6, 'Yellow', Colors.yellow)
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Selectable ListView Example"),
//         ),
//         body: ListView(
//           children: List.generate(paints.length, (index) {
//             return ListTile(
//               onLongPress: () {
//                 setState(() {
//                   paints[index].selected = !paints[index].selected;
//
//                 //  log(paints[index].selected.toString());
//                 });
//               },
//               selected: paints[index].selected,
//               leading: GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: () {},
//                 child: Container(
//                   width: 48,
//                   height: 48,
//                   padding: EdgeInsets.symmetric(vertical: 4.0),
//                   alignment: Alignment.center,
//                   child: CircleAvatar(
//                     backgroundColor: paints[index].colorpicture,
//                   ),
//                 ),
//               ),
//               title: Text('ID: ' + paints[index].id.toString()),
//               subtitle: Text(paints[index].title),
//               trailing: (paints[index].selected)
//                   ? Icon(Icons.check_box)
//                   : Icon(Icons.check_box_outline_blank),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
//
// class Paint {
//   final int id;
//   final String title;
//   final Color colorpicture;
//   bool selected = false;
//
//   Paint(this.id, this.title, this.colorpicture);
// }

//
// class RoutesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: "My App",
//     routes: {
//       "/": (_) => MyApp(),
//       "/search": (_) => CustomSearchScaffold(),
//     },
//   );
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// final homeScaffoldKey = GlobalKey<ScaffoldState>();
// final searchScaffoldKey = GlobalKey<ScaffoldState>();
//
// class _MyAppState extends State<MyApp> {
//   Mode _mode = Mode.overlay;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: homeScaffoldKey,
//       appBar: AppBar(
//         title: Text("My App"),
//       ),
//       body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _buildDropdownMenu(),
//               ElevatedButton(
//                 onPressed: _handlePressButton,
//                 child: Text("Search places"),
//               ),
//               ElevatedButton(
//                 child: Text("Custom"),
//                 onPressed: () {
//                   Navigator.of(context).pushNamed("/search");
//                 },
//               ),
//             ],
//           )),
//     );
//   }
//
//   Widget _buildDropdownMenu() => DropdownButton(
//     value: _mode,
//     items: <DropdownMenuItem<Mode>>[
//       DropdownMenuItem<Mode>(
//         child: Text("Overlay"),
//         value: Mode.overlay,
//       ),
//       DropdownMenuItem<Mode>(
//         child: Text("Fullscreen"),
//         value: Mode.fullscreen,
//       ),
//     ],
//     onChanged: (m) {
//       setState(() {
//         _mode = m;
//       });
//     },
//   );
//
//   void onError(PlacesAutocompleteResponse response) {
//     homeScaffoldKey.currentState.showSnackBar(
//       SnackBar(content: Text(response.errorMessage)),
//     );
//   }
//
//   Future<void> _handlePressButton() async {
//     // show input autocomplete with selected mode
//     // then get the Prediction selected
//     Prediction p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: kGoogleApiKey,
//       onError: onError,
//       mode: _mode,
//       language: "fr",
//       // decoration: InputDecoration(
//       //   hintText: 'Search',
//       //   focusedBorder: OutlineInputBorder(
//       //     borderRadius: BorderRadius.circular(20),
//       //     borderSide: BorderSide(
//       //       color: Colors.white,
//       //     ),
//       //   ),
//       // ),
//       components: [Component(Component.country, "fr")],
//     );
//
//     displayPrediction(p, homeScaffoldKey.currentState);
//   }
// }
//
// Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
//   if (p != null) {
//     // get detail (lat/lng)
//     GoogleMapsPlaces _places = GoogleMapsPlaces(
//       apiKey: kGoogleApiKey,
//       apiHeaders: await GoogleApiHeaders().getHeaders(),
//     );
//     PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
//     final lat = detail.result.geometry.location.lat;
//     final lng = detail.result.geometry.location.lng;
//
//     scaffold.showSnackBar(
//       SnackBar(content: Text("${p.description} - $lat/$lng")),
//     );
//   }
// }
//
// // custom scaffold that handle search
// // basically your widget need to extends [GooglePlacesAutocompleteWidget]
// // and your state [GooglePlacesAutocompleteState]
// class CustomSearchScaffold extends PlacesAutocompleteWidget {
//   CustomSearchScaffold()
//       : super(
//     apiKey: kGoogleApiKey,
//     sessionToken: Uuid().generateV4(),
//     language: "en",
//     components: [Component(Component.country, "uk")],
//   );
//
//   @override
//   _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
// }
//
// class _CustomSearchScaffoldState extends PlacesAutocompleteState {
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
//     final body = PlacesAutocompleteResult(
//       onTap: (p) {
//         displayPrediction(p, searchScaffoldKey.currentState);
//       },
//       logo: Row(
//         children: [FlutterLogo()],
//         mainAxisAlignment: MainAxisAlignment.center,
//       ),
//     );
//     return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
//   }
//
//   @override
//   void onResponseError(PlacesAutocompleteResponse response) {
//     super.onResponseError(response);
//     searchScaffoldKey.currentState.showSnackBar(
//       SnackBar(content: Text(response.errorMessage)),
//     );
//   }
//
//   @override
//   void onResponse(PlacesAutocompleteResponse response) {
//     super.onResponse(response);
//     if (response != null && response.predictions.isNotEmpty) {
//       searchScaffoldKey.currentState.showSnackBar(
//         SnackBar(content: Text("Got answer")),
//       );
//     }
//   }
// }
//
// class Uuid {
//   final Random _random = Random();
//
//   String generateV4() {
//     // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
//     final int special = 8 + _random.nextInt(4);
//
//     return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
//         '${_bitsDigits(16, 4)}-'
//         '4${_bitsDigits(12, 3)}-'
//         '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
//         '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
//   }
//
//   String _bitsDigits(int bitCount, int digitCount) =>
//       _printDigits(_generateBits(bitCount), digitCount);
//
//   int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);
//
//   String _printDigits(int value, int count) =>
//       value.toRadixString(16).padLeft(count, '0');
// }