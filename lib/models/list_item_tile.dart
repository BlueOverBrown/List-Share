import 'package:flutter/material.dart';

class ListItemTile extends StatelessWidget {
  final String itemName;
  final bool isChecked;
  final Function checkboxCallback;
  final int index;
  final Key key;
  final Function popUpCallback;
  final Function deleteItemCallback;

  ListItemTile(
      {@required this.itemName,
      this.key,
      this.index,
      @required this.isChecked,
      this.checkboxCallback,
      this.popUpCallback,
      this.deleteItemCallback});
  popUpCallbackIndexer() {
    popUpCallback(itemName);
  }

  checkboxCallbackIndexer(bool isChecked) {
    // adds index to checkboxCallback,
    checkboxCallback(isChecked, index); // so that the list can be updated,
  } // onChanged can only send a bool.

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isChecked,
        onChanged: checkboxCallbackIndexer,
      ),
      title: Text(itemName,
          style: isChecked
              ? TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough)
              : null),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              
              title: Text('Do you want to delete \"$itemName\"'),
              content: Column(
                children: <Widget>[
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      deleteItemCallback(index);
                      Navigator.pop(context);
                    },
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
    );
  }
}
