import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class HomeBodyBackground extends StatelessWidget {
  final Widget child;

  const HomeBodyBackground({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      key: WidgetKeys.homeScreenBackgroundKey,
      children: <Widget>[
        ClipPath(
          clipper: HomeBodyClipper(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                scale: 1.5,
                alignment: Alignment.center,
                image: AssetImage('assets/images/home_background.png'),
              ),
              color: Colors.red[900],
            ),
            width: size.width,
            height: 365,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.asset(
                          'assets/images/home_top.png',
                          scale: 3,
                        ),
                        top: 53,
                        right: 0,
                      ),
                      Positioned(
                        child: Padding(
                          child: Text(
                            'Channel Your',
                            style: TextStyle(
                              fontFamily: 'Larsseit',
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: 80,
                            left: 25,
                          ),
                        ),
                        top: 0,
                        left: 0,
                      ),
                      Positioned(
                        child: Padding(
                          child: Text(
                            'Doctor with',
                            style: TextStyle(
                              fontFamily: 'Larsseit',
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: 120,
                            left: 25,
                          ),
                        ),
                        top: 0,
                        left: 0,
                      ),
                      Positioned(
                        child: Padding(
                          child: Image.asset(
                            'assets/images/logo.png',
                            scale: 2.2,
                          ),
                          padding: EdgeInsets.only(
                            top: 170,
                            left: 25,
                          ),
                        ),
                        top: 0,
                        left: 0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        child
      ],
    );
  }
}

class HomeBodyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
