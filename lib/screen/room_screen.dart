// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/widget/my_text_field.dart';

var kLocalTextStyle = TextStyle(
  fontSize: 54 / 3,
  fontWeight: FontWeight.w600,
);

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  int _index = 2;
  List<String> title = [
    'Room',
    'Songs',
    'Video Feed',
    'Video Feed',
    'Video Feed',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50 / 3)
                  .copyWith(top: 123 / 3),
              child: DefaultTabController(
                length: 5,
                initialIndex: 2,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage('assets/room/menu.png'),
                            width: 48 / 3,
                          ),
                          Text(
                            title[_index],
                            style: kTextStyle.copyWith(
                              fontSize: 60 / 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.search_sharp, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 77 / 3),
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        labelColor: kRedColor,
                        tabs: [
                          Text('All', style: kLocalTextStyle),
                          Text('Songs', style: kLocalTextStyle),
                          Text('Videos', style: kLocalTextStyle),
                          Text('Artist', style: kLocalTextStyle),
                          Text('Album', style: kLocalTextStyle)
                        ],
                        onTap: (val) {
                          setState(() {
                            _index = val;
                          });
                        },
                      ),
                      SizedBox(height: 36 / 3),
                      MyTextField(
                        hintText: 'Search',
                        isRequire: false,
                        icon: Icons.search_sharp,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(height: 57 / 3),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(child: allWidget(context)),
                            SingleChildScrollView(child: songsWidget(context)),
                            SingleChildScrollView(child: videosWidget(context)),
                            SingleChildScrollView(
                                child: artistsWidget(context)),
                            SingleChildScrollView(child: albumsWidget(context)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
    required this.src,
    this.width = 444,
    this.height = 367,
    required this.text,
    this.isPlay = true,
  }) : super(key: key);

  final String image, src, text;
  final double width, height;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/$src/$image.png'),
              width: width / 3,
              height: height / 3,
              fit: BoxFit.fill,
            ),
            if (isPlay)
              Image(
                image: AssetImage('assets/$src/play.png'),
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
            fontWeight: FontWeight.w500,
            fontSize: 45 / 3,
          ),
        ),
      ],
    );
  }
}

Widget allWidget(BuildContext context) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Image(
          image: AssetImage('assets/room/banner.png'),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(height: 55 / 3),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Popular',
                style: kTextStyle.copyWith(
                  color: kRedColor,
                  fontSize: 50 / 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'View All',
                style: kTextStyle.copyWith(fontSize: 40 / 3),
              )
            ],
          ),
          SizedBox(height: 43.5 / 3),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyStack(image: 'a1', src: 'room', text: 'Sam Cook Live'),
                MyStack(image: 'a2', src: 'room', text: 'YG Throw Your Set'),
                MyStack(image: 'a3', src: 'room', text: 'Elli Mai Interview'),
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
                'Most Popular',
                style: kTextStyle.copyWith(
                  color: kRedColor,
                  fontSize: 50 / 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'View All',
                style: kTextStyle.copyWith(fontSize: 40 / 3),
              )
            ],
          ),
          SizedBox(height: 43.5 / 3),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyStack(image: 'b1', src: 'room', text: 'Sam Cook Live'),
                MyStack(image: 'b2', src: 'room', text: 'YG Throw Your Set'),
                MyStack(image: 'b3', src: 'room', text: 'Elli Mai Interview'),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget songsWidget(BuildContext context) {
  return Column(children: []);
}

Widget videosWidget(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyStack(
            image: 'a1',
            src: 'video',
            width: 500,
            height: 412,
            text: 'Sam Cook Live',
          ),
          MyStack(
            image: 'a2',
            src: 'video',
            width: 500,
            height: 412,
            text: 'YG Throw Your Set',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyStack(
            image: 'b1',
            src: 'video',
            width: 500,
            height: 412,
            text: 'Shine Bright Like...',
          ),
          MyStack(
            image: 'b2',
            src: 'video',
            width: 500,
            height: 412,
            text: 'Rolling Into Deep',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyStack(
            image: 'c1',
            src: 'video',
            width: 500,
            height: 412,
            text: 'Just Beat It',
          ),
          MyStack(
            image: 'c3',
            src: 'video',
            width: 500,
            height: 412,
            text: 'YG Throw Your Set',
          ),
        ],
      ),
    ],
  );
}

Widget artistsWidget(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyStack(
            image: 'a1',
            src: 'artist',
            width: 500,
            height: 412,
            text: 'Taylor Swift',
            isPlay: false,
          ),
          MyStack(
            image: 'a2',
            src: 'artist',
            width: 500,
            height: 412,
            text: 'Ariana Grande',
            isPlay: false,
          ),
        ],
      ),
      SizedBox(height: 44 / 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyStack(
            image: 'b1',
            src: 'artist',
            width: 500,
            height: 412,
            text: 'Ed Sheeran',
            isPlay: false,
          ),
          MyStack(
            image: 'b2',
            src: 'artist',
            width: 500,
            height: 412,
            text: 'Billie Eilish',
            isPlay: false,
          ),
        ],
      ),
      SizedBox(height: 44 / 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyStack(
            image: 'c1',
            src: 'artist',
            width: 500,
            height: 412,
            text: 'Just Beat It',
            isPlay: false,
          ),
          MyStack(
            image: 'c2',
            src: 'artist',
            width: 500,
            height: 412,
            text: 'YG Throw Your Set',
            isPlay: false,
          ),
        ],
      ),
    ],
  );
}

Widget albumsWidget(BuildContext context) {
  return Column(children: []);
}
