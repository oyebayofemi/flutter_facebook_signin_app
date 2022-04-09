import 'package:facebook_signin_app/homepage.dart';
import 'package:facebook_signin_app/provider/facebook_sign_in.dart';
import 'package:facebook_signin_app/themes.dart';
import 'package:facebook_signin_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FacebookSignInProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        darkTheme: CustomTheme.darkTheme,
        theme: CustomTheme.lightTheme,
      ),
    );
  }
}
