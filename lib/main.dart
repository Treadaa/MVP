import 'package:final2/amplifyconfiguration.dart';
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
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulHookWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userLoggedIn;
  bool _amplifyConfigured = false;
  bool checkAuthStatus = false;
  late AmplifyAuthCognito auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;
    auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);
    try {
      Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Already configured");
    }

    try {
      getUserStatus();
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    userLoggedIn = useProvider(userLoggedInProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('TREADAA'),
            centerTitle: true,
          ),
          body: _amplifyConfigured
              ? checkAuthStatus
                  ? userLoggedIn.getUserCurrentState()
                      ? HomePage()
                      : LoginPage()
                  : Text('Loading')
              : Text('Loading')),
      // ignore: empty_statements
    );
  }

  getUserStatus() {
    handleAuth().then((val) {
      if (val.isSignedIn) {
        userLoggedIn.setCurrentState(val.isSignedIn);
        setState(() {
          checkAuthStatus = true;
        });
      } else {
        setState(() {
          checkAuthStatus = true;
        });
        return LoginPage();
      }
    });
  }

  handleAuth() async {
    var authStatus = await auth.fetchAuthSession();
    return authStatus;
  }
}
