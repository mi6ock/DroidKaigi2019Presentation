import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';

///
/// Base widget for showing the slide view.
///
class BaseSlideWidget extends StatelessWidget {
  /// Main content to be shown on the screen
  final Widget mainContentWidget;

  /// background color of the screen
  final Color backgroundColor;

  const BaseSlideWidget(
      {this.mainContentWidget, this.backgroundColor = mainBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(child: mainContentWidget),
          Container(
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  '2019/12/10',
                  style: bottomBarTextStyle,
                ),
                Text(
                  'Flutter Meet Up #13',
                  style: bottomBarTextStyle,
                ),
                Text(
                  '@mi6ock',
                  style: bottomBarTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
