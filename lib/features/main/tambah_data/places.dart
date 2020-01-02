// import 'package:flutter/material.dart';

// class TambahDataForm extends StatefulWidget {
//   TambahDataForm({Key key}) : super(key: key);

//   @override
//   _TambahDataFormState createState() => _TambahDataFormState();
// }

// class _TambahDataFormState extends State<TambahDataForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Form')),
//         body: SingleChildScrollView(
//             child: Form(
//                 key: _formKey,
//                 autovalidate: true,
//                 child: Column(
//                   children: <Widget>[
//                     _showImage(),
//                     SizedBox(height: 16),
//                     Text(
//                       "Tambah Foto",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 30),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     ButtonTheme(
//                       child: IconButton(
//                         icon: Icon(Icons.add),
//                         color: Colors.white,
//                         onPressed: () => {},
//                       ),
//                     )
                    
//                   ],
//                 ))));
//   }
// }
