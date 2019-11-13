import 'package:flutter/material.dart';
import './list_home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String navId = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController userController;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Share'),
      ),
      body: Column(
        children: <Widget>[
          Text('List Share'),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Email Address',
              hintStyle: TextStyle(fontSize: 20),
            ),
          ),
          TextField(
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
                  onPressed: () => Navigator.pushNamed(context, ListHomeScreen.navId),
                  color: Theme.of(context).primaryColor,
                  child: Text('Login'),
                ),
              ),
              Container(
                width: 125,
                child: RaisedButton(
                  onPressed: () {  
                  },
                  color: Theme.of(context).accentColor,
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
