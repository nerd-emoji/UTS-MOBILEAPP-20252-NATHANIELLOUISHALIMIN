import 'package:flutter/material.dart';

import 'Login.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final email = '${username.toLowerCase()}@example.com';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7B4C81),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF29A395), Color(0xFF63B8FA)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username: $username',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Email: $email',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              minimumSize: const Size(0, 35),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: const Color(0xFF6B586B),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
