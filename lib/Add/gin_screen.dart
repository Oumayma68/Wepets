import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wepets/res/custom_colors.dart';
import 'package:wepets/widgets/login_form.dart';

class ginScreen extends StatefulWidget {
  @override
  _ginScreenState createState() => _ginScreenState();
}

class _ginScreenState extends State<ginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  /// 1- to Define _initializeFirebase()  inside class LoginScreen that will initialize the firebase.
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        /// 2- to keep the size, when opening the keyboard to avoid error ///
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.white,

        /// 3- ui of LoginScreen ///
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,

                        /// 4- change name of image that copied to your assets file ///
                        child: Image.asset(
                          'assets/images/splash_2.png',
                          height: 200
                          ,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),

                ///  5- FutureBuilder, call the _initializeFirebase() method, which will show the LoginForm widget when the initialization is complete and open app ///
                FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return LoginForm(focusNode: _uidFocusNode);
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xff47ccc5)
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

