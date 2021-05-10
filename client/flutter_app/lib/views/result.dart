import 'package:flutter/material.dart';
import 'package:flutterapp/Components/reusable_card.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    @required this.bmiResult,
  });

  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Result in Lakhs',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                ],
              ),
            ),
          ),
          Card(
              child: ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            title: Text("Estimate again"),
          ))
        ],
      ),
    );
  }
}
