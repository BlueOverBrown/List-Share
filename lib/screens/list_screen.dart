import 'package:flutter/material.dart';
import '../widgets/list_builder.dart';

class ListScreen extends StatefulWidget {
  final String selectedListTitle;
  static const String navId = 'list_screen';
  ListScreen({Key key, this.selectedListTitle});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('List Home'),
          Expanded(
            child: ListBuilder(
              widget.selectedListTitle,
            ),
          ),
        ],
      ),
    );
  }
}
