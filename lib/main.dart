import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final2/amplifyconfiguration.dart';
import 'package:final2/frontpage.dart';
import 'package:final2/homepage.dart';
import 'package:final2/login_page.dart';
import 'package:final2/providers.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatefulHookWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Icons.home,
          nextScreen: FrontPage(),
          splashTransition: SplashTransition.sizeTransition,
          backgroundColor: Colors.amber,
          duration: 30000,
        ));
  }
}
