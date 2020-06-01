import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange/components/scaler.dart';
import 'package:orange/screens/sign_up.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '\n\nSign In\n',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 15,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (t) {
                    setState(() {
                      this.email = t.trim();
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'email',
                    prefixIcon: Icon(
                      OMIcons.mail,
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                TextField(
                  onChanged: (t) {
                    setState(() {
                      this.password = t.trim();
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      OMIcons.lock,
                    ),
                    labelText: 'passowrd',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                InkWell(
                  onTap: () async {
                    await Navigator.pushReplacement(
                      context,
                      Scaler(
                        page: SignUp(),
                      ),
                    );
                  },
                  child: Text(
                    'already a member?\n',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CupertinoButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () async {
                        //TODO: add sign in function
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
