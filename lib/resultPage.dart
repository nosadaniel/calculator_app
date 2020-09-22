import 'package:flutter/material.dart';
import 'helpWidget/helpWidget.dart';

const Color activeColor = Color(0xFF11133f);
const Color inactiveColor = Color(0xFF06082e);

class ResultHomePage extends StatelessWidget {
  ResultHomePage({
    @required this.bmi,
    @required this.status,
    @required this.interpretation,
  });
  final String status;
  final String bmi;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableContainer(
              color: Color(0xFF11133f),
              childCard: Center(
                child: Text(
                  bmi,
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableContainer(
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Healthy' ? Colors.green : Colors.red,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomContainer(label: 'Recalculate'),
          ),
        ],
      ),
    );
  }
}
