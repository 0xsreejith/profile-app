import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(user.imageUrl),
            ),
            const SizedBox(height: 24),
            ProfileInfoCard(label: "Name", value: user.name),
            ProfileInfoCard(label: "Email", value: user.email),
            ProfileInfoCard(label: "Phone", value: user.phone),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
