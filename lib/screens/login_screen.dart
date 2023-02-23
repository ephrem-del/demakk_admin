import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void authenticate(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     Navigator.pop(context);
  //     Navigator.pushNamed(context, '/home_screen');
  //   }
  // }
  void authenticate(BuildContext context) {
    if (true) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/demakk_logo.png',
                  height: 250,
                  width: 250,
                ),
                amharic
                    ? SizedBox(
                        height: 50.0,
                        width: 200.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'የተጠቃሚ ስም ማስገባት ግዴታ ነው!';
                            }
                            return null;
                          },
                          controller: employeeNameController,
                          decoration: userInputDecoration(
                              'የተጠቃሚ ስም', const Icon(Icons.person)),
                        ),
                      )
                    : SizedBox(
                        height: 50.0,
                        width: 200.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                          controller: employeeNameController,
                          decoration: userInputDecoration(
                              'Employee Name', const Icon(Icons.person)),
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                amharic
                    ? SizedBox(
                        height: 50.0,
                        width: 200.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'የሚስጥር ቁጥር ማስገባት ግዴታ ነው';
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: userInputDecoration(
                              'የሚስጥር ቁጥር', const Icon(Icons.security)),
                        ),
                      )
                    : SizedBox(
                        height: 50.0,
                        width: 200.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: userInputDecoration(
                              'Password', const Icon(Icons.security)),
                        ),
                      ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    authenticate(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: amharic ? const Text('ግባ') : const Text('LOGIN'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
