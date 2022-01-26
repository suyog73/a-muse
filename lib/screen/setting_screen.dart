// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/widget/my_app_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Scaffold(
      key: _drawerKey,
      drawer: MyAppDrawer(isInside: true, select: 4),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50 / 3)
            .copyWith(top: 123 / 3),
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
                  'Settings',
                  style: TextStyle(
                    fontSize: 60 / 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.search_sharp, color: Colors.white),
              ],
            ),
            SizedBox(height: 151 / 3),
            MySettingRow(text: 'Edit Profile'),
            SizedBox(height: 84 / 3),
            MySettingRow(text: 'Change Password'),
            SizedBox(height: 84 / 3),
            MySettingRow(text: 'Change Language'),
            SizedBox(height: 84 / 3),
            MySettingRow(text: 'Equalize'),
            SizedBox(height: 172 / 3),
            MySettingRow(
                text: 'Receive notifications', isSwitch: true, isOn: true),
            SizedBox(height: 84 / 3),
            MySettingRow(text: 'Receive newsletters', isSwitch: true),
          ],
        ),
      ),
    );
  }
}

class MySettingRow extends StatefulWidget {
  const MySettingRow({
    Key? key,
    required this.text,
    this.isSwitch = false,
    this.isOn = false,
  }) : super(key: key);

  final String text;
  final bool isSwitch, isOn;

  @override
  State<MySettingRow> createState() => _MySettingRowState();
}

class _MySettingRowState extends State<MySettingRow> {
  bool _switchValue = true;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 56 / 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!widget.isSwitch)
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white.withOpacity(0.5),
              )
            else
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  trackColor: _switchValue ? kRedColor : Color(0xff3B3B3B),
                  value: _switchValue,
                  thumbColor: _switchValue ? Colors.white : kRedColor,
                  activeColor: _switchValue ? kRedColor : Colors.white,
                  onChanged: (value) {
                    setState(
                      () {
                        _switchValue = value;
                      },
                    );
                  },
                ),
              ),
          ],
        ),
        SizedBox(height: 40 / 3),
        Divider(color: Colors.white.withOpacity(0.4)),
      ],
    );
  }
}
