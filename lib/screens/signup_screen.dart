// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';

import '../widget/customClipper.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/utils/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final genderController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // ignore: unnecessary_new
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.orange,
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        SizedBox(height: height * .15),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Fitness Application',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(Colors.black.value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Card(
                          child: Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Registration",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Name:',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: TextFormField(
                                        controller: nameController,
                                        obscureText: false,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Name is empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Age:',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: ageController,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Age is empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Weight:',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: TextFormField(
                                        controller: weightController,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Age is empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      'Height:',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: heightController,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Heigth is empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Gender:',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: TextFormField(
                                        controller: genderController,
                                        obscureText: false,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Gender is empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Username",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: usernameController,
                                            obscureText: false,
                                            validator: (text) {
                                              if (text == null ||
                                                  text.isEmpty) {
                                                return 'Usename is empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Color(0xfff3f3f4),
                                              filled: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Password",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                              controller: passwordController,
                                              obscureText: true,
                                              validator: (text) {
                                                if (text == null ||
                                                    text.isEmpty) {
                                                  return 'Password is empty';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  fillColor: Color(0xfff3f3f4),
                                                  filled: true))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(Colors.orange.value),
                                        Color(Colors.orange.value),
                                      ],
                                    ),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.orange,
                                    ),
                                    onPressed: () => signUp(),
                                    child: Text(
                                      "Reigster",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * .01),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Already have an account ?',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Color(Colors.orange.value),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    if (!_formKey.currentState!.validate()) {
      // send error popup
      return;
    }
    var valid =
        await User.Signup(usernameController.text, passwordController.text);
    print("Retun is  $valid");
    if (valid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
}
