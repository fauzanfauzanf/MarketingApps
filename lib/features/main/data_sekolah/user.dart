import 'package:firebase_database/firebase_database.dart';
class User {
  String _id;
  String _namaSekolah;
  String _namaCp;
  String _noTelponCp;
  String _alamat;
  String _index;
  String _images;

  User (this._id, this._namaSekolah, this._namaCp, this._noTelponCp, this._alamat, this._index, this._images);
  String get namaSekolah => _namaSekolah;
  String get namaCp => _namaCp;
  String get noTelponCp => _noTelponCp;
  String get alamat => _alamat;
  String get id => _id;
  String get index => _index;
  String get images => _images;

  User.fromSnapshot(DataSnapshot snapshot){ 
    _id = snapshot.key;
    _namaSekolah = snapshot.value['nama_sekolah'];
    _namaCp = snapshot.value['nama_cp'];
    _noTelponCp = snapshot.value['no_telponcp'];
    _alamat = snapshot.value['alamat'];
    _index = snapshot.value['index'];
    _images = snapshot.value['images'];
  }
}