import 'package:flutter/material.dart';
import '../models/list_item.dart';
import '../models/custom_list.dart';
import '../widgets/master_list_builder.dart';
import '../widgets/add_list_floating_action_button.dart';

class ListHome extends StatefulWidget {
  static const String navId = 'list_home';

  static CustomList firstList =
      CustomList(listTitle: 'First List', listContent: [
    ListItem(itemName: 'Pick Up Drycleaning'),
    ListItem(itemName: 'Do Laundry'),
    ListItem(itemName: 'Meal Prep'),
  ]);

  static CustomList secondList =
      CustomList(listTitle: 'Second List', listContent: [
    ListItem(itemName: 'Pick Up Rocks'),
    ListItem(itemName: 'Do Laundry'),
    ListItem(itemName: 'Meal Prep'),
    ListItem(itemName: 'Clean Bathroom'),
  ]);

  @override
  _ListHomeState createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  final List masterList = [
    ListHome.firstList,
    ListHome.secondList,
  ];

  int listItemCount(List list) {
    return list.length;
  }

  void addList(listToAdd) {
    setState(() {
      masterList.add(listToAdd);
    });
    Navigator.pop(context);
  }
void deleteList(listToDelete) {
  setState(() {
    masterList.removeAt(listToDelete);
  });
  Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Text('Lists'),
            MasterListBuilder(
              masterList: masterList,
              deleteListCallback: deleteList,
            ),
          ],
        ),
        floatingActionButton: AddListFloatingActionButton(
          addListCallback: addList,
        ));
  }
}
