import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Successful!'),
        ),
        body: const Center(
          child: Text('Hi! My Name is Diane Lane P. Cabanilla'),
        ),
      ),
    );
  }
}
