import 'package:flutter/material.dart';

class TextFieldTile extends StatelessWidget {
  final Function addItemCallback;
  final Key key;
  TextFieldTile({
    @required this.addItemCallback,
this.key
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: null,
        value: false,
      ),
      title: Row(children: <Widget>[
        Expanded(
          child: TextField(
            onSubmitted: addItemCallback,
            autofocus: true,
            
            // onEditingComplete: removeTextfieldCallback,
          ),
        ),
      ]),
    );
  }
}
