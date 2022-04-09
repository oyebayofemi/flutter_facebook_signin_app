import 'package:facebook_signin_app/homepage.dart';
import 'package:facebook_signin_app/loading.dart';
import 'package:facebook_signin_app/main.dart';
import 'package:facebook_signin_app/main_page.dart';
import 'package:facebook_signin_app/provider/facebook_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FacebookSignInProvider>(builder: (context, model, child) {
      if (model.isSigningIn) {
        return Loading();
      } else if (model.userModels != null) {
        return MainPage(model);
      } else {
        return MyHomePage();
      }
    });
  }
}
