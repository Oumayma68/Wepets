import 'package:wepets/screen/login_screen.dart';
import 'package:wepets/screen/registration_screen.dart';
import 'package:flutter/widgets.dart';
//import 'package:shop_app/screens/home/home_screen.dart';
import 'package:wepets/screens/pets_page/principal.dart';
import 'package:wepets/screen/login_screen.dart';
import 'package:wepets/screens/splash/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wepets/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegistrationScreen.routeName: (context) => RegistrationScreen(),
};
