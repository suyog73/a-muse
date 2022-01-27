// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';
import 'package:music_app_work/widget/my_app_drawer.dart';
import 'package:provider/provider.dart';

class SpotlightScreen extends StatefulWidget {
  const SpotlightScreen({Key? key}) : super(key: key);

  @override
  State<SpotlightScreen> createState() => _SpotlightScreenState();
}

class _SpotlightScreenState extends State<SpotlightScreen> {
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                      'Spotlight',
                      style: TextStyle(
                        fontSize: 60 / 3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.search_sharp, color: Colors.white),
                  ],
                ),
                SizedBox(height: 100 / 3),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: AssetImage('assets/spotlight/banner.png'),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 8.5 / 3),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending',
                              style: kTextStyle.copyWith(
                                color: kRedColor,
                                fontSize: 50 / 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'View All',
                              style: kTextStyle.copyWith(
                                fontSize: 40 / 3,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 43.5 / 3),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              MyStack(image: 'a1', text: 'Selena Gomez'),
                              SizedBox(width: 41 / 3),
                              MyStack(image: 'a2', text: 'Taylor Swift'),
                              SizedBox(width: 41 / 3),
                              MyStack(image: 'a3', text: 'Justin Bieber'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 78 / 3),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recent Views',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 50 / 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 40 / 3,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 43.5 / 3),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              MyStack(image: 'b1', text: 'Save your tears'),
                              SizedBox(width: 41 / 3),
                              MyStack(image: 'b2', text: 'Best Friend'),
                              SizedBox(width: 41 / 3),
                              MyStack(image: 'b3', text: 'Ellia Mai Interview'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 55 / 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({
    Key? key,
    required this.image,
    this.width = 444,
    this.height = 367,
    required this.text,
  }) : super(key: key);

  final String image, text;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/spotlight/$image.png'),
              width: width / 3,
              height: height / 3,
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('assets/spotlight/play.png'),
              width: 99 / 3,
              height: 99 / 3,
              fit: BoxFit.fill,
            ),
          ],
        ),
        SizedBox(height: 32 / 3),
        Text(
          text,
          style: kTextStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 45 / 3,
          ),
        ),
      ],
    );
  }
}
