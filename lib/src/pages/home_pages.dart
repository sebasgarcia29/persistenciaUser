import 'package:flutter/material.dart';
import 'package:preferenceuserapp/src/share_prefs/preferences_user.dart';
import 'package:preferenceuserapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenceUser();

  @override
  Widget build(BuildContext context) {

    prefs.setLastPage = HomePage.routeName;


    return Scaffold(
      appBar: AppBar(
        title: Text('User preference'),
        backgroundColor: prefs.colorSecundary ? Colors.black87 : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundary: ${prefs.colorSecundary} '),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('User Name: ${prefs.nameUser}'),
          Divider(),
        ],
      ),
    );
  }
}
