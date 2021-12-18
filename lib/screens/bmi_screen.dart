// ignore_for_file: prefer_const_constructors

import 'package:fitness/screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class Gender {
  const Gender(this.id, this.name);
  final String name;
  final int id;
}

class _BmiScreenState extends State<BmiScreen> {
// the controller for the text field associated with "height"
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  String gender = 'Male';
  List<String> typeNeg = ["Male", "Female"];
  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  double? _bmi;
  String _message = 'Please enter your Details';

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
                            builder: (context) => WelcomeScreen()));
                  },
                  icon: Icon(Icons.logout)),
            ],
          ),
          body: Container(
            child: Center(
              child: Container(
                width: 320,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("BMI Calculator",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          controller: _ageController,
                          decoration: InputDecoration(
                            labelText: 'Age',
                          ),
                        ),

                        DropdownButtonFormField<String>(
                          hint: Text("Select the gender"),
                          onChanged: (newValue) {
                            setState(() {
                              gender = newValue.toString();
                            });
                          },
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please select the gender';
                            }
                          },
                          items: typeNeg
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                        //radio button flutter

                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(labelText: 'Height (cm)'),
                          controller: _heightController,
                        ),
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Weight (kg)',
                          ),
                          controller: _weightController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: _calculate,
                          child: Text('Calculate'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text(
                            _bmi == null
                                ? 'No Result'
                                : _bmi!.toStringAsFixed(2),
                            style: TextStyle(fontSize: 50),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            _message,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height) * 10000;
      // _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }
}
