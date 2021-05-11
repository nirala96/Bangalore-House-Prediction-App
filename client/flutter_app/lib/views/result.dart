import 'package:flutter/material.dart';
import 'package:flutterapp/Components/reuseable_card.dart';

import '../Utilities/constants.dart';

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
          SizedBox(height: 50,),
          SingleChildScrollView(
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
            color: Colors.green,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Center(
                child: Text(
                  'Estimate Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
