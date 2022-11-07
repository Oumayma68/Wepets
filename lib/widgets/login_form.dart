import 'package:wepets/Add/dashboard_screen.dart';
import 'package:wepets/res/custom_colors.dart';
import 'package:wepets/utils/database.dart';
import 'package:wepets/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:wepets/res/custom_colors.dart';
import 'package:wepets/Add/dashboard_screen.dart';
import 'package:wepets/utils/database.dart';
import 'package:wepets/utils/validator.dart';

import 'custom_form_field.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  const LoginForm({
    Key? key,
    required this.focusNode,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _uidController = TextEditingController();

  final _loginInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// 1- ui of LoginForm ///
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              children: [
                CustomFormField(
                  controller: _uidController,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateUserID(
                    uid: value,
                  ),
                  label: 'Your Firstname & your last name',
                  hint: 'Enter your credentials',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff47ccc5),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),

                /// 2- code navigator to DashboardScreen after inter idDocs and click login ///
                onPressed: () {
                  widget.focusNode.unfocus();

                  if (_loginInFormKey.currentState!.validate()) {
                    Database.idDocs = _uidController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Go Ahead',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.firebaseWhite,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

