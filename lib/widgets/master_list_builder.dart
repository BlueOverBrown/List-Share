import 'package:flutter/material.dart';
import '../models/list_title_card.dart';

class MasterListBuilder extends StatefulWidget {
  final List masterList;
  final Function deleteListCallback;

  MasterListBuilder({this.masterList, this.deleteListCallback});

  @override
  _MasterListBuilderState createState() => _MasterListBuilderState();
}

class _MasterListBuilderState extends State<MasterListBuilder> {
  void onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final item = widget.masterList.removeAt(oldIndex);
        widget.masterList.insert(newIndex, item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView(
        onReorder: onReorder,
        children: List.generate(widget.masterList.length, (index) {
          return ListTitleCard(
              selectedList: widget.masterList[index], key: Key('$index'), deleteListCallback: widget.deleteListCallback, index: index);
        }),
      ),
    );
  }
}
