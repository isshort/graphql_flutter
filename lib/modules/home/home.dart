import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage Title')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              return context.go('/sign/in');
            },
            child: const Text('Login page'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              return context.go('/sign/up');
            },
            child: const Text('Sign Up'),
          )
        ],
      ),
    );
  }
}
