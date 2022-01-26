// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/screen/bottom_nav.dart';
import 'package:music_app_work/widget/my_button.dart';
import 'package:music_app_work/widget/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(size.height);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login/back.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 364 / 3),
                Image(
                  image: AssetImage('assets/login/AppLogo.png'),
                  width: 474 / 3,
                ),
                SizedBox(height: 35 / 3),
                Text(
                  'Music App',
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: 80 / 3,
                  ),
                ),
                SizedBox(height: 223 / 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 105 / 3),
                  child: Column(
                    children: [
                      MyTextField(icon: Icons.mail, hintText: 'Email'),
                      SizedBox(height: 45.6 / 3),
                      MyTextField(
                          icon: Icons.lock_rounded, hintText: 'Password'),
                      SizedBox(height: 23.3 / 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: kTextStyle.copyWith(fontSize: 45 / 3),
                          )
                        ],
                      ),
                      SizedBox(height: 151.7 / 3),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNav(),
                              ),
                            );
                          },
                          child: MyButton(
                            text: 'Log In',
                          )),
                      SizedBox(height: 112.7 / 3),
                      Column(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: kTextStyle.copyWith(fontSize: 50 / 3),
                          ),
                          Text(
                            "Sign Up",
                            style: kTextStyle.copyWith(
                              fontSize: 50 / 3,
                              fontWeight: FontWeight.bold,
                              color: kRedColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 74 / 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
