// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.hintText, required this.icon})
      : super(key: key);
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: kTextStyle.copyWith(fontSize: 50 / 3),
        ),
        SizedBox(height: 27 / 3),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24 / 3),
                color: Colors.black,
                border: Border.all(color: Colors.grey.shade600),
              ),
            ),
            TextFormField(
              style: kTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 50 / 3,
              ),
              decoration: kTextFormFieldAuthDec.copyWith(
                hintText: 'Emails',
                prefixIcon: Icon(icon, color: kRedColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
