import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_share/models/list_item.dart';
import '../models/list_item_tile.dart';
import '../listData.dart';

class ListViewBuilder extends StatelessWidget {
  final List displayedList;
  ListViewBuilder(this.displayedList);
  @override
  Widget build(BuildContext context) {
    List<Widget> displayedListItems = [];
    return Consumer<ListData>(builder: (context, listData, child) {
      for (var item in displayedList) {
        if (item is ListItem) {
          // this handles building list items vs the add button and textfield
          displayedListItems.add(ListItemTile(
              itemName: item.itemName,
              isChecked: item.isDone,
              checkboxCallback: (bool checkboxState) =>
                  listData.toggleChecked(item)));
        } else {
          displayedListItems.add(ListTile(
            leading: item.leading,
            title: item.title,
          ));
        }
      }
      return ListView(children: displayedListItems);
    });
  }
}
