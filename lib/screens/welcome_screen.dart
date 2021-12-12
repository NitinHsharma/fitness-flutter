import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';
import 'signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
            msg: "You are on Welcome page",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //   borderRadius: const BorderRadius.all(Radius.circular(5)),
            //   boxShadow: <BoxShadow>[
            //     BoxShadow(
            //         color: Colors.grey.shade200,
            //         offset: const Offset(2, 4),
            //         blurRadius: 5,
            //         spreadRadius: 2)
            //   ],
            //   gradient: const LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Color(0xffE6E6E6),
            //       Color(0xff14279B),
            //     ],
            //   ),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Fit',
                    style: GoogleFonts.portLligatSans(
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                    children: const [
                      TextSpan(
                        text: 'ness',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: const Color(0xffE6E6E6).withAlpha(100),
                              offset: const Offset(2, 4),
                              blurRadius: 8,
                              spreadRadius: 2)
                        ],
                        color: Colors.orange),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.black,
                    ),
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
