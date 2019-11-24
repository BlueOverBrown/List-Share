import 'package:flutter/material.dart';
import '../models/custom_list.dart';

class ListHomeBottomSheet extends StatefulWidget {
  final Function addListCallback;
  ListHomeBottomSheet({this.addListCallback});
  @override
  _ListHomeBottomSheetState createState() => _ListHomeBottomSheetState();
}

class _ListHomeBottomSheetState extends State<ListHomeBottomSheet> {
  final controller = TextEditingController();
  
  void addListNamer() {
    widget.addListCallback(CustomList(listTitle: controller.text, listContent: []));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.tealAccent, width: 2.0),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            FlatButton(
              onPressed: addListNamer,
              child: Text('Add List'),
            ),
            Text('Add More Stuff'),
          ],
        ));
  }
}
