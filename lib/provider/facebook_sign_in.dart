import 'package:facebook_signin_app/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInProvider extends ChangeNotifier {
  late bool _isSigningIn;
  FacebookSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  UserModel? userModels;

  Future<UserCredential?> signInWithFacebook() async {
    isSigningIn = true;
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.i
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    if (loginResult != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // final data = await FacebookAuth.i.getUserData(fields: 'email,name,picture');

      // Once signed in, return the UserCredential
      final result = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      print(result.user?.displayName);

      final data =
          await FacebookAuth.i.getUserData(fields: 'email,name,picture');

      userModels = UserModel.fromJson(data);
      //print(model.name);
      isSigningIn = false;
      notifyListeners();
    } else {
      isSigningIn = true;
      return null;
    }

    // Create a credential from the access token
  }

  Future signout() async {
    await FacebookAuth.i.logOut();
    userModels = null;
    notifyListeners();
  }
}
