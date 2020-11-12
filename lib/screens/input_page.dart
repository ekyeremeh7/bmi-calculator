import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: (Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kReuseableCardColor
                      : kInactiveCardColor,
                  cardChild: ReuseableCardChild(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kReuseableCardColor
                      : kInactiveCardColor,
                  cardChild: ReuseableCardChild(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReuseableCard(
              colour: kReuseableCardColor,
              cardChild: Column(
                //Brings its components into the center of the column
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    //Along the length of the row
                    mainAxisAlignment: MainAxisAlignment.center,
                    //cross axis alignment is along the short side
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinimumSliderValue,
                      max: kMaximumSliderValue,
                      //activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  colour: kReuseableCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberLabelTextStyle),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
//                            FloatingActionButton(
//                              backgroundColor: Color(0xFF4C4F5E),
//                              child: Icon(
//                                Icons.add,
//                                color: Colors.white,
//                              ),
//                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
//                            FloatingActionButton(
//                              backgroundColor: Color(0xFF4C4F5E),
//                              child: Icon(
//                                Icons.add,
//                                color: Colors.white,
//                              ),
//                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString(), style: kNumberLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kReuseableCardColor,
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE ',
            onTap: () {
             CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
              // Navigator.pushNamed(context, '/resultsPage');
            },
          ),
        ],
      )),
    );
  }
}




//
//Container(
//child: SafeArea(
//child: Column(
//children: <Widget>[
//Row(
//children: <Widget>[
//Expanded(
//child: Container(
//margin: EdgeInsets.all(15.0),
//decoration: BoxDecoration(
//color: Color(0xFF1D1E33),
//borderRadius: BorderRadius.circular(10.0),
//),
//height: 200.0,
//width: 170.0,
//),
//),
//
//Expanded(
//child: Container(
//margin: EdgeInsets.all(15.0),
//decoration: BoxDecoration(
//color: Color(0xFF1D1E33),
//borderRadius: BorderRadius.circular(10.0),
//),
//height: 200.0,
//width: 170.0,
//),
//),
//],
//),
//
//Row(
//children: <Widget>[
//Expanded(
//child: Container(
//margin: EdgeInsets.all(15.0),
//decoration: BoxDecoration(
//color: Color(0xFF1D1E33),
//borderRadius: BorderRadius.circular(10.0),
//),
//height: 150.0,
//),
//),
//],
//),
//Row(
//children: <Widget>[
//Expanded(
//child: Container(
//margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
//decoration: BoxDecoration(
//color: Color(0xFF1D1E33),
//borderRadius: BorderRadius.circular(10.0),
//),
//height: 200.0,
//width: 170.0,
//),
//),
//Expanded(
//child: Container(
//margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
//decoration: BoxDecoration(
//color: Color(0xFF1D1E33),
//borderRadius: BorderRadius.circular(10.0),
//),
//height: 200.0,
//width: 170.0,
//),
//),
//],
//)
//
//],
//),
//),
//),
//Container(
//margin: EdgeInsets.all(15.0),
//decoration: BoxDecoration(
//color:Color(0xFF1D1E33),
//borderRadius:BorderRadius.circular(10.0),
//),
//height: 200.0,
//width: 170.0,
//),

//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//

//  void updateColor(Gender selectedGender){
//    //male card pressed
//
//    if(selectedGender == Gender.male) {
//        // ignore: unnecessary_statements
//        if(maleCardColor == inactiveCardColor){
//          maleCardColor = reuseableCardColor;
//          femaleCardColor=inactiveCardColor;
//        }else{
//          maleCardColor = inactiveCardColor;
//        }
//      }
//
//    //female card pressed
//    if(selectedGender == Gender.female){
//      if(femaleCardColor == inactiveCardColor){
//        femaleCardColor = reuseableCardColor;
//        maleCardColor=inactiveCardColor;
//      }else{
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }
