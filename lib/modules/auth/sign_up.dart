import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUpPage Title')),
      body: ElevatedButton(
        onPressed: () {
          return context.go('/');
        },
        child: const Text('Home Page form signup'),
      ),
    );
  }
}
