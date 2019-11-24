import 'package:flutter/material.dart';
import './list_home_bottom_sheet.dart';

class AddListFloatingActionButton extends StatelessWidget {
  final Function addListCallback;
  AddListFloatingActionButton({this.addListCallback});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => ListHomeBottomSheet(
                  addListCallback: addListCallback,
                ));
      },
      child: Icon(Icons.add),
    );
  }
}
