import 'package:flutter/material.dart';
import 'screens/input_page.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(

        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
//          textTheme: TextTheme(
//            body1: TextStyle(color: Colors.white),
//          ),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      //initialRoute: '/',
      routes: {
       // '/':(context) => InputPage(),
//        '/resultsPage':(context) => ResultsPage(),
      },
    );
  }
}



//floatingActionButton: Theme(
//        data: ThemeData.light(),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),