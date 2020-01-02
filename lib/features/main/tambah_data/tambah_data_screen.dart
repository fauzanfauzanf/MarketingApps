import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:marketing_apps/features/main/main_screen.dart';
import 'package:marketing_apps/features/main/tambah_data/places.dart';

class TambahDataScreen extends StatefulWidget {
  @override
  _TambahDataScreenState createState() => new _TambahDataScreenState();
}

class _TambahDataScreenState extends State<TambahDataScreen> {
  File _imageFile;
  Position _currentPosition;
  String _currentAddress;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController lokasiCtrlr = TextEditingController();
  final TextEditingController namasekolahCtrlr = TextEditingController();
  final TextEditingController fotosekolahCtrlr = TextEditingController();
  final TextEditingController namacpCtrlr = TextEditingController();
  final TextEditingController phoneCtrlr = TextEditingController();

  final db = Firestore.instance;
  int fileName = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    fileName = DateTime.now().millisecondsSinceEpoch;
  }

  void checkValue() {
    if (_formKey.currentState.validate()) {
      print("Lokasi: ${lokasiCtrlr.text}");
      print("Nama Sekolah: ${namasekolahCtrlr.text}");
      print("Nama CP: ${namacpCtrlr.text}");
      print("Nomor Telepon: ${phoneCtrlr.text}");
      print("Foto: Photos/$fileName.png");
    }
  }

  Future getImage() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 500);

    setState(() {
      _imageFile = image;
    });
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getCurrentAddress() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "Jalan ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}";
      });
      Text(_currentAddress);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: _buildTitle(context),
        backgroundColor: Colors.red,
        elevation: 0.5,
      ),
      body: SafeArea(
        // top: false,
        // bottom: false,
        child: Container(
          height: double.maxFinite,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  prefix0.Container(
                    padding: prefix0.EdgeInsets.only(top: 20),
                    decoration: prefix0.BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: _imageFile == null
                                ? SizedBox(
                                    child: Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: prefix0.EdgeInsets.only(
                                                top: 40),
                                          ),
                                          FlatButton(
                                            child: Text(
                                              "Foto Sekolah",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Muli'),
                                            ),
                                            onPressed: getImage,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(child: Image.file(_imageFile)),
                          ),
                          prefix0.IconButton(
                            icon: Icon(Icons.add_photo_alternate),
                            color: Colors.black54,
                            onPressed: getImage,
                          )
                        ],
                      ),
                    ),
                  ),
                  prefix0.Padding(
                    padding: prefix0.EdgeInsets.only(top: 20),
                  ),
                  TextFormField(
                    controller: namasekolahCtrlr,
                    validator: (value) {
                      if (value.length < 3) {
                        print(value);
                        return "Wajib Diisi";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.school,
                          color: Colors.black,
                        ),
                        labelText: "Nama Sekolah",
                        labelStyle:
                            TextStyle(fontFamily: 'Muli', fontSize: 14)),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: namacpCtrlr,
                    validator: (value) {
                      if (value.length < 3) {
                        print(value);
                        return "Wajib Diisi";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Nama CP",
                        labelStyle:
                            TextStyle(fontFamily: 'Muli', fontSize: 14)),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: phoneCtrlr,
                    validator: (value) {
                      if (value.length < 3) {
                        print(value);
                        return "Wajib Diisi";
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.black,
                        ),
                        prefixStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        labelText: "Telephone",
                        labelStyle:
                            TextStyle(fontFamily: 'Muli', fontSize: 14)),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20.0),

                  FlatButton(
                    textColor: Colors.red,
                    child: Text(
                      "Cari Lokasi",
                      style: prefix0.TextStyle(fontFamily: 'Muli'),
                    ),
                    onPressed: () {
                      _getCurrentLocation();
                      _getCurrentAddress();
                    },
                  ),
                  Center(
                    child: Text(
                      "$_currentAddress",
                      style: TextStyle(fontFamily: 'Muli'),
                    ),
                  ),

                  // TextFormField(
                  //   controller: lokasiCtrlr,
                  //   validator: (value) {
                  //     if (value.length < 3) {
                  //       print(value);
                  //       return "Wajib Diisi";
                  //     }
                  //   },
                  //   keyboardType: TextInputType.text,
                  //   decoration: InputDecoration(
                  //       prefixIcon: Icon(
                  //         Icons.location_on,
                  //         color: Colors.black,
                  //       ),
                  //       labelText: "Lokasi",
                  //       labelStyle:
                  //           TextStyle(fontFamily: 'Muli', fontSize: 14)),
                  //   maxLines: 1,
                  // ),

                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  prefix0.Column(
                    children: <prefix0.Widget>[
                      prefix0.Padding(
                        padding: prefix0.EdgeInsets.only(top: 10),
                      ),
                      FlatButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        padding: prefix0.EdgeInsets.all(15),
                        onPressed: () async {
                          checkValue();

                          if (namasekolahCtrlr.text.isNotEmpty ||
                              namacpCtrlr.text.isNotEmpty ||
                              phoneCtrlr.text.isNotEmpty ||
                              lokasiCtrlr.text.isNotEmpty)
                            try {
                              final snackBar = SnackBar(
                                content: Text('Data Telah Dimasukan'),
                                action: SnackBarAction(
                                  label: 'Oke',
                                  onPressed: () {
                                    prefix0.Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  },
                                ),
                              );

                              // Find the Scaffold in the widget tree and use
                              // it to show a SnackBar.
                              Scaffold.of(context).showSnackBar(snackBar);
                              await db.collection('datasekolah').add({
                                'nama_sekolah': namasekolahCtrlr.text,
                                'nama_cp': namacpCtrlr.text,
                                'no_telponcp': phoneCtrlr.text,
                                'lokasi_foto': '$_currentAddress',
                                'images':
                                    '$fileName.png',
                                'isDeleted': 'false',
                              });
                              uploadImage();
                            } catch (e) {}

                          // Firestore.instance
                          //     .collection('datasekolah')
                          //     .add({
                          //       "nama_sekolah": namasekolahCtrlr.text,
                          //       "nama_cp": namacpCtrlr.text,
                          //       "no_telponcp": phoneCtrlr.text,
                          //       "lokasi_foto": lokasiCtrlr.text
                          //     })
                          //     .then((result) => {
                          //           Navigator.pop(context),
                          //           namasekolahCtrlr.clear(),
                          //           namacpCtrlr.clear(),
                          //           phoneCtrlr.clear(),
                          //           lokasiCtrlr.clear()
                          //         })
                          //     .catchError((err) => print(err));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontFamily: 'Muli'),
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tambah Data',
              style: TextStyle(fontFamily: 'Muli'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> uploadImage() async {
    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child('Photos/$fileName.png');
    StorageUploadTask uploadTask = ref.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    fileName = DateTime.now().millisecondsSinceEpoch;
    var url = await taskSnapshot.ref.getDownloadURL() as String;
    print(url);
    return "";
  }
}
