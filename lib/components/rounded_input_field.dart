import 'package:flutter/material.dart';

class RoundedTextFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final bool isPassword;
  final String text;
  final bool isNumber;
  final bool isPhoneNumber;
  const RoundedTextFeild({
    Key key,
    this.onChange,
    this.isPassword,
    this.isNumber,
    this.text,
    this.isPhoneNumber = false,
  }) : super(key: key);
  @override
  _RoundedTextFeildState createState() => _RoundedTextFeildState(
        isNumber: isNumber,
        isPassword: isPassword,
        isPhoneNumber: isPhoneNumber,
        onChange: onChange,
        text: text,
      );
}

class _RoundedTextFeildState extends State<RoundedTextFeild> {
  final ValueChanged<String> onChange;
  final bool isPassword;
  final String text;
  final bool isNumber;
  final bool isPhoneNumber;
  bool _isObscure = true;
  _RoundedTextFeildState({
    Key key,
    this.onChange,
    this.isPassword,
    this.isNumber,
    this.text,
    this.isPhoneNumber = false,
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
              fontFamily: 'Larsseit',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          TextFieldContainer(
            child: TextField(
              obscureText: isPassword ? _isObscure : false,
              maxLength: isPhoneNumber ? 10 : 200,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              style: TextStyle(fontFamily: 'Larsseit', fontSize: 20),
              onChanged: onChange,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.red[600],
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
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
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
