//import 'dart:developer';
//
//import 'package:file_chooser/file_chooser.dart';
//import 'package:flutter/material.dart';
//import 'package:sembast/sembast.dart';
//import 'package:sembast/sembast_io.dart';
//
//class App extends StatefulWidget {
//  @override
//  _AppState createState() => _AppState();
//}
//
//class _AppState extends State<App> {
//  Database db;
//  String title = "";
//
//  Future<void> loads() async {
//    String dbPath = 'sample.db';
//    DatabaseFactory dbFactory = databaseFactoryIo;
//
//    db = await dbFactory.openDatabase(dbPath);
//  }
//
//  Future<void> puts() async {
//    await loads();
//    // unsounded store
//    var store = StoreRef<String, String>.main();
//
//    await store.record('title').put(db, 'Simple application');
//    title = await store.record('title').get(db);
//    setState(() {});
//  }
//
//  @override
//  void initState() {
//    puts();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            Text(title),
//            FlatButton(
//              child: Text("open"),
//              onPressed: () async {
//                showOpenPanel((results, path) {
//                  print('results: $results, path = $path');
//                });
//                log('open');
//              },
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

import 'dart:io';

import 'package:file_chooser/file_chooser.dart';
import 'package:flutter/material.dart';
import 'package:menubar/menubar.dart';

class LocalFilePickerPage extends StatefulWidget {
  @override
  _LocalFilePickerPageState createState() => _LocalFilePickerPageState();
}

class _LocalFilePickerPageState extends State<LocalFilePickerPage> {
  File file;

  Future setMenu() async {
    List<MenuItem> items = [];
    for (int i = 0; i < 3; i++) {
      MenuItem menuItem = MenuItem(label: "sample${i}");
      items.add(menuItem);
    }

    Submenu itemAll = Submenu(label: "HelloWorld", children: items);
    setApplicationMenu([itemAll]);
  }

  @override
  void initState() {
    // TODO: implement initState
    setMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试使用文件选择器'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('我选择的文件 : ${file?.path}'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.attach_file),
        onPressed: () async {
          showOpenPanel(
            (results, path) {
              print('results: $results, path = $path');
            },
            allowsMultipleSelection: true,
          );
        },
      ),
    );
  }
}
