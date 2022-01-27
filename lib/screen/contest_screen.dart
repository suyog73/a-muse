// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({Key? key, required this.drawerKey}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    String description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500";

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    drawerKey.currentState!.openDrawer();
                  },
                  child: Image(
                    image: AssetImage('assets/room/menu.png'),
                    width: 48 / 3,
                  ),
                ),
                Text(
                  'Contest',
                  style: TextStyle(
                    fontSize: 60 / 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.search_sharp, color: Colors.white),
              ],
            ),
            SizedBox(height: 84 / 3),
            Text(
              'Upcoming Contest',
              style: TextStyle(
                color: kRedColor,
                fontSize: 50 / 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 42.4 / 3),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/contest/l.png'),
                    width: 922.5 / 3,
                    height: 520.2 / 3,
                  ),
                  SizedBox(width: 51.7 / 3),
                  Image(
                    image: AssetImage('assets/contest/1.png'),
                    width: 922.5 / 3,
                    height: 520.2 / 3,
                  ),
                  SizedBox(width: 51.7 / 3),
                  Image(
                    image: AssetImage('assets/contest/r.png'),
                    width: 922.5 / 3,
                    height: 520.2 / 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.4 / 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Contest',
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: 50 / 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 40 / 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 43.5 / 3),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyContestWidget(
                      image: '11',
                      title: 'Who’s Next smoovel',
                      subTitle: description,
                    ),
                    SizedBox(height: 82 / 3),
                    MyContestWidget(
                      image: '22',
                      title: 'I Heart Radio',
                      subTitle: description,
                    ),
                    SizedBox(height: 82 / 3),
                    MyContestWidget(
                      image: '33',
                      title: 'Rising Star',
                      subTitle: description,
                    ),
                    SizedBox(height: 82 / 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContestWidget extends StatelessWidget {
  const MyContestWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);
  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage('assets/contest/$image.png'),
          width: 367 / 3,
          height: 367 / 3,
        ),
        SizedBox(width: 57.3 / 3),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 52 / 3,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 21.6 / 3),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                subTitle,
                style: TextStyle(
                  color: Color(0xffB7B7B7),
                  fontSize: 36 / 3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
