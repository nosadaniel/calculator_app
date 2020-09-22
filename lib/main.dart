import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'helpWidget/helpWidget.dart';
import 'resultPage.dart';
import 'helpWidget/bmi.dart';

void main() {
  runApp(MyApp());
}

const Color activeColor = Color(0xFF11133f);
const Color inactiveColor = Color(0xFF06082e);

enum Gender { Male, Female }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      initialRoute: '/',
//      routes: {
//        '/': (context) => HomePage(),
//        '/resultPage': (context) => ResultPage(),
//      },
      title: 'BMI CALCULATOR BY TEAM HARVACOM',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF06082e),
        primaryColor: Color(0xFF11133f),
      ),
      home: HomePage(),
    );
  }
}

//06082e
//11133f
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 100;
  int age = 44;
  double weight = 44;
  Color maleColor = activeColor;
  Color femaleColor = inactiveColor;

  void selectGender(gender) {
    if (gender == Gender.Male) {
      maleColor = activeColor;
    } else {
      maleColor = inactiveColor;
    }
    if (gender == Gender.Female) {
      femaleColor = activeColor;
    } else {
      femaleColor = inactiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR BY TEAM HARVACOM'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    childCard: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(Gender.Male);
                        });
                      },
                      child: Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.male,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LabelText(label: 'Male'),
                        ],
                      ),
                    ),
                    color: maleColor,
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    color: femaleColor,
                    childCard: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(Gender.Female);
                        });
                      },
                      child: Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.female,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LabelText(label: 'Female'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ReusableContainer(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(
                      label: 'Height',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('CM'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          thumbColor: Colors.pinkAccent,
                          overlayColor: Color(0x5306082e),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                        min: 100,
                        max: 200,
                        inactiveColor: Colors.white30,
                      ),
                    ),
                  ],
                ),
                color: activeColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      color: activeColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(
                            label: 'Age',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IncrementalButton(
                                buttonIcon: FaIcon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IncrementalButton(
                                buttonIcon: FaIcon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      color: activeColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(
                            label: 'Weight',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            weight.toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IncrementalButton(
                                buttonIcon: FaIcon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IncrementalButton(
                                buttonIcon: FaIcon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BmiCalculator bmiCal =
                    BmiCalculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultHomePage(
                      bmi: bmiCal.getBmi(),
                      status: bmiCal.getStatus(),
                      interpretation: bmiCal.getInterpretation(),
                    ),
                  ),
                );
              },
              child: BottomContainer(label: 'Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
