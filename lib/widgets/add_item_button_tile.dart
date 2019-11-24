import 'package:flutter/material.dart';

class AddItemButtonTile extends StatelessWidget {
final Function openTextFieldCallback;
final Key key;
  AddItemButtonTile({this.openTextFieldCallback, this.key});

  @override
  Widget build(BuildContext context) {
    return (ListTile(
      leading: IconButton(
        onPressed:
          openTextFieldCallback,
        icon: Icon(Icons.add),
        iconSize: 33,
        alignment: Alignment.centerLeft,
      ),
      title: Text('Add'),
    ));
  }
}
