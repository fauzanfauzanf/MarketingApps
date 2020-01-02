import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketing_apps/features/main/data_sekolah/detailScreen.dart';
import 'package:marketing_apps/features/main/data_sekolah/user.dart';
import 'package:marketing_apps/features/main/main_screen.dart';

class DataSekolahScreen extends StatefulWidget {
  @override
  _DataSekolahScreenState createState() => _DataSekolahScreenState();
}

class _DataSekolahScreenState extends State<DataSekolahScreen>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  Future _data;

  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("datasekolah").getDocuments();
    print(qn.documents[0].documentID);
    return qn.documents;
  }

  // // instance of util class
  // FirebaseDatabaseUtil databaseUtil;

  TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "Search Query";

  @override
  void initState() {
    super.initState();
    _data = getPosts();
    // databaseUtil = new FirebaseDatabaseUtil();
    // databaseUtil.initState();
    _searchQuery = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    // databaseUtil.dispose();
  }

  void _startSearch() {
    print("Buka Search Box");
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("Tutup Search Box");
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search Query");
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
              'Data Sekolah',
              style: TextStyle(fontFamily: 'Muli'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
    print("search query " + newQuery);
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailScreen(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: new AppBar(
        leading: _isSearching ? const BackButton() : null,
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
        elevation: 0.5,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5, right: 5, left: 5),
        child: RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: FutureBuilder(
            future: _data,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    if (snapshot.data[index].data['isDeleted'] == 'false') {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              snapshot.data[index].data['nama_sekolah'],
                              style: TextStyle(
                                fontFamily: 'Muli',
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data[index].data['lokasi_foto'],
                              style: TextStyle(
                                  fontFamily: 'Muli',
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                            onTap: () => navigateToDetail(snapshot.data[index]),
                          ),
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: Divider(),
                          ))
                        ],
                      );
                    } else {return Container();}
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  //Get first letter from the name of user
  String getShortName(User user) {
    String shortName = "";
    shortName = user.namaSekolah.substring(0, 1);
    return shortName;
  }

  // //Display popup in user info update mode
  // showEditWidget(User user, bool isEdit){
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) =>
  //     new AddUserDialog().buildAboutDialog(context, this, isEdit, user),
  //   );
  // }
//   //Delete a entry from the Firebase console.
//   deleteUser(User user) {
//     setState(() {
//       databaseUtil.deleteUser(user);
//     });
//   }
// }

}
