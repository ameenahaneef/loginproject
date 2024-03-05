import 'package:flutter/material.dart';
import 'package:loginproject/main.dart';
import 'package:loginproject/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login Screen',
            style: TextStyle(fontSize: 30, fontFamily: 'raleway'),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login(context);
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Login')),
                ],
              ),
            ),
          ),
        ));
  }

  void login(BuildContext ctx) async {
    final predefinedUsername = 'ameena';
    final predefinedPassword = '1234';

    if (usernameController.text == predefinedUsername &&
        passwordController.text == predefinedPassword) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return screenHome();
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
            title: Text('error'),
            content: Text('invalid username and password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context1).pop();
                },
                child: Text('ok'),
              ),
            ],
          );
        },
      );
    }
  }
}
