import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DataSerializationWidget extends StatefulWidget {
  @override
  _DataSerializationWidgetState createState() =>
      _DataSerializationWidgetState();
}

class _DataSerializationWidgetState extends State<DataSerializationWidget> {
  Database db;
  String title = "";
  var store;
  String rawText = "";

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

  Future<void> load() async {
    title = await store.record('text').get(db);
    setState(() {});
  }

  @override
  void initState() {
    loadDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: smallTitleStyle,
        ),
        const SizedBox(
          height: 32,
        ),
        FlatButton(
          color: Colors.blueGrey,
          child: Text(
            "load",
            style: smallTitleStyle,
          ),
          onPressed: () => load(),
        ),
      ],
    );
  }
}
