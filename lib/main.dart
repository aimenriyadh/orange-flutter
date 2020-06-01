import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange/screens/sign_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        accentColor: Theme.of(context).primaryColor,
        cursorColor: Theme.of(context).primaryColor,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: SignUp(),
    );
  }
}

