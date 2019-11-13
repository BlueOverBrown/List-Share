import 'package:flutter/material.dart';
import '../widgets/list_meta_builder.dart';
import '../screens/add_list_sheet.dart';

class ListHomeScreen extends StatelessWidget {
  static const String navId = 'list_home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListMetaBuilder(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddListSheet());
          },
          child: Icon(Icons.add)),
    );
  }
}
