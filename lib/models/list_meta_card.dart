import 'package:flutter/material.dart';
import '../screens/list_screen.dart';

class ListMetaCard extends StatelessWidget {
  final String listTitle;
// final DateTime created;
// final DateTime modified;
// final String creator;
// final String modifier;

  ListMetaCard({this.listTitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: <Widget>[
        Text(listTitle),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ListScreen.navId,
                arguments: listTitle);
          },
          icon: Icon(
            Icons.edit,
          ),
        )
      ]),
    );
  }
}
