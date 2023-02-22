import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
                  appBarTheme: AppBarTheme(
                    color: primaryColor,
                  ),
                ),
                routes: {
                  '/': (context) {
                    return SplashScreen();
                  },
                  '/home_screen': (context) {
                    return HomeScreen();
                  },
                  'login_screen': (context) {
                    return LoginScreen();
                  }
                },
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
