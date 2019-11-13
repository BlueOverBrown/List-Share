import 'package:flutter/material.dart';
import './models/list_item.dart';
import './screens/list_screen.dart';

class ListData extends ChangeNotifier {
  List listTitle;

  int listItemCount(List list) {
    return list.length;
  }

  void toggleChecked(ListItem listItem) {
    listItem.toggleDone();
    notifyListeners();
  }

  showList(String listTitle, context) {
    Navigator.pushNamed(context, ListScreen.navId);
  }

  Function buildNewListTileCallback(List listTitle, String listItem) {
    listTitle.add(listItem);
    notifyListeners();
    return buildNewListTileCallback(listTitle, listItem);
  }


 

  static List firstList = [
    ListItem(itemName: 'Pick Up Drycleaning', itemId: 1),
    ListItem(itemName: 'Do Laundry', itemId: 2),
    ListItem(itemName: 'Meal Prep', itemId: 3),
  ];
  static List secondList = [
    ListItem(itemName: 'Pick Up Rocks', itemId: 1),
    ListItem(itemName: 'Do Laundry', itemId: 2),
    ListItem(itemName: 'Meal Prep', itemId: 3),
    ListItem(itemName: 'Clean Bathroom', itemId: 4),
  ];

  final Map metaMap = {
    'First List': firstList,
    'Second List': secondList,
  };
}
