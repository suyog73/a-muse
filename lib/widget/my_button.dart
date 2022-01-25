// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 144 / 3,
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(24 / 3),
      ),
      child: Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 55 / 3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
