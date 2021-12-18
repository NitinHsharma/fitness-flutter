// ignore_for_file: prefer_const_constructors

import 'package:fitness/screens/dashboard_screen.dart';
import 'package:fitness/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List YoutubeList = [
    "ml6cT4AZdqI",
    "gC_L9qAHVJ8",
    "enYITYwvPAQ",
    "X3q5e1pV4pc",
    "vG_Bs0QLc3I"
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // ignore: unnecessary_new
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: MaterialApp(
        title: 'Stay Fit',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black),
              onPressed: () => {},
            ),
            centerTitle: true,
            title: Text('Stay Fit'),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: Icon(Icons.logout)),
            ],
          ),
          body: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(
                      'Workout Plan',
                      style: GoogleFonts.montserrat(
                        textStyle: textTheme.headline3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/images/workout1.jpg'),
                          height: 200,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/images/workout2.jpg'),
                          height: 200,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: YoutubeList[0],
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: false,
                              hideControls: false,
                            ),
                          ),
                          showVideoProgressIndicator: false,
                        ),
                        builder: (context, player) {
                          return Column(
                            children: [
                              // some widgets
                              player,
                              //some other widgets
                            ],
                          );
                        },
                      ),
                    ],
                  ),

                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/images/workout4.jpg'),
                          height: 200,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/images/workout3.jpg'),
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                  // youtube video player
                  // ListView.separated(
                  //   padding: const EdgeInsets.all(8),
                  //   separatorBuilder: (BuildContext context, int index) {
                  //     return SizedBox(
                  //       height: 15,
                  //     );
                  //   },
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   primary: false,
                  //   itemCount: 5,
                  //   itemBuilder: (context, index) {
                  //     return YoutubePlayerBuilder(
                  //       player: YoutubePlayer(
                  //         controller: YoutubePlayerController(
                  //           initialVideoId: YoutubeList[index],
                  //           flags: YoutubePlayerFlags(
                  //             autoPlay: false,
                  //             mute: false,
                  //             hideControls: false,
                  //           ),
                  //         ),
                  //         showVideoProgressIndicator: false,
                  //       ),
                  //       builder: (context, player) {
                  //         return Column(
                  //           children: [
                  //             // some widgets
                  //             player,
                  //             //some other widgets
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),

                  // YoutubePlayer(
                  //   controller: YoutubePlayerController(
                  //     initialVideoId: 'iLnmTe5Q2Qw',
                  //     flags: YoutubePlayerFlags(
                  //       autoPlay: false,
                  //       mute: false,
                  //     ),
                  //   ),
                  //   showVideoProgressIndicator: false,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
