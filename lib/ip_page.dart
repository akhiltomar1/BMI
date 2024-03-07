import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/icon_content.dart';
import 'package:bmi/reusable_card.dart';
import 'package:bmi/results.dart';
import 'package:bmi/calc.dart';




enum Gender{
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // Color malecardcolor = inactivecardcolour;
  // Color femalcardcolor = inactivecardcolour;

  Gender? selected;
  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF073F),
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
        //  backgroundColor: activecardcolour,

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: selected == Gender.male
                          ? activecardcolour
                          : inactivecardcolour,
                      cardchild: new IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                      onpress: () {
                        setState(() {
                          selected = Gender.male;
                        });
                      },
                    ),

                  ),
                  Expanded(
                    child: ReusableCard(
                      cardchild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      colour: selected == Gender.female
                          ? activecardcolour
                          : inactivecardcolour,
                      onpress: () {
                        setState(() {
                          selected = Gender.female;
                        });
                      },
                    ),
                  ),
                ]
            ),
          ),

          Expanded(
            child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activecardcolour,

                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT',
                              style: labelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(height.toString(),
                                style: notextstyle,
                              ),
                              Text('CM',
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                          Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newVal) {
                              setState(() {
                                height = newVal.round();
                              });
                            },
                          ),
                        ],

                      ),
                      onpress: () {
                        setState(() {

                        });
                      },
                    ),
                  ),
                ]
            ),
          ),

          Expanded(


            child: Row(
              children: <Widget>[
                Expanded
                  (

                    child: ReusableCard(
                      colour: activecardcolour,
                      cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            Text('WEIGHT',
                              style: labelTextStyle,
                            ),
                            Text(weight.toString(),
                              style: notextstyle,
                            ),
                            Text('KG',
                              style: labelTextStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(Icons.add),

                                    onPressed: () {
                                      setState(() {
                                        weight = weight + 1;
                                      });
                                    },
                                  ),

                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),

                                    child: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        weight = weight - 1;
                                      });
                                    },
                                  ),
                                ]
                            )
                          ]
                      ),
                      onpress: () {},
                    )
                ),
                Expanded(
                    child: ReusableCard(
                      colour: activecardcolour,
                      cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            Text('AGE',
                              style: labelTextStyle,
                            ),
                            Text(age.toString(),
                              style: notextstyle,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(Icons.add),

                                    onPressed: () {
                                      setState(() {
                                        age = age + 1;
                                      });
                                    },
                                  ),

                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),

                                    child: Icon(
                                      Icons.remove,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age = age - 1;
                                      });
                                    },
                                  ),
                                ]
                            )
                          ]
                      ),
                      onpress: () {},
                    )
                )
              ],
            ),
          ),

          Container(
            color: bottomcontainercolour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.00,
            child: TextButton(
              child: Center(

                  child: Text('Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.00,
                      )
                  )
              ),
              onPressed: (){

                cal calculation = cal(height: height,weight: weight);



                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                        bmiresult: calculation.calculateBMI(),
                        resulttext: calculation.getResult(),
                        int: calculation.getInt(),

                      ))
                );
              },
            ),

          ),


        ],
      ),

    );
  }
}


