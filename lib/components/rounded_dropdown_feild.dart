import 'package:flutter/material.dart';

class RoundedDropDownFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final bool isRequiredFeild;
  final bool isCountry;

  const RoundedDropDownFeild({
    Key key,
    this.isRequiredFeild,
    this.onChange,
    this.text,
    this.isCountry,
  }) : super(key: key);

  @override
  _RoundedDropDownFeildState createState() => _RoundedDropDownFeildState(
        isRequiredFeild: isRequiredFeild,
        onChange: onChange,
        text: text,
        isCountry: isCountry,
      );
}

class _RoundedDropDownFeildState extends State<RoundedDropDownFeild> {
  final ValueChanged<String> onChange;
  final String text;
  final bool isRequiredFeild;
  final bool isCountry;
  bool _isFieldValid;

  _RoundedDropDownFeildState({
    Key key,
    this.isRequiredFeild,
    this.onChange,
    this.text,
    this.isCountry,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Larsseit',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          DropDownContainer(
            child: isCountry != null && isCountry
                ? DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null) {
                        value = '';
                      }
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
                    items: countries
                        .map(
                          (item) => DropdownMenuItem(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontFamily: 'Larsseit',
                                fontSize: 20,
                              ),
                            ),
                            value: item,
                          ),
                        )
                        .toList(),
                    hint: Text(
                      'Select your country',
                      style: TextStyle(
                        fontFamily: 'Larsseit',
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: onChange,
                  )
                : DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null) {
                        value = '';
                      }
                      if (value != null && value.isEmpty) {
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
                    items: titles
                        .map(
                          (item) => DropdownMenuItem(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontFamily: 'Larsseit',
                                fontSize: 20,
                              ),
                            ),
                            value: item,
                          ),
                        )
                        .toList(),
                    hint: Text(
                      'Select your title',
                      style: TextStyle(
                        fontFamily: 'Larsseit',
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: onChange,
                  ),
          ),
          isRequiredFeild != null &&
                  isRequiredFeild &&
                  _isFieldValid != null &&
                  !_isFieldValid
              ? Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    text + ' is required!',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontFamily: 'Larsseit',
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

class DropDownContainer extends StatelessWidget {
  final Widget child;

  const DropDownContainer({
    Key key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

List<String> countries = [
  '🇱🇰 Sri Lanka',
  '🇮🇳 India',
  '🇧🇩 Bangaladesh',
  '🇵🇰 Pakistan',
  '🇳🇵 Nepal',
  '🇨🇳 China',
  '🇯🇵 Japan',
  '🇷🇺 Russia',
  '🇳🇿 New Zealand',
  '🇦🇺 Australia',
  '🇺🇸 United States',
  '🇬🇧 United Kingdom',
  '🇮🇹 Italy'
];

List<String> titles = [
  '🧔 Mr.',
  '👩 Mrs.',
  '🧑‍🦱 Mast.',
  '👱‍♀️ Miss',
  '👨‍⚕️ Dr.',
  '👨‍⚕️ Dr (Ms.)',
  '👩‍⚕️ Dr (Mrs.)',
  '👨‍🔬 Prof.',
  '👨‍🔬 Prof (Ms.)',
  '👩‍🔬 Prof (Mrs.)',
  '👶 Baby'
];