// ignore_for_file: prefer_const_constructors

import 'package:fitness/screens/bmi_screen.dart';
import 'package:fitness/screens/constulation_screen.dart';
import 'package:fitness/screens/fnq_screen.dart';
import 'package:fitness/screens/report_screen.dart';
import 'package:fitness/screens/workout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dietary_screen.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // ignore: unnecessary_new
    return new WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
            msg: "You are on home page",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      },
      child: MaterialApp(
          title: 'Fitness World',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
            ),
          ),
          debugShowCheckedModeBanner: false,
          // ignore: unnecessary_new
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Menu'),
              leading: IconButton(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    icon: Icon(Icons.logout)),
              ],
            ),
            body: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DietaryScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage(
                              'assets/images/d.jpeg',
                            ),
                            height: 100,
                          ),
                        ),
                        Text(
                          "Dietary",
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        // ignore: unnecessary_new
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkoutScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage(
                              'assets/images/w.jpeg',
                            ),
                            height: 100,
                          ),
                        ),
                        Text(
                          "Workout",
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        // ignore: unnecessary_new
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConstulationScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage(
                              'assets/images/c.jpeg',
                            ),
                            height: 100,
                          ),
                        ),
                        Text(
                          "Consultation",
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BmiScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage(
                              'assets/images/a.jpeg',
                            ),
                            height: 100,
                          ),
                        ),
                        Text("Generate BMI", style: textTheme.bodyText1),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        // ignore: unnecessary_new
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportScreen(),
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage(
                              'assets/images/report.png',
                            ),
                            height: 100,
                          ),
                        ),
                        Text(
                          "Reports",
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        // ignore: unnecessary_new
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FnQScreen(),
                              ),
                            )
                          },
                          child: Image(
                            image: AssetImage(
                              'assets/images/f.jpeg',
                            ),
                            height: 100,
                          ),
                        ),
                        Text("FAQ", style: textTheme.bodyText1),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            )),
          )),
    );
  }
}
