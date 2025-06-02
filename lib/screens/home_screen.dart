import 'package:flutter/material.dart';
import 'package:profile_app/screens/profile_screen.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data (in a real app, this would come from an API or database)
    final user = UserModel(
      name: 'Sreejith',
      email: 'csreejithofficial@gmail.com',
      phone: '+91 9876543210',
      imageUrl: 'assets/images/profile.jpeg',
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text("Welcome to Flutter Internship"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.person), // Button icon
          label: const Text('View Profile'), // Button text
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(fontSize: 16),
          ),
          onPressed: () {
            // Show loading dialog before navigating to profile
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent dismiss by tapping outside
              builder: (_) {
                // Wait for 2 seconds, then navigate to ProfileScreen
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context); // Close loading dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(user: user), // Pass user to next screen
                    ),
                  );
                });

                // Show a loading spinner during the delay
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
