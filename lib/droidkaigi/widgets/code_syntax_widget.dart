import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class CodeSyntaxWidget extends StatelessWidget {
  final code;
  final lang;
  final title;

  const CodeSyntaxWidget({Key key, this.code, this.lang, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: smallTitleStyle,
        ),
        const SizedBox(
          height: 72,
        ),
        SizedBox(
          width: 800,
          height: 400,
          child: SyntaxView(
            code: code,
            syntax: lang,
            syntaxTheme: SyntaxTheme.dracula(),
            withZoom: true,
            withLinesCount: true,
          ),
        ),
      ],
    );
  }
}
