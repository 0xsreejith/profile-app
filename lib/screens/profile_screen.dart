import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user; // User data passed from HomeScreen

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for modern look
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Allows screen to be scrollable on smaller devices
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // Profile Image
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(user.imageUrl),
              ),
              const SizedBox(height: 20),

              // User's Name
              Text(
                user.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),

              // User's Email below name
              Text(
                user.email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              const SizedBox(height: 24),

              // Profile Information Cards
              ProfileInfoCard(label: "Phone", value: user.phone),
              ProfileInfoCard(label: "Email", value: user.email),
              const SizedBox(height: 24),

              // Go Back Button
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Go Back"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
