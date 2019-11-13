import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './listData.dart';
import './screens/welcome_screen.dart';
import './screens/list_home_screen.dart';
import './screens/list_screen.dart';
import './screens/add_list_sheet.dart';

void main() => runApp(ListShare());

class ListShare extends StatelessWidget {
  //this might be fine
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListData>(
      builder: (context) => ListData(),
      child: MaterialApp(
          title: 'List Share',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          onGenerateRoute: (settings) {
            if (settings.name == ListScreen.navId) {
              final selectedListTitle = settings.arguments;
              return MaterialPageRoute(builder: (context) {
                return ListScreen(
                  selectedListTitle: selectedListTitle,
                );
              });
            }
          },
          initialRoute: WelcomeScreen.navId,
          routes: {
            WelcomeScreen.navId: (context) => WelcomeScreen(),
            ListHomeScreen.navId: (context) => ListHomeScreen(),
            // ListScreen.navId: (context) => ListScreen(),
            AddListSheet.navId: (context) => AddListSheet(),
          }),
    );
  }
}
