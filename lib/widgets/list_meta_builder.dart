import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../listData.dart';
import '../models/list_meta_card.dart';

class ListMetaBuilder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Consumer<ListData>(builder: (context, listData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          String listTitle = listData.metaMap.keys.elementAt(index);
          return ListMetaCard(
            listTitle: listTitle,
          );
        },
        itemCount: listData.metaMap.length,
      );
    });
  }
}
