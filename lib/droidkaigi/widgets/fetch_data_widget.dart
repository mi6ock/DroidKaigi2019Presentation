import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';

class FetchDataWidget extends StatefulWidget {
  @override
  _FetchDataWidgetState createState() => _FetchDataWidgetState();
}

class _FetchDataWidgetState extends State<FetchDataWidget> {
  var posts;

  Future<void> fetch() async {
    try {
      Response response = await Dio().get(
          "https://jsonplaceholder.typicode.com/albums/1/photos?_limit=10");
      posts = SizedBox(
        height: 700,
        width: 700,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _item(response.data[index]["title"],
                  response.data[index]["thumbnailUrl"]);
            },
            itemCount: response.data.length),
      );
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blueGrey,
            child: Text(
              "fetch",
              style: smallTitleStyle,
            ),
            onPressed: () => fetch(),
          ),
          const SizedBox(
            height: 32,
          ),
          posts ??
              Text(
                "何にもないよ!",
                style: smallTitleStyle,
              )
        ],
      ),
    );
  }

  Widget _item(String title, String url) {
    return SizedBox(
      height: 600,
      width: 400,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: extraSmallTitleStyle,
          ),
          Image.network(
            url,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
