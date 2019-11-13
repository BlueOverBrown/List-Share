import 'package:flutter/material.dart';

class ListItemTile extends StatelessWidget {
  final String itemName;
  final int itemId;
  final Function checkboxCallback;
  final bool isChecked;

  ListItemTile(
      {@required this.itemName,
      this.itemId,
      this.checkboxCallback,
      this.isChecked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: UniqueKey(),
      leading: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      title: Text(itemName,
          style: isChecked
              ? TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough)
              : null),
      trailing: Icon(Icons.more_vert),
    );
  }
}
