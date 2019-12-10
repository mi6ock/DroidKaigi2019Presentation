import 'dart:io';

import 'package:file_chooser/file_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';

class FilePickerWidget extends StatefulWidget {
  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  var imageWidget;
  String completeText;
  var imageFile;
  Future<void> openPanel() async {
    showOpenPanel(
      (results, path) {
        if (results == FileChooserResult.ok) {
          imageFile = File(path[0]);

          setState(() {
            imageWidget =
                SizedBox(height: 600, width: 600, child: Image.file(imageFile));
          });
        }
      },
      initialDirectory: "/Users/amemiya/Desktop",
      allowsMultipleSelection: true,
      allowedFileTypes: ["png"],
    );
  }

  Future<void> savePanel() async {
    showSavePanel(
      (results, path) {
        if (results == FileChooserResult.ok && imageFile != null) {
          imageFile.copy(path[0]);
        } else {
          setState(() {
            completeText = "なんかダメです";
          });
        }
      },
      suggestedFileName: "rev12_final_新しいファイル.png",
      initialDirectory: "/Users/amemiya/Desktop",
      allowedFileTypes: ["png"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blueGrey,
                child: Text(
                  "open",
                  style: smallTitleStyle,
                ),
                onPressed: () async => openPanel(),
              ),
              const SizedBox(
                width: 32,
              ),
              FlatButton(
                color: Colors.blueGrey,
                child: Text(
                  "save",
                  style: smallTitleStyle,
                ),
                onPressed: () async => savePanel(),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          imageWidget ??
              Text(
                "何にもないよ!",
                style: smallTitleStyle,
              ),
          SizedBox(
            height: 32,
          ),
          Text(
            completeText ?? "",
            style: smallTitleStyle,
          ),
        ],
      ),
    );
  }
}
