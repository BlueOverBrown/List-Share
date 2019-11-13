import 'package:flutter/material.dart';
import 'package:list_share/models/list_item.dart';
import 'package:provider/provider.dart';
import '../listData.dart';
import './list_view_builder.dart';

class ListBuilder extends StatefulWidget {
  final String listTitle;

  ListBuilder(this.listTitle);

  @override
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListData>(builder: (context, listData, child) {
      if (listData.metaMap[widget.listTitle].elementAt(listData
                  .metaMap[widget.listTitle].length -
              1) //if add Item list tile is not the last item, add an add Item List Tile
          is ListItem) {
        listData.metaMap[widget.listTitle].add(ListTile(
          leading: IconButton(
            key: UniqueKey(),
            onPressed: () {
              setState(() {
                listData.metaMap[widget.listTitle].insert(
                    // open TextField when pressing add Item List Tile
                    listData.metaMap[widget.listTitle].length - 1,
                    ListTile(
                      leading: Checkbox(
                        onChanged: null,
                        value: false,
                      ),
                      title: Row(children: <Widget>[
                        Expanded(
                          child: TextField(
                              key: UniqueKey(),
                              onSubmitted: (value) {
                                // Takes name of new list item
                                if (value != null && value != '') {
                                  listData.metaMap[widget.listTitle].removeAt(
                                      // remove the TextField
                                      listData.metaMap[widget.listTitle]
                                              .length -
                                          2);
                                  listData.metaMap[widget.listTitle].insert(
                                      // add new item to the list
                                      listData.metaMap[widget.listTitle]
                                              .length -
                                          1,
                                      ListItem(
                                        itemName: value,
                                      ));
                                }
                              },
                              autofocus: true),
                        ),
                      ]),
                    ));
              });
            },
            icon: Icon(Icons.add),
            iconSize: 33,
            alignment: Alignment.centerLeft,
          ),
          title: Text('Add a Task'),
        ));
      } else {
        if (listData.metaMap[widget.listTitle]
            .elementAt(listData.metaMap[widget.listTitle].length - 1)
            .leading is! IconButton) {
          listData.metaMap[widget.listTitle].add(ListTile(
            leading: IconButton(
              onPressed: () {
                setState(() {
                  listData.metaMap[widget.listTitle].insert(
                      // open TextField when pressing add Item List Tile
                      listData.metaMap[widget.listTitle].length - 1,
                      ListTile(
                        leading: Checkbox(
                          onChanged: null,
                          value: false,
                        ),
                        title: Row(children: <Widget>[
                          Expanded(
                            child: TextField(
                                onSubmitted: (value) {
                                  // Takes name of new list item
                                  if (value != null && value != '') {
                                    listData.metaMap[widget.listTitle].removeAt(
                                        // remove the TextField
                                        listData.metaMap[widget.listTitle]
                                                .length -
                                            2);
                                    listData.metaMap[widget.listTitle].insert(
                                        // add new item to the list
                                        listData.metaMap[widget.listTitle]
                                                .length -
                                            1,
                                        ListItem(
                                          itemName: value,
                                        ));
                                  }
                                },
                                autofocus: true),
                          ),
                        ]),
                      ));
                });
              },
              icon: Icon(Icons.add),
              iconSize: 33,
              alignment: Alignment.centerLeft,
            ),
            title: Text('Add a Task'),
          ));
        }
      }

      return ListViewBuilder(listData.metaMap[widget.listTitle]);
    });
  }
}
