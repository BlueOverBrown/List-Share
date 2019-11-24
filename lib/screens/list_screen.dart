import 'package:flutter/material.dart';
import '../widgets/list_builder.dart';
import '../models/custom_list.dart';


class ListScreen extends StatelessWidget {
  final CustomList selectedList;
  static const String navId = 'list_screen';
  ListScreen({this.selectedList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('List Home'),
          Expanded(
            child: ListBuilder(
              selectedList,
            ),
          ),
        ],
      ),
    );
  }
}
