// import 'package:flutter/material.dart';

// class Search extends StatelessWidget {
//   const Search({Key key,this.onChanged}) : super(key: key);

//   final ValueChanged<String> onChanged;


//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(hintColor: Colors.transparent),
//       child: Container(
//         height: 42,
//         child: TextField(
//           onChanged: (value){print(value);},
//           decoration: InputDecoration(
//             hintText: "Search",
//             hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
//             prefixIcon: Icon(Icons.search, color: Colors.black),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
