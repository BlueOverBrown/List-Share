import 'package:flutter/material.dart';
import 'package:list_share/models/list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/list_item_tile.dart';
import '../models/custom_list.dart';
import '../widgets/text_field_tile.dart';
import '../widgets/add_item_button_tile.dart';

class ListBuilder extends StatefulWidget {
  final CustomList displayedList;

  ListBuilder(this.displayedList);

  @override
  _ListBuilderState createState() => _ListBuilderState(displayedList);
}

class _ListBuilderState extends State<ListBuilder> {
  CustomList displayedList;
  _ListBuilderState(this.displayedList);

  void toggleChecked(checkboxState, index) {
    setState(() {
      displayedList.listContent[index].isDone = checkboxState;
      print('checkbox toggled');
    });
  }

  void openTextField() {
    if (!displayedList.listContent.any((item) => item is TextFieldTile)) {
      //checks for currently open TextFields to avoid duplicates
      setState(() {
        displayedList.listContent.insert(
          displayedList.listContent.length - 1,
          TextFieldTile(
            addItemCallback: addItem,
            key: Key('displayedList.listContent.length - 1'),
          ), //no access to index, had to improvise
        );
      });
    }
  }

  Future<bool> isTextFieldClosed() {
    // prevents popping with open text field
    if (displayedList.listContent.any((item) => item is TextFieldTile)) {
      removeTextField();
    } else {
      Navigator.pop(context, true);
    }
  }

  void addItem(value) {
    // Takes name of new list item if not null
    if (value != null) {
      setState(() {
        removeTextField();
        displayedList.listContent.insert(
            // insert new item to the end of the list
            displayedList.listContent.length - 1,
            ListItem(
              itemName: value,
            ));
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      displayedList.listContent.removeAt(index);
    });
  }

  void removeTextField() {
    setState(() {
      displayedList.listContent.removeAt(displayedList.listContent.length - 2);
    });
  }

  @override
  void initState() {
    if (!displayedList.listContent.any((item) => item is AddItemButtonTile)) {
      displayedList.listContent.add(AddItemButtonTile(
          openTextFieldCallback: openTextField,
          key: Key('${displayedList.listContent.length}')));
    }
    super.initState();
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final item = displayedList.listContent.removeAt(oldIndex);
        displayedList.listContent.insert(newIndex, item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: isTextFieldClosed, // prevents popping with open text field
      child: Column(
        children: <Widget>[
          Expanded(
              child: ReorderableListView(
                  onReorder: onReorder,
                  children:
                      List.generate(displayedList.listContent.length, (index) {
                    if (displayedList.listContent[index] is ListItem) {
                      // turns user created ListItems into UI ListItemTiles
                      return ListItemTile(
                        itemName: displayedList.listContent[index].itemName,
                        isChecked: displayedList.listContent[index].isDone,
                        checkboxCallback: toggleChecked,
                        deleteItemCallback: deleteItem,
                        // popUpCallback: showPopUpMenu,
                        index: index,
                        key: Key('$index'),
                      );
                    }
                    if (displayedList.listContent[index] is AddItemButtonTile) {
                      return AddItemButtonTile(
                        openTextFieldCallback: openTextField,
                        key: Key('$index'),
                      );
                    }
                    if (displayedList.listContent[index] is TextFieldTile) {
                      return displayedList.listContent[
                          index]; //Parameters are passed in on addition to list
                    }
                  })))
        ],
      ),
    );
  }
}
