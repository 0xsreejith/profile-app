import 'package:flutter/material.dart';
import 'package:profile_app/screens/profile_screen.dart';

import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(
      name: 'Sreejith',
      email: 'csreejithofficial@gmail.com',
      phone: '+91 9876543210',
      imageUrl: 'assets/images/profile.jpeg',
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to Flutter Internship")),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Profile'),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context); 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(user: user),
                    ),
                  );
                });
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
