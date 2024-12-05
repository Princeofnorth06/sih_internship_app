import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/screens/auth/login.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.background),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Get.to(const Login());
          });
        },
        child: const Icon(
          Icons.logout,
          color: AppColors.background,
        ),
      ),
    );
  }
}
