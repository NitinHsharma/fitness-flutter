// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard_screen.dart';
import 'welcome_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FnQScreen extends StatefulWidget {
  const FnQScreen({Key? key}) : super(key: key);

  @override
  _FnQScreenState createState() => _FnQScreenState();
}

class fnq {
  String question;
  String answer;
  fnq(this.question, this.answer);
}

class _FnQScreenState extends State<FnQScreen> {
  var items = [
    fnq("DO I NEED TO WORK OUT EVERY DAY?",
        "No, you do not need to work out every day. In fact, in most cases, I would recommend at least 1-2 days of total rest a week. However, just because you have a rest or recovery day scheduled into your calendar, doesn’t necessarily mean you aren’t active at all on these days. Light, regular movement such as walking your dog around the block, or taking time for stretching or foam rolling are great recovery techniques to help increase blood flow and reduce tension in tight muscles. Participating in regular rest days and practicing a well-balanced recovery routine can help you reduce your risk for injury and promote the longevity of your fitness routine."),
    fnq("HOW LONG SHOULD I WORK OUT FOR?",
        "In general, your workouts do not need to be long to be effective. Many people who are new to fitness imagine slogging around for hours on the treadmill. This doesn’t need to be the case. The length of your workout will largely depend on your fitness level, as well as the type of training and intensity you’re working out at. The CDC recommends at least 30 minutes of moderate intensity aerobic activity 5 days a week, as well as 2 full body strength training sessions (1). Making sure you’re hitting these minimums for exercise is a great way to make sure you’re on track. However, if you’re under the recommendation, it’s okay, we all have to start somewhere! When it comes to the type of workout you’re completing - HIIT, circuit training sessions, or sprints will typically be quicker than moderate intensity cardio sessions, as you’re working out at a higher intensity. For strength training sessions, you may want to schedule more time for warming up and resting between sets."),
    fnq("WHAT TRAINING SHOULD I BE DOING TO LOSE WEIGHT?",
        "When it comes to weight loss, I like to focus on a full scale approach. Regular cardio training is great for increasing your daily calorie burn. While strength training will help you build lean muscle, which will increase your metabolism and help you burn more calories at rest! I’d also recommend adding in a few HIIT sessions per week, rather it be your favorite type of cardio, bodyweight, or light dumbbell exercises. HIIT is designed to get your body working at high intensities, burning a ton of calories in a short period of time. Create a schedule with a blend of regular cardio, a few full body strength training sessions, and a few HIIT training sessions each week. Finally, don’t forget to eat a healthy, well balanced diet emphasizing whole foods. With weight loss it’s important to maximize the nutrients in the calories you’re consuming to fuel your workouts!"),
    fnq("What should I avoid eating after workout?",
        "As soon as a workout is complete you want to replenish the calories and nutrients lost during that workout. The foods that hinder this are high-fat and -fiber foods. The fat and fiber in any food will slow the absorption of the nutrients needed to replenish glycogen stores that supply us with energy to work out again the next day. Grab a protein shake with some fruit."),
    fnq("Are there natural remedies for bloating and gas?",
        "The first thing you need to do is eliminate any foods or liquids that cause either. That comes down to you knowing how your body reacts to certain things (diet sodas, juices, etc.). The best remedies to treat the symptoms include colon cleanses, ginger and dandelion teas, parsley, and garlic. Certain yoga poses also offer relief from bloating and gas. From a preventative perspective, taking your time while eating and choosing to eat foods more slowly can help avoid consuming extra oxygen."),
    fnq("What’s the idea behind eating multiple small meals vs. three normal-size ones?",
        "The idea behind consuming multiple small meals a day vs. three “normal”-size meals is that you control your blood sugar levels and insulin production, control hormones better, have more energy, reduced food cravings, less hunger, and reduce body-fat storage, which all contribute to the ablility to maintain lean muscle mass. Smaller and more periodic feedings that include protein keep your body’s supply of amino acids in check to keep any amino acids from being used for energy. Eating more of the right foods and more often will help to speed our metabolism by the idea of thermic energy of feeding (energy to digest food)."),
    fnq("Can you eat too much protein? How much do we need?",
        "Eating “too much protein” is a tough one to answer. First off, eating more than 2g per pound of bodyweight is extreme and not any more useful to a healthy person. Second of all, protein has 4 calories/grams to an excessive amount in a normal nutrition plan, which could produce a person to overeat calories and gain unwanted weight. A healthy person that works out or exercises regularly could require 1.5g of protein per pound of bodyweight per day. However, the general rule is to consume at least 1g protein per pound of bodyweight per day to help with performance and to ensure your body gets all the amino acids it needs."),
    fnq("What are some good snack options to keep at my office?",
        "If you’re stuck at the office, often without food good choices, the best choice would be to pack healthy nuts (almonds, walnuts, pecans, pistachios), nut butter, hummus, quality protein powder, Greek yogurt, homemade protein bars, veggie sticks, easy-pop tuna cans or packs, and fruit. Be careful with your portions and all of these can keep you full in-between regular meals.")
  ];
  // generateData();
  // ignore: use_function_type_syntax_for_parameters
  // items.add(fnq("What is the name of the first computer programmer?", "Ada Lovelace"));
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // ignore: unnecessary_new
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
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
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              onPressed: () => {},
            ),
            centerTitle: true,
            title: Text('Stay Fit'),
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
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    "Fitness Questions",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
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
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        var qno = index + 1;
                        var question = "$qno. ${items[index].question}";
                        return ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(question,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          collapsed: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              items[index].answer,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                          expanded: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              items[index].answer,
                              style: GoogleFonts.montserrat(),
                              softWrap: true,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
