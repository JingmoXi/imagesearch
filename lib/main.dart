import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search Demo'),
        ),
        body: SearchBar(),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(Icons.search),
            suffixIcon: searchController.text.isEmpty
                ? null
                : IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                  _clearSearch();
                }
            ),
            labelText: '搜索',
            border: OutlineInputBorder()
        ),
      ),
    );
  }

    Future<void> _clearSearch() async {

    Process.run("");

    print('清空内容数据和信息');
    MethodChannel channel = MethodChannel('samples.flutter.io/say_hello');
    //
    String greeting = await channel.invokeMethod('say_hello', {'name': 'Flutter'});
    print(greeting);
// Prints '{"message": "Hello Flutter!"}'


  }

}

