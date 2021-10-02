import 'package:final2/providers.dart';
import 'package:final2/services/authservice.dart';
import 'package:final2/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatefulHookWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username, password;

  var userSignedIn;
  @override
  Widget build(BuildContext context) {
    userSignedIn = useProvider(userLoggedInProvider);
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          padding: EdgeInsets.all(8.0),
          height: 300.0,
          width: MediaQuery.of(context).size.width - 30.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7))],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(children: [
            TextFormField(
                decoration: InputDecoration(hintText: "Username"),
                onChanged: (val) {
                  setState(() {
                    username = val;
                  });
                }),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                }),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthService().signIn(username, password, userSignedIn);
                },
                child: Center(
                  child: Text('SIGN IN'),
                )),
            SizedBox(height: 10.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Center(child: Text('SIGN UP')))
          ]))
    ])));
  }
}
