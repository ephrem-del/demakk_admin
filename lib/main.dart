import 'package:demakk_admin/screens/employee_management_screen.dart';
import 'package:demakk_admin/screens/settings_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:shared_preferences/shared_preferences.dart';

bool amharic = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  amharic = prefs.getBool('amharicOrNot') == null
      ? true
      : prefs.getBool('amharicOrNot')!;
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.red,
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                restorationScopeId: 'app',
                theme: ThemeData.light().copyWith(
                  primaryColor: primaryColor,
                  appBarTheme: const AppBarTheme(
                    color: primaryColor,
                  ),
                ),
                routes: {
                  '/': (context) {
                    return const SplashScreen();
                  },
                  '/home_screen': (context) {
                    return const HomeScreen();
                  },
                  'login_screen': (context) {
                    return const LoginScreen();
                  },
                  'settings_screen': (context) {
                    return SettingsScreen();
                  },
                  'employee_management_screen': (context) {
                    return EmployeeManagementScreen();
                  }
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
