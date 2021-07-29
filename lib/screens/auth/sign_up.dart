import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class SignUp extends StatefulWidget {
  final Function? toggleView;
  const SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Center(child: Text('Sign Up to Brewcrew')),
              elevation: 0,
              backgroundColor: Colors.brown[400],
              actions: [
                TextButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    widget.toggleView!();
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please, enter email' : null,
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter password'),
                      validator: (value) => value!.length < 6
                          ? 'Please, enter password with 6+ chars'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signUpWithEmailandPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Please supply a valid email';
                              loading = false;
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    )
                    /*ElevatedButton(
                child: Text(
                  'Sign In Anon',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  print('Sign In - ${result.uid}');
                  //result != null ? print('sign in') : print('error sign in');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),*/
                  ],
                ),
              ),
            ),
          );
  }
}
