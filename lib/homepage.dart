import 'package:facebook_signin_app/provider/facebook_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(),
            Text('Welcome'),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  final provider = Provider.of<FacebookSignInProvider>(context,
                      listen: false);
                  provider.signInWithFacebook();
                },
                child: Text('Signin with Facebook')),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
