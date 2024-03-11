import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencestask/login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello Logout Page'),
            ElevatedButton(
              child: Text('logout'),
              onPressed: () async{
                SharedPreferences preferences = await SharedPreferences.getInstance();
                  await preferences
            .setBool('logouted', true)
            .then((_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LoginPage(),
                  ),
                ));
                await preferences.remove('logined');
              },
            )
          ],
        ),
      ),
    );
  }
}
