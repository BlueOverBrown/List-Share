import 'package:flutter/material.dart';

class ListItem {
  String itemName;
  final int itemId;
  bool isDone;

  ListItem({
    @required this.itemName,
    this.isDone = false,
    this.itemId,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
