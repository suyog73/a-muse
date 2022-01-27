// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';
import 'package:music_app_work/screen/my_song_screen.dart';
import 'package:music_app_work/screen/setting_screen.dart';
import 'package:provider/provider.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key, this.select = -1}) : super(key: key);

  final int select;

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.select != -1) {
      setState(() {
        selected = widget.select;
      });
    }
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      width: 880 / 3,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 78.8 / 3),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 148 / 3),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kRedColor, width: 3),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image(
                    image: AssetImage('assets/drawer/profile.png'),
                    width: 224 / 3,
                    height: 224 / 3,
                  ),
                ),
              ),
              SizedBox(height: 27.3 / 3),
              Text(
                'Lana Del Rey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 54 / 3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 7 / 3),
              Text(
                '@lanaroy',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 42 / 3,
                ),
              ),
              SizedBox(height: 163 / 3),
              InkWell(
                // onTap: () {
                //   setState(() {
                //     selected = 0;
                //   });
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => BottomNav(),
                //     ),
                //   );
                // },
                child: DrawerMenu(
                  text: 'Home',
                  image: 'home',
                  color:
                      selected == 0 ? kRedColor : Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 132 / 3),
              InkWell(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                  Provider.of<BottomNavProvider>(context, listen: false)
                      .changeNavStatus(false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySongScreen(),
                    ),
                  );
                },
                child: DrawerMenu(
                  text: 'My Songs',
                  image: 'music',
                  isRequire: true,
                  value: '212',
                  color:
                      selected == 1 ? kRedColor : Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 132 / 3),
              DrawerMenu(
                text: 'Video Feed',
                image: 'video',
                color:
                    selected == 2 ? kRedColor : Colors.white.withOpacity(0.5),
              ),
              SizedBox(height: 132 / 3),
              DrawerMenu(
                text: 'Notifications',
                image: 'bell',
                isRequire: true,
                value: '09',
                color:
                    selected == 3 ? kRedColor : Colors.white.withOpacity(0.5),
              ),
              SizedBox(height: 132 / 3),
              InkWell(
                onTap: () {
                  setState(() {
                    selected = 4;
                  });
                  Provider.of<BottomNavProvider>(context, listen: false)
                      .changeNavStatus(false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ),
                  );
                },
                child: DrawerMenu(
                  text: 'Setting',
                  image: 'setting',
                  color:
                      selected == 4 ? kRedColor : Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 132 / 3),
              DrawerMenu(text: 'Log Out', image: 'log'),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
    required this.text,
    required this.image,
    this.color = Colors.white,
    this.isRequire = false,
    this.value = '',
  }) : super(key: key);

  final String text, image, value;
  final Color color;
  final bool isRequire;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage('assets/drawer/$image.png'),
              color: color == Colors.white ? color.withOpacity(0.5) : color,
              width: 60 / 3,
              height: 56 / 3,
            ),
            SizedBox(width: 81.3 / 3),
            Text(
              text,
              style: TextStyle(
                color: color == Colors.white ? color.withOpacity(0.5) : color,
                fontSize: 52 / 3,
              ),
            )
          ],
        ),
        if (isRequire)
          Container(
            alignment: Alignment.center,
            width: 128.3 / 3,
            height: 67.1 / 3,
            decoration: BoxDecoration(
              color: kRedColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42 / 3,
              ),
            ),
          ),
      ],
    );
  }
}
