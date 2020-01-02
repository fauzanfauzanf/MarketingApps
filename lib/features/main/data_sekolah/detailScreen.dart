import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marketing_apps/features/main/data_sekolah/user.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:marketing_apps/features/main/main_screen.dart';
import 'package:marketing_apps/features/main/update_data/update_data.dart';
import 'package:cache_image/cache_image.dart';

class DetailScreen extends StatefulWidget {
  final db = Firestore.instance;
  final DocumentSnapshot post;

  DetailScreen({this.post});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  ScrollController scrollController;
  bool dialVisible = true;
  User user;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  // _backgroundImage(){
  //   Image.network(widget.post.data['foto_sekolah']);
  // }
  // navigateToDetail(DocumentSnapshot post) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => UpdateDataScreen(
  //                 post: post,
  //               )));
  // }

  navigateToDataSekolah() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              widget.post.data['nama_sekolah'],
              style: TextStyle(fontSize: 18, fontFamily: 'Muli'),
            ),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: null,
            ),
            pinned: true,
            floating: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                          title: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.school,
                                size: 28,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Text(
                                widget.post.data['nama_sekolah'],
                                style:
                                    TextStyle(fontFamily: 'Muli', fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                              ),
                              Icon(
                                Icons.location_city,
                                size: 28,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Expanded(
                                child: Text(
                                  widget.post.data['lokasi_foto'],
                                  style: TextStyle(
                                      fontFamily: 'Muli', fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Text(
                                widget.post.data['nama_cp'],
                                style:
                                    TextStyle(fontFamily: 'Muli', fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Text(
                                widget.post.data['no_telponcp'],
                                style:
                                    TextStyle(fontFamily: 'Muli', fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 145),
                    ),
                    Text("MarketingApps",
                        style:
                            TextStyle(fontFamily: 'Muli', color: Colors.grey))
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
      floatingActionButton: buildSpeedDial(),
    );
  }

  Widget buildBody() {
    return ListView.builder(
      controller: scrollController,
      itemCount: 30,
      itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      elevation: 0.5,
      backgroundColor: Colors.red,
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
        
        SpeedDialChild(
          child: Icon(Icons.delete, color: Colors.white),
          backgroundColor: Colors.red,
          elevation: 0,
          onTap: () async {
            _showDialogDelete();
          },
          label: 'Hapus',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Muli'),
          labelBackgroundColor: Colors.red,
        ),
      ],
    );
  }

  void _showDialogDelete() {
    final db = Firestore.instance;
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return StreamBuilder<QuerySnapshot>(
            stream: db.collection('datasekolah').snapshots(),
            builder: (context, snapshot) {
              return AlertDialog(
                title: new Text("Anda yakin ingin menghapus data ini?",
                    style: TextStyle(fontFamily: 'Muli', fontSize: 16)),
                content: new Text(
                  "Data tidak dapat Dikembalikan",
                  style: TextStyle(fontFamily: 'Muli', fontSize: 14),
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text(
                      "Hapus",
                      style: TextStyle(color: Colors.red, fontFamily: 'Muli'),
                    ),
                    onPressed: () async {
                      try {
                        await db
                            .collection('datasekolah')
                            .document(widget.post.documentID)
                            .updateData({'isDeleted': 'true'});

                        navigateToDataSekolah();
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  new FlatButton(
                    child: new Text(
                      "Close",
                      style: TextStyle(color: Colors.grey, fontFamily: 'Muli'),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}
