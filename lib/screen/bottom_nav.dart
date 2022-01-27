// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';
import 'package:music_app_work/screen/contest_screen.dart';
import 'package:music_app_work/screen/inbox_screen.dart';
import 'package:music_app_work/screen/profile_screen.dart';
import 'package:music_app_work/screen/room_screen.dart';
import 'package:music_app_work/screen/spotlight_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;

  void onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("index $_index");

    List<Widget> screens = [
      RoomScreen(),
      SpotlightScreen(),
      ContestScreen(),
      InboxScreen(),
      ProfileScreen(),
    ];

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: ImageIcon(
            AssetImage('assets/bottom/room-color.png'),
          ),
          title: ("Home"),
          activeColorPrimary: kRedColor,
          inactiveColorPrimary: Color(0xffB7B7B7),
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(
            AssetImage('assets/bottom/spotlight.png'),
          ),
          title: ("Spotlight"),
          activeColorPrimary: kRedColor,
          inactiveColorPrimary: Color(0xffB7B7B7),
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(
            AssetImage('assets/bottom/contest.png'),
          ),
          title: ("Contest"),
          activeColorPrimary: kRedColor,
          inactiveColorPrimary: Color(0xffB7B7B7),
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(
            AssetImage('assets/bottom/inbox.png'),
          ),
          title: ("Inbox"),
          activeColorPrimary: kRedColor,
          inactiveColorPrimary: Color(0xffB7B7B7),
        ),
        PersistentBottomNavBarItem(
          contentPadding: 0,
          icon: ImageIcon(
            AssetImage('assets/bottom/profile.png'),
          ),
          title: ("Profile"),
          activeColorPrimary: kRedColor,
          inactiveColorPrimary: Color(0xffB7B7B7),
        ),
      ];
    }

    bool showNav = Provider.of<BottomNavProvider>(context).isNav;

    return Scaffold(
      body: PersistentTabView(context,
          screens: screens,
          navBarHeight: 190 / 3,
          hideNavigationBar: !showNav,
          controller: _controller,
          items: _navBarsItems(),
          backgroundColor: Color(0xff1A2025),
          navBarStyle:
              NavBarStyle.style6 // Choose the nav bar style with this property.
          ),
    );

    // return Scaffold(
    //   key: _drawerKey,
    //   drawer: MyAppDrawer(),
    //   backgroundColor: Colors.black,
    //   bottomNavigationBar: SizedBox(
    //     height: 190 / 3,
    //     child: BottomNavigationBar(
    //       type: BottomNavigationBarType.fixed,
    //       currentIndex: _index,
    //       onTap: (index) => onItemTap(index),
    //       backgroundColor: Color(0xff1A2025),
    //       selectedItemColor: kRedColor,
    //       unselectedItemColor: Color(0xffB7B7B7),
    //       selectedFontSize: 29.97 / 3,
    //       unselectedFontSize: 29.97 / 3,
    //       selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    //       unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    //       items: [
    //         BottomNavigationBarItem(
    //           icon: Padding(
    //             padding: const EdgeInsets.only(bottom: 10.8 / 3),
    //             child: ImageIcon(
    //               AssetImage('assets/bottom/room-color.png'),
    //             ),
    //           ),
    //           label: 'Room',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Padding(
    //             padding: const EdgeInsets.only(bottom: 10.8 / 3),
    //             child: ImageIcon(
    //               AssetImage('assets/bottom/spotlight.png'),
    //             ),
    //           ),
    //           label: 'Spotlight',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Padding(
    //             padding: const EdgeInsets.only(bottom: 10.8 / 3),
    //             child: ImageIcon(
    //               AssetImage('assets/bottom/contest.png'),
    //             ),
    //           ),
    //           label: 'Contest',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Padding(
    //             padding: const EdgeInsets.only(bottom: 10.8 / 3),
    //             child: ImageIcon(
    //               AssetImage('assets/bottom/inbox.png'),
    //             ),
    //           ),
    //           label: 'Inbox',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Padding(
    //             padding: const EdgeInsets.only(bottom: 10.8 / 3),
    //             child: ImageIcon(
    //               AssetImage('assets/bottom/profile.png'),
    //             ),
    //           ),
    //           label: 'Profile',
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: screens[_index],
    // );
  }
}
