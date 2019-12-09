import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';

class IntroSlide extends StatelessWidget {
  const IntroSlide();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Desktop向け業務アプリでFlutterを使おうとした話',
              style: mediumTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
