import 'package:flutter/material.dart';
import 'package:loginproject/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenHome extends StatelessWidget {
  const screenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 40, fontFamily: 'raleway'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showLogoutConfirmationDialog(context);
              },
              icon: Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            bool isEven = index % 2 == 0;
            Widget shapeWidget;
            if (isEven) {
              shapeWidget = ClipOval(
                child: Image.asset('assets/images/imag5.jpeg'),
              );
            } else {
              shapeWidget = ClipRRect(
                child: Image.asset('assets/images/imag5.jpeg'),
              );
            }
            return ListTile(
              title: Text('person $index'),
              subtitle: Text('message $index'),
              leading: shapeWidget,
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 10,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                signout(context);
              },
            ),
          ],
        );
      },
    );
  }
}
