import 'package:wepets/screen/login_screen.dart';
import 'package:wepets/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:wepets/constants.dart';
import 'package:wepets/screen/login_screen.dart';
import 'package:wepets/size_config.dart';
import 'package:wepets/screen/registration_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wepets/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to WePets!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people find a Pet to adopt",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to connect with a pet owner. \nJust search with our app",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(

      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 5),
                      DefaultButton(
                        text: "Sign In",
                        press: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      ),

                      SizedBox(height: 20),
                      DefaultButton(
                        text: "Sign Up",
                        press: () {
                          Navigator.pushNamed(context, RegistrationScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
