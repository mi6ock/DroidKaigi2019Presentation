import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:menubar/menubar.dart';

class SetMenubarWidget extends StatefulWidget {
  @override
  _SetMenubarWidgetState createState() => _SetMenubarWidgetState();
}

class _SetMenubarWidgetState extends State<SetMenubarWidget> {
  String menuLabel = "";
  Future setMenu() async {
    List<MenuItem> items = [];
    for (int i = 0; i < 3; i++) {
      MenuItem menuItem = MenuItem(
          label: "sample${i}",
          onClicked: () => setState(() => menuLabel = "sample${i}をクリックしました！"));

      items.add(menuItem);
    }

    Submenu itemAll = Submenu(label: "HelloWorld", children: items);
    setApplicationMenu([itemAll]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          menuLabel,
          style: smallTitleStyle,
        ),
        const SizedBox(
          height: 32,
        ),
        FlatButton(
          color: Colors.blueGrey,
          child: Text(
            "メニューをセット",
            style: smallTitleStyle,
          ),
          onPressed: () => setMenu(),
        ),
      ],
    );
  }
}
