import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final String label; // The type of information (e.g., "Email", "Phone")
  final String value; // The actual data/value

  const ProfileInfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Subtle shadow for depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for modern look
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          _getIconForLabel(label), // Choose icon based on label
          color: Colors.blueAccent,
        ),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(value), // Display the user’s value/info
      ),
    );
  }

  // Helper method to return an icon based on the type of label
  IconData _getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'phone':
        return Icons.phone;
      case 'email':
        return Icons.email;
      case 'name':
        return Icons.person;
      default:
        return Icons.info; // Default icon for unknown labels
    }
  }
}
