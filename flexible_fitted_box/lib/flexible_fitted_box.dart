library flexible_fitted_box;

import 'dart:math';

import 'package:flutter/material.dart';

///If you use a widget that fits FittedBox etc.
///with a widget that does not have maxHeight or maxHeight
///constraints like row or column, an error occurs.
///This widget sets the size at that time and displays
///it with the set [heightFactor] and [widthFactor] taken into account.

class FlexibleFittedBox extends StatelessWidget {
  final Widget child;
  final double heightFactor;
  final double widthFactor;
  final double height;
  final double width;

  const FlexibleFittedBox(
      {Key key,
      @required this.child,
      @required this.heightFactor,
      @required this.widthFactor,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Size size = MediaQuery.of(context).size;
        double fixedHeight =
            min(size.height * heightFactor, constraints.maxHeight);
        double fixedWidth = min(size.width * widthFactor, constraints.maxWidth);

        ///
        ///
        /// Example
        ///
        /// ```dart
        /// Column(
        ///   children: <Widget>[
        ///     Row(
        ///       children: <Widget>[
        ///          child(),
        ///       ],
        ///   ],
        /// );
        ///

        if (constraints.maxWidth == double.infinity &&
            constraints.maxWidth == double.infinity) {
          return SizedBox(
            height: fixedHeight,
            width: fixedWidth,
            child: child,
          );
        } else if (constraints.maxHeight == double.infinity) {
          return SizedBox(
            height: height ?? fixedWidth,
            width: fixedWidth,
            child: child,
          );
        } else if (constraints.maxWidth == double.infinity) {
          return SizedBox(
            height: fixedHeight,
            width: width ?? fixedHeight,
            child: child,
          );
        } else {
          return SizedBox(
            height: fixedHeight,
            width: fixedWidth,
            child: child,
          );
        }
      },
    );
  }
}
