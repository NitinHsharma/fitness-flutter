// ignore_for_file: prefer_const_constructors
import 'package:fluttertoast/fluttertoast.dart';
import 'dashboard_screen.dart';
import 'signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/utils/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _usernameValidate = false;
  bool _passwordValidate = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // ignore: unnecessary_new
    return new WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
            msg: "You are on login screen",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      },
      child: Scaffold(
          body: Form(
        key: _formKey,
        child: Container(
          height: height,
          color: Colors.orange,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Stay Fit',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          // children: [
                          //   TextSpan(
                          //     text: "ness",
                          //     style:
                          //         TextStyle(color: Colors.black, fontSize: 30),
                          //   ),
                          // ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
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
                                                return 'Username is empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Color(0xfff3f3f4),
                                              filled: true,
                                              errorText: _usernameValidate
                                                  ? "Value can not be null"
                                                  : null,
                                              hintText: "Enter username",
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
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
                                              filled: true,
                                              hintText: "Enter password",
                                              errorText: _passwordValidate
                                                  ? "enter password"
                                                  : null,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
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
                                  onPressed: () => login(context),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * .055),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'New User?',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Register Now',
                                        style: TextStyle(
                                            color: Color(0xff14279B),
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
      )),
    );
  }

  login(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      // send error popup
      return;
    }

    var valid =
        await User.Login(usernameController.text, passwordController.text);
    if (valid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Invalid Username or password",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
