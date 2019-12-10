import 'dart:developer';

import 'package:flexible_fitted_box/flexible_fitted_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';

class KeyboardListenerWidget extends StatefulWidget {
  KeyboardListenerWidget();

  @override
  _RawKeyboardListenerState createState() => new _RawKeyboardListenerState();
}

class _RawKeyboardListenerState extends State<KeyboardListenerWidget> {
  FocusNode _focusNode = new FocusNode();
  String keyLabel = "";
  @override
  initState() {
    super.initState();
  }

  handleKey(RawKeyEventDataMacOs key) {
    setState(() {
      keyLabel = "${key.logicalKey.debugName}だよ!";
      log(keyLabel);
    });
  }

  @override
  void dispose() {
    _focusNode = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawKeyboardListener(
          focusNode: _focusNode,
          autofocus: true,
          onKey: (key) => handleKey(key.data),
          child: FlexibleFittedBox(
            heightFactor: 0.9,
            widthFactor: 0.9,
            child: Center(
              child: Text(
                keyLabel,
                style: smallTitleStyle,
              ),
            ),
          )),
    );
  }
}
