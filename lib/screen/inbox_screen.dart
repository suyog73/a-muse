// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';
import 'package:music_app_work/widget/my_app_drawer.dart';
import 'package:music_app_work/widget/my_inbox_row.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpened) {
        Provider.of<BottomNavProvider>(context, listen: false)
            .changeNavStatus(isOpened);
      },
      key: _drawerKey,
      drawer: MyAppDrawer(),
      backgroundColor: Colors.black,
      body: Padding(
        padding: kPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _drawerKey.currentState!.openDrawer();
                    },
                    child: Image(
                      image: AssetImage('assets/room/menu.png'),
                      width: 48 / 3,
                    ),
                  ),
                  Text(
                    'Inbox',
                    style: TextStyle(
                      fontSize: 60 / 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.search_sharp, color: Colors.white),
                ],
              ),
              SizedBox(height: 130 / 3),
              MyInboxRow(
                textH: 'Welcome Back...',
                text:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                isProfile: false,
              ),
              SizedBox(height: 66 / 3),
              Divider(color: Colors.grey.shade800),
              SizedBox(height: 66 / 3),
              MyInboxRow(
                textH: 'The lyrics you submitted',
                text:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                image: '2',
              ),
              SizedBox(height: 66 / 3),
              Divider(color: Colors.grey.shade800),
              SizedBox(height: 66 / 3),
              MyInboxRow(
                textH: 'Update playlist',
                text:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                image: '3',
              ),
              SizedBox(height: 66 / 3),
              Divider(color: Colors.grey.shade800),
              SizedBox(height: 66 / 3),
            ],
          ),
        ),
      ),
    );
  }
}
