import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 74;
  int age    = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.male;
                      setState(() {
                      });
                    },
                    color: selectedGender == Gender.male ? kActiveCardColour : kInactiveColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, title: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.female;
                      setState(() {
                      });
                    },
                    color: selectedGender == Gender.female ? kActiveCardColour : kInactiveColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, title: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x15EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              color: kActiveCardColour
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          this.weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onTap: () {
                                this.weight -= 1;
                                setState(() {

                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              onTap: () {
                                this.weight += 1;
                                setState(() {

                                });
                              },
                              iconData: FontAwesomeIcons.plus
                            )
                          ],
                        )
                      ],
                    ),
                    color: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            this.age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onTap: () {
                                  this.age -= 1;
                                  setState(() {

                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  onTap: () {
                                    this.age += 1;
                                    setState(() {

                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus
                              )
                            ],
                          )
                        ],
                      ),
                      color: kActiveCardColour),
                ),
              ],
            ),
          ),

          BottomButton(
            title: "CALCULATE",
            onPress: () {
              CalculatorBrain cal = CalculatorBrain(height: this.height, weight: this.weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: cal.calculateBMI() ,
                    resultText: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  ))
              );
            }
          )
        ],
      ),
    );
  }
}

