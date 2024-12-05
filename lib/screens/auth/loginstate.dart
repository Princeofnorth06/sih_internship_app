import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_internship_app/screens/auth/login.dart';
import 'package:sih_internship_app/screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Check if the user is logged in
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            // User is NOT logged in
            return const Login();
          } else {
            // User IS logged in
            return const HomePage();
          }
        } else {
          // Show loading while checking authentication
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
