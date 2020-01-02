// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart' as prefix0;
// import 'package:flutter/material.dart';
// import 'package:marketing_apps/features/main/data_sekolah/detailScreen.dart';

// class UpdateDataScreen extends StatefulWidget {
//   final db = Firestore.instance;
//   final DocumentSnapshot post;

//   UpdateDataScreen({this.post});
//   @override
//   _UpdateDataScreenState createState() => new _UpdateDataScreenState();
// }

// class _UpdateDataScreenState extends State<UpdateDataScreen> {
//   File galleryFile;
//   File cameraFile;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController lokasiCtrlr = TextEditingController();
//   final TextEditingController namasekolahCtrlr = TextEditingController();
//   final TextEditingController fotosekolahCtrlr = TextEditingController();
//   final TextEditingController namacpCtrlr = TextEditingController();
//   final TextEditingController phoneCtrlr = TextEditingController();

//   final db = Firestore.instance;
//   @override
//   void dispose() {
//     super.dispose();
//     lokasiCtrlr.dispose();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     namasekolahCtrlr.text = widget.post.data['nama_sekolah'];
//     fotosekolahCtrlr.text = widget.post.data['nama_sekolah'];
//     namacpCtrlr.text = widget.post.data['nama_cp'];
//     phoneCtrlr.text = widget.post.data['no_telponcp'];
//     lokasiCtrlr.text = widget.post.data['lokasi_foto'];
//   }

//   void checkValue() {
//     if (_formKey.currentState.validate()) {
//       print("Lokasi: ${lokasiCtrlr.text}");
//       print("Nama Sekolah: ${namasekolahCtrlr.text}");
//       print("Nama CP: ${namacpCtrlr.text}");
//       print("Nomor Telepon: ${phoneCtrlr.text}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // imageSelectorGallery() async {
//     //   galleryFile = await ImagePicker.pickImage(
//     //     source: ImageSource.gallery,
//     //   );
//     //   print("Foto Dari Galeri: " + galleryFile.path);
//     //   setState(() {});
//     // }

//     // //display image selected from camera
//     // imageSelectorCamera() async {
//     //   cameraFile = await ImagePicker.pickImage(
//     //     source: ImageSource.camera,
//     //   );
//     //   print("Foto dari Kamera : " + cameraFile.path);
//     //   setState(() {});
//     // }

//     return new Scaffold(
//       appBar: AppBar(
//         title: _buildTitle(context),
//         backgroundColor: Colors.red,
//         elevation: 0.5,
//       ),
//       body: Builder(
//         builder: (context) => SafeArea(
//           // top: false,
//           // bottom: false,
//           child: Container(
//             height: double.maxFinite,
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: namasekolahCtrlr,
//                       validator: (value) {
//                         if (value.length < 3) {
//                           print(value);
//                           return "Wajib Diisi";
//                         }
//                       },
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.school,
//                             color: Colors.black,
//                           ),
//                           labelText: "Nama Sekolah",
//                           labelStyle:
//                               TextStyle(fontFamily: 'Muli', fontSize: 14)),
//                       maxLines: 1,
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: namacpCtrlr,
//                       validator: (value) {
//                         if (value.length < 3) {
//                           print(value);
//                           return "Wajib Diisi";
//                         }
//                       },
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.person,
//                             color: Colors.black,
//                           ),
//                           labelText: "Nama CP",
//                           labelStyle:
//                               TextStyle(fontFamily: 'Muli', fontSize: 14)),
//                       maxLines: 1,
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: phoneCtrlr,
//                       validator: (value) {
//                         if (value.length < 3) {
//                           print(value);
//                           return "Wajib Diisi";
//                         }
//                       },
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.call,
//                             color: Colors.black,
//                           ),
//                           prefixStyle: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           labelText: "Telephone",
//                           labelStyle:
//                               TextStyle(fontFamily: 'Muli', fontSize: 14)),
//                       maxLines: 1,
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: lokasiCtrlr,
//                       validator: (value) {
//                         if (value.length < 3) {
//                           print(value);
//                           return "Wajib Diisi";
//                         }
//                       },
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.location_on,
//                             color: Colors.black,
//                           ),
//                           labelText: "Lokasi",
//                           labelStyle:
//                               TextStyle(fontFamily: 'Muli', fontSize: 14)),
//                       maxLines: 1,
//                     ),
//                     // TextFormField(
//                     //   onTap: () async{
//                     //       Prediction p = await PlacesAutocomplete.show(context: context, apiKey:,
//                     //       language: "id", components: [
//                     //         Component(Component.country, "id")
//                     //       ]);

//                     //   },
//                     // )
//                     // SizedBox(height: 20.0),
//                     // Icon(Icons.camera_front),
//                     // Padding(padding: EdgeInsets.all(10)),
//                     // Text(
//                     //   "Pilih Foto",
//                     //   textAlign: TextAlign.center,
//                     // ),
//                     // Padding(padding: EdgeInsets.all(10)),
//                     // Column(
//                     //   children: <Widget>[
//                     //     new RaisedButton(
//                     //       child: new Text('Galeri'),
//                     //       onPressed: imageSelectorGallery,
//                     //     ),
//                     //     new RaisedButton(
//                     //       child: new Text('Kamera'),
//                     //       onPressed: imageSelectorCamera,
//                     //     ),
//                     //     // displaySelectedFile(galleryFile),

//                     //     Padding(
//                     //       padding: EdgeInsets.all(20),
//                     //     ),
//                     //     // displaySelectedFile(cameraFile)
//                     //   ],
//                     // ),

//                     Padding(
//                       padding: EdgeInsets.only(top: 20),
//                     ),
//                     prefix0.Column(
//                       children: <prefix0.Widget>[
//                         prefix0.Padding(
//                           padding: prefix0.EdgeInsets.only(top: 10),
//                         ),
//                         FlatButton(
//                           color: Colors.red,
//                           textColor: Colors.white,
//                           padding: prefix0.EdgeInsets.all(15),
//                           onPressed: () async {
//                             checkValue();

//                             if (namasekolahCtrlr.text.isNotEmpty ||
//                                 namacpCtrlr.text.isNotEmpty ||
//                                 phoneCtrlr.text.isNotEmpty ||
//                                 lokasiCtrlr.text.isNotEmpty)
//                               try {
//                                 final snackBar = SnackBar(
//                                   content: Text('Data Telah Diubah'),
//                                   action: SnackBarAction(
//                                     label: 'Oke',
//                                     onPressed: () {
                                      
//                                     },
//                                   ),
//                                 );

//                                 // Find the Scaffold in the widget tree and use
//                                 // it to show a SnackBar.
//                                 Scaffold.of(context).showSnackBar(snackBar);
//                                 await db
//                                     .collection('datasekolah')
//                                     .document(widget.post.documentID)
//                                     .updateData({
//                                   'nama_sekolah': namasekolahCtrlr.text,
//                                   'nama_cp': namacpCtrlr.text,
//                                   'no_telponcp': phoneCtrlr.text,
//                                   'lokasi_foto': lokasiCtrlr.text,
//                                   'isDeleted' : 'false'
//                                 });
//                               } catch (e) {
//                                 print(e);
//                               }

//                             // Firestore.instance
//                             //     .collection('datasekolah')
//                             //     .add({
//                             //       "nama_sekolah": namasekolahCtrlr.text,
//                             //       "nama_cp": namacpCtrlr.text,
//                             //       "no_telponcp": phoneCtrlr.text,
//                             //       "lokasi_foto": lokasiCtrlr.text
//                             //     })
//                             //     .then((result) => {
//                             //           Navigator.pop(context),
//                             //           namasekolahCtrlr.clear(),
//                             //           namacpCtrlr.clear(),
//                             //           phoneCtrlr.clear(),
//                             //           lokasiCtrlr.clear()
//                             //         })
//                             //     .catchError((err) => print(err));
//                           },
//                           child: Text(
//                             "Submit",
//                             style: TextStyle(fontFamily: 'Muli'),
//                           ),
//                         ),
//                       ],
//                     ),
//                     //const SizedBox(height: 30.0),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _buildTitle(BuildContext context) {
//   return new InkWell(
//     child: new Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       child: new Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text(
//             'Edit Data',
//             style: TextStyle(fontFamily: 'Muli'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
