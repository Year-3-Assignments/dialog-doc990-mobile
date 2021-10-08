import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CardExpireDateField extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final IconData icon;
  final String value;
  final bool isRequiredFeild;
  const CardExpireDateField({
    Key key,
    this.onChange,
    this.icon,
    this.value,
    this.text,
    this.isRequiredFeild,
  }) : super(key: key);
  @override
  _CardExpireDateFieldState createState() => _CardExpireDateFieldState(
        icon: icon,
        onChange: onChange,
        text: text,
        value: value,
        isRequiredFeild: isRequiredFeild,
      );
}

class _CardExpireDateFieldState extends State<CardExpireDateField> {
  final ValueChanged<String> onChange;
  final String text;
  final bool isNumber;
  final String value;
  final IconData icon;
  final bool isRequiredFeild;
  bool _isFieldValid;
  bool _isObscure = true;
  _CardExpireDateFieldState({
    Key key,
    this.onChange,
    this.isNumber,
    this.icon,
    this.value,
    this.text,
    this.isRequiredFeild,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: FONT_FAMILY_PRIMARY,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          TextFieldContainer(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _isFieldValid = false;
                  });
                  return null;
                } else {
                  setState(() {
                    _isFieldValid = true;
                  });
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: value,
              ),
              onChanged: onChange,
              style: TextStyle(
                fontFamily: FONT_FAMILY_PRIMARY,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              inputFormatters: [CreditCardExpirationDateFormatter()],
            ),
          ),
          isRequiredFeild != null &&
                  isRequiredFeild &&
                  _isFieldValid != null &&
                  !_isFieldValid
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    text + ' is required.',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 12,
                    ),
                  ),
                )
              : Text(''),
          SizedBox(
            height: size.height * 0.010,
          ),
        ],
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 1.5),
      width: size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}
