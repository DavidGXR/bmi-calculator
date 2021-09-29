import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData iconData;
  final Function onTap;

  RoundIconButton({this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      elevation: 6.0,
      onPressed: () {
        onTap();
      },
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}