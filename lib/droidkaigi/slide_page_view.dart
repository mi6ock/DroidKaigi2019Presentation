import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/slide_20191210.dart';

///
/// Main Slide Widget
///
class SlidePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    FocusNode focusNode = FocusNode();
    return Scaffold(
      body:
//
//      RawKeyboardListener(
//        focusNode: focusNode,
//        onKey: (key) {
//          log('Test $key');
//        },
//        child:

          const Slide20191210(),
//      ),
    );
  }
}
