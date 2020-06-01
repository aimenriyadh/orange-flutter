import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange/components/scaler.dart';
import 'package:orange/screens/sign_in.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email, password, gender, name;

  File image;

  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '\n\nSign Up\n',
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
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      OMIcons.supervisedUserCircle,
                    ),
                    labelText: 'name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: MediaQuery.of(context).size.height / 4,
                            color: Color(0xff767676),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(
                                        OMIcons.image,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      title: Text(
                                        'Gallery',
                                      ),
                                      subtitle: Text(
                                        'pick the image from your photo gallery',
                                      ),
                                      onTap: () async {
                                        File temp = await ImagePicker.pickImage(
                                          source: ImageSource.gallery,
                                        );

                                        if (temp != null) {
                                          setState(() {
                                            this.image = temp;
                                          });
                                        }

                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        OMIcons.cameraAlt,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      title: Text(
                                        'Camera',
                                      ),
                                      subtitle: Text(
                                        'pick the image from your camera',
                                      ),
                                      onTap: () async {
                                        File temp = await ImagePicker.pickImage(
                                          source: ImageSource.camera,
                                        );

                                        if (temp != null) {
                                          setState(() {
                                            this.image = temp;
                                          });
                                        }

                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          OMIcons.image,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: MediaQuery.of(context).size.height / 4,
                            color: Color(0xff767676),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(
                                        OMIcons.hdrStrong,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      title: Text(
                                        'Male',
                                      ),
                                      subtitle: Text(
                                        'I am a male',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          this.isMale = true;
                                        });

                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        OMIcons.person,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      title: Text(
                                        'Female',
                                      ),
                                      subtitle: Text(
                                        'I am a female',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          this.isMale = false;
                                        });

                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          OMIcons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                image != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              image,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                    : Opacity(
                        opacity: 0,
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                CupertinoButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () async {
                    //TODO: add sign up function
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        await Navigator.pushReplacement(
                          context,
                          Scaler(
                            page: SignIn(),
                          ),
                        );
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
