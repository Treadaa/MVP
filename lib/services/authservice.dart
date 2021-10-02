import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:final2/confirmation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  signUp(email, username, password, context) async {
    try {
      Map<String, String> userAttributes = {'email': email};
      Amplify.Auth.signUp(
              username: username,
              password: password,
              options: CognitoSignUpOptions(userAttributes: userAttributes))
          .then((value) => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                          username: username,
                        )))
              });
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  // Confirm User
  confirmUser(username, confirmationCode, context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: confirmationCode);
      if (res.isSignUpComplete) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  signIn(username, password, userSignedIn) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: username, password: password);
      userSignedIn.setUserCurrentState(res.isSignedIn);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  // Sign Out
  signOut(context, userSignedIn) async {
    SignOutResult res = await Amplify.Auth.signOut();
    userSignedIn.setUserCurrentState(false);
  }
}
