import 'package:flutter/material.dart';
import 'package:preferenceuserapp/src/share_prefs/preferences_user.dart';
//Persistencia
import 'package:preferenceuserapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final styleTitle = TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold);

  late bool _colorSecundary;
  late int _gender;
  late String _name;

  late TextEditingController _textController;

  final prefs = PreferenceUser();

  @override
  void initState() {
    super.initState();
    prefs.setLastPage = SettingsPage.routeName;
    _colorSecundary = prefs.colorSecundary;
    _gender = prefs.gender;
    _textController = new TextEditingController(text: prefs.nameUser);
  }

  _setSelectedRadio(int valor) {
    prefs.setGender = valor;
    setState(() {
      _gender = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preference'),
        backgroundColor: _colorSecundary ? Colors.black87 : Colors.blue,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: styleTitle),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundary,
            title: Text('Color secundary'),
            onChanged: (value) {
              setState(() {
                prefs.setColorSecundary = value;
                _colorSecundary = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: _gender,
            onChanged: (value) {
              value as int;
              _setSelectedRadio(value);
            },
          ),
          RadioListTile(
            value: 2,
            title: Text('Female'),
            groupValue: _gender,
            onChanged: (value) {
              value as int;
              _setSelectedRadio(value);
            },
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  helperText: 'Name of person with used the phone'),
              onChanged: (value) {
                setState(() {
                  prefs.setNameUser = value;
                  _name = value;
                });
              },
            ),
          ),
        ],
      ),
      drawer: MenuWidget(),
    );
  }
}
