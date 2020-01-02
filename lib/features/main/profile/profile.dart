import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_apps/features/bloc/bloc.dart';
import 'package:marketing_apps/features/login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseUser currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        // call setState to rebuild the view
        this.currentUser = user;
      });
    });
  }

  String _email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "Loading....";
    }
  }

  String _name() {
    if (currentUser != null) {
      return currentUser.displayName;
    } else {
      return " ";
    }
  }

  String _pict() {
    if (currentUser != null) {
      return currentUser.photoUrl.toString();
    } else {
      return "Loading...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _buildTitle(context), elevation: 0,),
      body: Center(
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60)),
          Center(child: CircleAvatar(
            radius: 75,
            backgroundImage: NetworkImage(_pict()),
          )),
          Padding(padding: EdgeInsets.only(top: 35)),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(_name(),
              style: TextStyle(
                  fontFamily: 'Muli', fontSize: 14, color: Colors.grey)),
          Padding(padding: EdgeInsets.only(top: 5)),
          Text(_email(),
              style: TextStyle(
                  fontFamily: 'Muli', fontSize: 14, color: Colors.grey)),
          Padding(padding: EdgeInsets.only(top: 50)),
          FlatButton(
            padding: EdgeInsets.all(15),
            color: Colors.red,
            onPressed: () {
              alert(context);
            },
            child: Text(
              'Log Out',
              style: TextStyle(color: Colors.white, fontFamily: 'Muli'),
            ),
          )
        ]),
      ),
    );
  }
}

void alert(BuildContext context) {
  var alertDialog = AlertDialog(
    content: Text(
      "Apakah Anda ingin Keluar?",
      style: TextStyle(fontFamily: 'Muli', fontSize: 14),
    ),
    contentPadding: EdgeInsets.all(30),
    actions: <Widget>[
      FlatButton(
        color: Colors.black26,
        child: Text(
          "Ya",
          style: TextStyle(color: Colors.white, fontFamily: 'Muli', fontSize: 12),
        ),
        onPressed: () {
          
          BlocProvider.of<MainAppBloc>(context).dispatch(LoggedOut());
          Navigator.pop(context);
       
        },
      ),
      RaisedButton(
        color: Colors.red,
        child: Text(
          "Tidak",
          style: TextStyle(color: Colors.white, fontFamily: 'Muli',fontSize: 12),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

Widget _buildTitle(BuildContext context) {
  return new InkWell(
    child: new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Profile',
            style: TextStyle(fontFamily: 'Muli'),
          ),
        ],
      ),
    ),
  );
}
