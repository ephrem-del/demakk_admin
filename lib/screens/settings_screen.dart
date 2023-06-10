import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'drawer_component.dart';

List<String> language = ['አማ', 'EN'];

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          centerTitle: true,
        ),
        drawer: DrawerComponent(),
        body: Column(
          children: [
            Row(
              children: [
                Text(amharic ? 'ቋንቋ' : 'Language'),
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField(
                    value: selectedLanguage,
                    items: items,
                    onChanged: (selected) {
                      // final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        selectedLanguage = selected;
                        // if (selectedLanguage == 'አማ') {
                        //   // amharic = true;
                        //   await prefs.setBool('amharicOrNot', true);
                        //   Restart.restartApp();
                        // } else {
                        //   await prefs.setBool('amharicOrNot', false);
                        //   Restart.restartApp();
                        // }
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                setState(() async {
                  if (selectedLanguage == 'አማ') {
                    // amharic = true;
                    await prefs.setBool('amharicOrNot', true);
                    Restart.restartApp();
                  } else {
                    await prefs.setBool('amharicOrNot', false);
                    Restart.restartApp();
                  }
                });
              },
              child: Text(amharic ? 'ቅንብሮቹን አስተካክል' : 'Apply Settings'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? selectedLanguage = amharic ? language[0] : language[1];
List<DropdownMenuItem> items = language
    .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
    .toList();
