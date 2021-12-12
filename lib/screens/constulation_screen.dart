// ignore_for_file: prefer_const_constructors

import 'package:fitness/screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ConstulationScreen extends StatefulWidget {
  const ConstulationScreen({Key? key}) : super(key: key);

  @override
  _ConstulationScreenState createState() => _ConstulationScreenState();
}

class _ConstulationScreenState extends State<ConstulationScreen> {
  List YoutubeList = [
    "AzV3EA-1-yM",
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
        title: 'Welcome',
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
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              onPressed: () => {},
            ),
            centerTitle: true,
            title: Text('Fitenss World'),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Text(
                      'Consultation',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        textStyle: textTheme.headline3,
                      ),
                    ),
                  ),
                  // youtube video player
                  ListView.separated(
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: YoutubeList.length,
                    itemBuilder: (context, index) {
                      return YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: YoutubeList[index],
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
                      );
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Free Consultation From Our Expert!",
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                    ),
                  ),
                  Image(image: AssetImage('assets/images/abc.jpg')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
