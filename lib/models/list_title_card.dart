import 'package:flutter/material.dart';
import '../screens/list_screen.dart';
import '../models/custom_list.dart';

class ListTitleCard extends StatelessWidget {
  final CustomList selectedList;
  final Key key;
  final deleteListCallback;
  final int index;
// final DateTime created;
// final DateTime modified;
// final String creator;
// final String modifier;

  ListTitleCard(
      {@required this.selectedList,
      this.deleteListCallback,
      this.key,
      this.index});

  void deleteListIndexer() {
    deleteListCallback(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Text(selectedList.listTitle),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ListScreen.navId,
                  arguments: selectedList);
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                      'Do you want to delete \"${selectedList.listTitle}\"'),
                  content: Column(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Yes'),
                        onPressed: deleteListIndexer,
                      ),
                      FlatButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
