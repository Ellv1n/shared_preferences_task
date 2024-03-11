import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencestask/logout_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('zekuska milaska nunaska'),
            ElevatedButton(
              child: Text('login'),
              onPressed: () async{
                SharedPreferences preferences = await SharedPreferences.getInstance();
                  await preferences
            .setBool('logined', true)
            .then((_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LogoutPage(),
                  ),
                ));
                await preferences.remove('logouted');
              },
            )
          ],
        ),
      ),
    );
  }
}
