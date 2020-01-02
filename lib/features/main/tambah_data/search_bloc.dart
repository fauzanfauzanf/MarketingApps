// import 'dart:async';

// import 'package:marketing_apps/service/place_plugin.dart';

// const googlePlaceApikey = "";

// class SearchBloc {
//   var _searchController = StreamController();

//   SearchBloc(){
//     PlacePlugin.initialize(googlePlaceApikey);
//   }

//   Stream get searchStream => _searchController.stream;

//   void searchPlace(String keyword){
//     if (keyword.isNotEmpty) {
//       _searchController.sink.add("Searching..");
//       PlacePlugin.search(keyword).then((result){
//         _searchController.sink.add(result);
//       }).catchError((e){

//       });
//     }else{
//       _searchController.add([]);
//     }
//   }
// }