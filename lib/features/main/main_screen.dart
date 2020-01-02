import 'package:flutter/material.dart';
import 'package:marketing_apps/features/main/data_sekolah/data_sekolah_screen.dart';
import 'package:marketing_apps/features/main/profile/profile.dart';
import 'package:marketing_apps/features/main/tambah_data/tambah_data_screen.dart';
import 'package:marketing_apps/utils/colors.dart';
import 'package:marketing_apps/utils/text_style.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    new DataSekolahScreen(),
    new TambahDataScreen(),
    new ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,
          elevation: 9.0,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.school,
                ),
                title: Text(
                  'Data Sekolah',
                  style: MarketingText().fontNormal().copyWith(
                      color: _selectedPage == 0
                          ? MarketingColors.primaryColor
                          : Colors.grey[1000]),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text(
                  'Tambah Data',
                  style: MarketingText().fontNormal().copyWith(
                      color: _selectedPage == 1
                          ? MarketingColors.primaryColor
                          : Colors.grey[1000]),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: MarketingText().fontNormal().copyWith(
                      color: _selectedPage == 2
                          ? MarketingColors.primaryColor
                          : Colors.grey[1000]),
                )),
          ]),
    );
  }
}
