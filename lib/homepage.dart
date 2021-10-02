import 'package:final2/providers.dart';
import 'package:final2/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userSignedIn;
  @override
  Widget build(BuildContext context) {
    userSignedIn = useProvider(userLoggedInProvider);
    return Scaffold(
      body: Center(
        child: Container(
          height: 30,
          width: 100.0,
          child: ElevatedButton(
            onPressed: () {
              AuthService().signOut(context, userSignedIn);
            },
            child: Center(child: Text('SIGN OUT')),
          ),
        ),
      ),
    );
  }
}
