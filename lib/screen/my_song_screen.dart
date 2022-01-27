// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';
import 'package:music_app_work/widget/my_app_drawer.dart';
import 'package:music_app_work/widget/my_text_field.dart';
import 'package:provider/provider.dart';

class MySongScreen extends StatelessWidget {
  const MySongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Scaffold(
      onDrawerChanged: (isOpened) {
        Provider.of<BottomNavProvider>(context, listen: false)
            .changeNavStatus(isOpened);
      },
      key: _drawerKey,
      drawer: MyAppDrawer(select: 1),
      backgroundColor: Colors.black,
      body: Padding(
        padding: kPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    Provider.of<BottomNavProvider>(context, listen: false)
                        .changeNavStatus(true);
                  },
                  child: Image(
                    image: AssetImage('assets/room/menu.png'),
                    width: 48 / 3,
                  ),
                ),
                Text(
                  'My Songs',
                  style: TextStyle(
                    fontSize: 60 / 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.search_sharp, color: Colors.white),
              ],
            ),
            SizedBox(height: 66 / 3),
            MyTextField(
              hintText: 'Search',
              isRequire: false,
              icon: Icons.search_sharp,
              color: Colors.white.withOpacity(0.5),
            ),
            SizedBox(height: 44 / 3),
            Row(
              children: [
                Text(
                  'Songs',
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: 60 / 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' (242)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60 / 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 51 / 3),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MySongWidget(
                      image: '1',
                      sub: 'The calling',
                      title: 'Wherever You Will Go',
                      time: '3:54',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '2',
                      sub: 'Taylor Swift',
                      title: 'Blank Space',
                      time: '4:07',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '3',
                      sub: 'Eminem',
                      title: 'Not Afraid',
                      time: '3:29',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '4',
                      sub: 'Maroon 5',
                      title: 'Animals',
                      time: '4:25',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '1',
                      sub: 'The calling',
                      title: 'Wherever You Will Go',
                      time: '3:54',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '2',
                      sub: 'Taylor Swift',
                      title: 'Blank Space',
                      time: '4:07',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '3',
                      sub: 'Eminem',
                      title: 'Not Afraid',
                      time: '3:29',
                    ),
                    SizedBox(height: 35 / 3),
                    MySongWidget(
                      image: '4',
                      sub: 'Maroon 5',
                      title: 'Animals',
                      time: '4:25',
                    ),
                    SizedBox(height: 35 / 3),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySongWidget extends StatelessWidget {
  const MySongWidget({
    Key? key,
    required this.title,
    required this.sub,
    required this.time,
    required this.image,
  }) : super(key: key);

  final String title, sub, time, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: AssetImage('assets/mysong/$image.png'),
              width: 176 / 3,
              height: 176 / 3,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 56.3 / 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48 / 3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$sub  $time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36 / 3,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 35 / 3),
        Divider(color: Colors.white.withOpacity(0.3)),
      ],
    );
  }
}
