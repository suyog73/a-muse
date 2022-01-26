// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/screen/contest_screen.dart';
import 'package:music_app_work/screen/inbox_screen.dart';
import 'package:music_app_work/screen/my_song_screen.dart';
import 'package:music_app_work/screen/profile_screen.dart';
import 'package:music_app_work/screen/room_screen.dart';
import 'package:music_app_work/screen/setting_screen.dart';
import 'package:music_app_work/screen/spotlight_screen.dart';
import 'package:music_app_work/widget/my_app_drawer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, this.newIndex = -1}) : super(key: key);

  final int newIndex;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  int _index = 0;

  void onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      RoomScreen(drawerKey: _drawerKey),
      SpotlightScreen(drawerKey: _drawerKey),
      ContestScreen(drawerKey: _drawerKey),
      InboxScreen(drawerKey: _drawerKey),
      ProfileScreen(drawerKey: _drawerKey),
    ];

    // List<Widget> otherScreen = [
    //   RoomScreen(drawerKey: _drawerKey),
    //   MySongScreen(drawerKey: _drawerKey),
    //   SettingScreen(drawerKey: _drawerKey),
    // ];

    return Scaffold(
        key: _drawerKey,
        drawer: MyAppDrawer(),
        backgroundColor: Colors.black,
        bottomNavigationBar: SizedBox(
          height: 190 / 3,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            onTap: (index) => onItemTap(index),
            backgroundColor: Color(0xff1A2025),
            selectedItemColor: kRedColor,
            unselectedItemColor: Color(0xffB7B7B7),
            selectedFontSize: 29.97 / 3,
            unselectedFontSize: 29.97 / 3,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.8 / 3),
                  child: ImageIcon(
                    AssetImage('assets/bottom/room-color.png'),
                  ),
                ),
                label: 'Room',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.8 / 3),
                  child: ImageIcon(
                    AssetImage('assets/bottom/spotlight.png'),
                  ),
                ),
                label: 'Spotlight',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.8 / 3),
                  child: ImageIcon(
                    AssetImage('assets/bottom/contest.png'),
                  ),
                ),
                label: 'Contest',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.8 / 3),
                  child: ImageIcon(
                    AssetImage('assets/bottom/inbox.png'),
                  ),
                ),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.8 / 3),
                  child: ImageIcon(
                    AssetImage('assets/bottom/profile.png'),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body:
            // widget.newIndex == -1
            //     ?
            screens[_index]
        // : otherScreen[widget.newIndex],
        );
  }
}
