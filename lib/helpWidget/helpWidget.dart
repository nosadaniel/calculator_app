import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({@required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(color: Colors.pink),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({@required this.label, this.color});
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 14, color: color),
    );
  }
}

class IncrementalButton extends StatelessWidget {
  IncrementalButton({@required this.buttonIcon, @required this.onPressed});
  final Widget buttonIcon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 2.0,
      onPressed: onPressed,
      child: buttonIcon,
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      shape: CircleBorder(),
      fillColor: Colors.white30,
    );
  }
}

class ReusableContainer extends StatelessWidget {
  ReusableContainer({this.color, this.childCard});
  final Color color;
  final Widget childCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
    );
  }
}
