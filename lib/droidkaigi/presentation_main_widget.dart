import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/slide_page_view.dart';

///
/// Entry point to the presentation
///
class PresentationMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlidePageView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
    );
  }
}
