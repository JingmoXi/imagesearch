import 'package:flutter/material.dart';

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
                }
            ),
            labelText: '搜索',
            border: OutlineInputBorder()
        ),
      ),
    );
  }
}

