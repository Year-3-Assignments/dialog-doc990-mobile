import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function action;
  final Color color;
  final double height;
  final double width;
  final IconData icon;
  final double iconSize;
  final Color textColor;
  final double fontSize;

  const RoundedButton({
    Key key,
    this.text,
    this.action,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.icon,
    this.iconSize,
    this.fontSize,
  }) : super(key: key);
  @override
  _RoundedButtonState createState() => _RoundedButtonState(
        action: action,
        height: height,
        icon: icon,
        text: text,
        textColor: textColor,
        width: width,
        color: color,
        fontSize: fontSize,
        iconSize: iconSize,
      );
}

class _RoundedButtonState extends State<RoundedButton> {
  final String text;
  final Function action;
  final Color color;
  final double height;
  final double width;
  final IconData icon;
  final double iconSize;
  final Color textColor;
  final double fontSize;

  _RoundedButtonState({
    this.text,
    this.action,
    this.height,
    this.width,
    this.icon,
    this.textColor,
    this.color,
    this.fontSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 22),
          color: color,
          onPressed: action,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: SF_PRO_FONT,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
