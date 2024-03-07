import 'package:bmi/constants.dart';
import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/reusable_card.dart';

class Results extends StatelessWidget{

  Results({required this.bmiresult,required this.resulttext,required this.int});

  final String bmiresult;
  final String resulttext;
  final String int;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(

            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                style: restextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activecardcolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resulttext.toUpperCase(),
                  style: res2textstyle,
                  ),
                  Text(bmiresult,
                    style: res3textstyle,
                  ),
                  Text(int,
                    textAlign: TextAlign.center,
                    style: res4textstyle,
                  ),

                ],
              ),
              onpress: (){},
            ),
          ),
          Container(
            color: bottomcontainercolour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.00,
            child: TextButton(
              child: Center(

                  child: Text('Recalculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.00,
                      )
                  )
              ),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => BMICalculator())
                );
              },
            ),

          ),
        ],
      )
    );
  }


}