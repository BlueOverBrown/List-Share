import 'package:flutter/material.dart';
import 'package:list_share/screens/list_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import './list_home.dart';

class WelcomeScreen extends StatefulWidget {
  static const String navId = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController emailController;
  TextEditingController passwordController;
  String email;
  String password;
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Share'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: <Widget>[
              Text('List Share'),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 125,
                    child: RaisedButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, ListHome.navId);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                  Container(
                    width: 125,
                    child: RaisedButton(
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, ListHome.navId);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Theme.of(context).accentColor,
                      child: Text('Register'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
