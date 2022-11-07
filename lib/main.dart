import 'package:flutter/material.dart';
import 'package:wepets/routes.dart';
//import 'package:pets_app/screens/profile/profile_screen.dart';
import 'package:wepets/screens/splash/splash_screen.dart';
import 'package:wepets/theme.dart';
import 'package:wepets/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,

    );
  }
}
