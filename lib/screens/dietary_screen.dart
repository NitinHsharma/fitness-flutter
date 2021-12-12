// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:fitness/screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';

class DietaryScreen extends StatefulWidget {
  const DietaryScreen({Key? key}) : super(key: key);

  @override
  _DietaryScreenState createState() => _DietaryScreenState();
}

class Meal {
  String name;
  String qty;

  Meal(this.name, this.qty);
}

class _DietaryScreenState extends State<DietaryScreen> {
  bool _isVeg = true;
  bool _allClicked = true;
  bool _breakfastClicked = false;
  bool _lunchClicked = false;
  bool _dinnerClicked = false;
  List<Meal> report = [];

  @override
  void initState() {
    updateMeal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, report);
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
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black),
              onPressed: () => {},
            ),
            centerTitle: true,
            title: Text('Welcome'),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.logout)),
            ],
          ),
          body: Container(
            // decoration: BoxDecoration(
            //   borderRadius: const BorderRadius.all(Radius.circular(5)),
            //   boxShadow: <BoxShadow>[
            //     BoxShadow(
            //       color: Colors.grey.shade200,
            //       offset: const Offset(2, 4),
            //       blurRadius: 5,
            //       spreadRadius: 2,
            //     )
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              // ignore: unnecessary_new
                              Text(
                                "Meal Plan",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              // checkbox for veg and non veg
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Checkbox(
                                    value: _isVeg,
                                    onChanged: (value) {
                                      // print("Checkbox value: $value");
                                      setState(() {
                                        _isVeg = true;
                                        updateMeal();
                                      });
                                    },
                                  ),
                                  Text(
                                    "Veg",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Checkbox(
                                    value: !_isVeg,
                                    onChanged: (value) {
                                      setState(() {
                                        _isVeg = false;
                                        updateMeal();
                                      });
                                    },
                                  ),
                                  Text(
                                    "Non-Veg",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () => {
                              setState(() {
                                _allClicked = true;
                                _breakfastClicked = false;
                                _lunchClicked = false;
                                _dinnerClicked = false;
                                updateMeal();
                              })
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary:
                                  _allClicked ? Colors.orange : Colors.white,
                            ),
                            child: Text(
                              "All",
                              style: TextStyle(
                                color:
                                    !_allClicked ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {
                              setState(() {
                                _allClicked = false;
                                _breakfastClicked = true;
                                _lunchClicked = false;
                                _dinnerClicked = false;
                                updateMeal();
                              })
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: _breakfastClicked
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                            child: Text(
                              "Breakfast",
                              style: TextStyle(
                                color: !_breakfastClicked
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {
                              setState(() {
                                _allClicked = false;
                                _breakfastClicked = false;
                                _lunchClicked = true;
                                _dinnerClicked = false;
                                updateMeal();
                              })
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary:
                                  _lunchClicked ? Colors.orange : Colors.white,
                            ),
                            child: Text(
                              "Lunch",
                              style: TextStyle(
                                color: !_lunchClicked
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {
                              setState(() {
                                _allClicked = false;
                                _breakfastClicked = false;
                                _lunchClicked = false;
                                _dinnerClicked = true;
                                updateMeal();
                              })
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary:
                                  _dinnerClicked ? Colors.orange : Colors.white,
                            ),
                            child: Text(
                              "Dinner",
                              style: TextStyle(
                                color: !_dinnerClicked
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ignore: unnecessary_new
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Table(
                        columnWidths: {
                          0: FlexColumnWidth(0.4),
                          1: FlexColumnWidth(1.0),
                          2: FlexColumnWidth(0.5),
                        },
                        border: TableBorder.all(
                          color: Colors.orange,
                          width: 0,
                        ),
                        children: (report)
                            .map(
                              (item) => TableRow(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(
                                      report.indexOf(item) % 3 == 0
                                          ? Icons.circle
                                          : Icons.circle_outlined,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        item.name.toString(),
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                                report.indexOf(item) == 0
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        item.qty.toString(),
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                                report.indexOf(item) == 0
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // you can have more properties of course
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateMeal() {
    List<Meal> temp = [Meal("Food", "qty")];
    if (_isVeg) {
      if (_allClicked) {
        temp.add(Meal("Panner", "2"));
        temp.add(Meal("Mashroom", "1"));
        temp.add(Meal("Poha", "3"));
        temp.add(Meal("Upma", "2"));
        temp.add(Meal("Palak", "3"));
        temp.add(Meal("Dal", "1"));
        temp.add(Meal("Salad", "2"));
      } else if (_breakfastClicked) {
        temp.add(Meal("Idli", "2"));
        temp.add(Meal("Dosa", "1"));
        temp.add(Meal("Banana", "2"));
        temp.add(Meal("Apple", "1"));
        temp.add(Meal("Poha", "3"));
        temp.add(Meal("Upma", "2"));
        temp.add(Meal("Cereals", "2"));
      } else if (_lunchClicked) {
        temp.add(Meal("Panner", "2"));
        temp.add(Meal("Soya", "1"));
        temp.add(Meal("Mattar", "2"));
        temp.add(Meal("Mashroom", "1"));
        temp.add(Meal("Palak", "3"));
        temp.add(Meal("Methi", "2"));
        temp.add(Meal("Karela", "2"));
      } else if (_dinnerClicked) {
        temp.add(Meal("Roti", "2"));
        temp.add(Meal("Rice", "1"));
        temp.add(Meal("Salad", "2"));
        temp.add(Meal("Dal", "1"));
        temp.add(Meal("Rajma", "3"));
        temp.add(Meal("Rasam", "2"));
        temp.add(Meal("Rava", "2"));
      }
    } else {
      if (_allClicked) {
        temp.add(Meal("Omlete", "1"));
        temp.add(Meal("Fish", "1"));
        temp.add(Meal("Kabab", "1"));
        temp.add(Meal("Prons", "4"));
        temp.add(Meal("Meat", "1"));
        temp.add(Meal("Fried Chicken", "2"));
      } else if (_breakfastClicked) {
        temp.add(Meal("Omlete", "1"));
        temp.add(Meal("Egg", "2"));
        temp.add(Meal("Pronos", "5"));
        temp.add(Meal("Fish", "1"));
        temp.add(Meal("Chicken", "2"));
        temp.add(Meal("Kabab", "1"));
        temp.add(Meal("Half fry", "1"));
      } else if (_lunchClicked) {
        temp.add(Meal("Fried Chicken", "2"));
        temp.add(Meal("FISH", "1"));
        temp.add(Meal("Meat", "1"));
        temp.add(Meal("Prons", "4"));
        temp.add(Meal("Kabab", "3"));
      } else if (_dinnerClicked) {
        temp.add(Meal("Fried Chicken", "2"));
        temp.add(Meal("FISH", "1"));
        temp.add(Meal("Meat", "1"));
        temp.add(Meal("Prons", "4"));
        temp.add(Meal("Kabab", "3"));
      }
    }

    setState(() {
      report = temp;
    });
  }
}
