import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:window_size/window_size.dart';

class ScreenUtilWidget extends StatefulWidget {
  @override
  _ScreenUtilWidgetState createState() => _ScreenUtilWidgetState();
}

class _ScreenUtilWidgetState extends State<ScreenUtilWidget> {
  Future getScreenInfo() async {
    var screenList = await getScreenList();
    var currentScreen = await getCurrentScreen();
    var windowInfo = await getWindowInfo();
    log("${screenList} ${currentScreen} ${windowInfo}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            color: Colors.blueGrey,
            child: Text(
              "getScreenInfo",
              style: smallTitleStyle,
            ),
            onPressed: () async => getScreenInfo(),
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
