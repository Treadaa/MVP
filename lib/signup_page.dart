import 'package:final2/confirmation_page.dart';
import 'package:final2/services/authservice.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String username, password, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: 300.0,
              width: MediaQuery.of(context).size.width - 30.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7))],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Username'),
                    onChanged: (val) {
                      setState(() {
                        username = val;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                      onPressed: () {
                        AuthService().signUp(email, username, password, context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder:(context)=>ConfirmationPage()
                        ));
                      },
                      child: Center(child: Text('SIGN UP')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
