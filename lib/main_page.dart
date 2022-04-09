import 'package:facebook_signin_app/models/userModel.dart';
import 'package:facebook_signin_app/provider/facebook_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  FacebookSignInProvider model;
  MainPage(FacebookSignInProvider this.model);

  @override
  Widget build(BuildContext context) {
    // final currentUser = FirebaseAuth.instance.currentUser;
    // String? name = currentUser!.displayName;

    String photoURL = model.userModels?.pictureModel?.url as String;
    String name = model.userModels?.name as String;
    String email = model.userModels?.email as String;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LoggedIN'),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(photoURL),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Name: ${name}'),
            SizedBox(
              height: 20,
            ),
            Text('Email: ${email}'),
            SizedBox(
              height: 40,
            ),
            FlatButton.icon(
                color: Colors.yellow,
                onPressed: () async {
                  final auth = Provider.of<FacebookSignInProvider>(context,
                      listen: false);
                  auth.signout();
                },
                icon: Icon(Icons.logout_outlined),
                label: Text('Loggout'))
          ],
        ),
      ),
    );
  }
}
