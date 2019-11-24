import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/list_home.dart';
import './screens/list_screen.dart';
import './screens/add_list_sheet.dart';

void main() => runApp(ListShare());

class ListShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List Share',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == ListScreen.navId) {
            final selectedList = settings.arguments;
            return MaterialPageRoute(builder: (context) {
              return ListScreen(
                selectedList: selectedList,
              );
            });
          }
        },
        initialRoute: WelcomeScreen.navId,
        routes: {
          WelcomeScreen.navId: (context) => WelcomeScreen(),
          ListHome.navId: (context) => ListHome(),
          AddListSheet.navId: (context) => AddListSheet(),
        });
  }
}
