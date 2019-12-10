import 'package:flexible_fitted_box/flexible_fitted_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as markD;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  String rawText = "";

  Database db;
  String title = "";
  var store;

  Future<void> loadDB() async {
    String dbPath = 'sample.db';
    DatabaseFactory dbFactory = databaseFactoryIo;

    db = await dbFactory.openDatabase(dbPath);
    store = StoreRef<String, String>.main();
  }

  Future<void> save(String text) async {
    if (db != null) {
      await store.record('text').put(db, text);
      setState(() {});
    }
  }

  @override
  void initState() {
    loadDB();
    super.initState();
  }

  @override
  void dispose() {
    db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var htmld = markD.markdownToHtml(rawText, inlineSyntaxes: [
      markD.InlineHtmlSyntax(),
    ]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlexibleFittedBox(
                      child: TextField(
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          disabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          labelText: '内容',
                          labelStyle: smallTitleStyle,
                          suffixStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: smallTitleStyle,
                        minLines: 50,
                        maxLines: 51,
                        onChanged: (value) {
                          setState(() {
                            rawText = value;
                          });
                        },
                      ),
                      heightFactor: 1,
                      widthFactor: 1),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Html(
                    data: htmld,
                    defaultTextStyle: smallTitleStyle,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        FlatButton(
          color: Colors.blueGrey,
          child: Text(
            "save",
            style: smallTitleStyle,
          ),
          onPressed: () => save(rawText),
        ),
      ],
    );
  }
}
