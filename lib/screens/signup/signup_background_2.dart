import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class SignUpBackground2 extends StatelessWidget {
  final Widget child;

  const SignUpBackground2({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      key: WidgetKeys.signUpScreenBackground2Key,
      color: Colors.red[900],
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: child,
            bottom: 0,
          )
        ],
      ),
    );
  }
}
