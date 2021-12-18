// ignore_for_file:  unnecessary_new, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fitness/utils/reports.dart';
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
  double carbs;
  double protein;
  double fat;

  Meal(
    this.name,
    this.qty,
    this.carbs,
    this.protein,
    this.fat,
  );
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
                          0: FlexColumnWidth(1.4),
                          1: FlexColumnWidth(0.5),
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
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: report.indexOf(item) != 0
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: InkWell(
                                                child: Icon(
                                                  Icons.add_box_rounded,
                                                  color: Colors.orange,
                                                ),
                                                onTap: () {
                                                  updateDailyMeal(item);
                                                },
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Add",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
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
    List<Meal> temp = [Meal("Food", "qty", 0.0, 0.0, 0.0)];
    if (_isVeg) {
      if (_allClicked) {
        temp.add(Meal("Panner", "2", 30.0, 20.0, 10.0));
        temp.add(Meal("Mashroom", "1", 40.0, 23.0, 9.0));
        temp.add(Meal("Poha", "3", 19.0, 12.0, 10.2));
        temp.add(Meal("Upma", "2", 23.0, 32.0, 1.0));
        temp.add(Meal("Palak", "3", 19.0, 43.0, 8.0));
        temp.add(Meal("Dal", "1", 63.0, 22.0, 2.0));
        temp.add(Meal("Salad", "2", 23.0, 46.0, 0.0));
      } else if (_breakfastClicked) {
        temp.add(Meal("Idli", "2", 94.0, 15.0, 2.0));
        temp.add(Meal("Dosa", "1", 63.0, 20.0, 4.0));
        temp.add(Meal("Banana", "2", 32.0, 15.0, 6.0));
        temp.add(Meal("Apple", "1", 22.0, 31.0, 3.0));
        temp.add(Meal("Poha", "3", 29.0, 20.0, 3.0));
        temp.add(Meal("Upma", "2", 20.0, 46.0, 1.0));
        temp.add(Meal("Cereals", "2", 10.0, 10.0, 9.0));
      } else if (_lunchClicked) {
        temp.add(Meal("Panner", "2", 74.0, 33.0, 2.0));
        temp.add(Meal("Soya", "1", 23.0, 45.0, 21.0));
        temp.add(Meal("Mattar", "2", 34.0, 32.0, 4.0));
        temp.add(Meal("Mashroom", "1", 45.0, 43.0, 12.0));
        temp.add(Meal("Palak", "3", 54.0, 63.0, 1.0));
        temp.add(Meal("Methi", "2", 67.0, 12.0, 5.0));
        temp.add(Meal("Karela", "2", 62.0, 67.0, 5.0));
      } else if (_dinnerClicked) {
        temp.add(Meal("Roti", "2", 57.0, 34.0, 12.0));
        temp.add(Meal("Rice", "1", 43.0, 12.0, 21.0));
        temp.add(Meal("Salad", "2", 65.0, 22.0, 4.0));
        temp.add(Meal("Dal", "1", 12.0, 23.0, 22.0));
        temp.add(Meal("Rajma", "3", 23.0, 26.0, 34.0));
        temp.add(Meal("Rasam", "2", 13.0, 40.0, 23.0));
        temp.add(Meal("Rava", "2", 32.0, 23.0, 23.0));
      }
    } else {
      if (_allClicked) {
        temp.add(Meal("Omlete", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Fish", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Kabab", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Prons", "4", 30.0, 20.0, 10.0));
        temp.add(Meal("Meat", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Fried Chicken", "2", 30.0, 20.0, 10.0));
      } else if (_breakfastClicked) {
        temp.add(Meal("Omlete", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Egg", "2", 30.0, 20.0, 10.0));
        temp.add(Meal("Pronos", "5", 30.0, 20.0, 10.0));
        temp.add(Meal("Fish", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Chicken", "2", 30.0, 20.0, 10.0));
        temp.add(Meal("Kabab", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Half fry", "1", 30.0, 20.0, 10.0));
      } else if (_lunchClicked) {
        temp.add(Meal("Fried Chicken", "2", 30.0, 20.0, 10.0));
        temp.add(Meal("FISH", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Meat", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Prons", "4", 30.0, 20.0, 10.0));
        temp.add(Meal("Kabab", "3", 30.0, 20.0, 10.0));
      } else if (_dinnerClicked) {
        temp.add(Meal("Fried Chicken", "2", 30.0, 20.0, 10.0));
        temp.add(Meal("FISH", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Meat", "1", 30.0, 20.0, 10.0));
        temp.add(Meal("Prons", "4", 30.0, 20.0, 10.0));
        temp.add(Meal("Kabab", "3", 30.0, 20.0, 10.0));
      }
    }

    setState(() {
      report = temp;
    });
  }

  void updateDailyMeal(Meal item) async {
    try {
      await Reports.setReports(item.carbs, item.protein, item.fat);
      print("item updated");
      Fluttertoast.showToast(
          msg: "You have successfully updated your meal",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      print("errro $e");
    }
  }
}
