import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/controllers/userauth_controlller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/screens/auth/signup.dart';
import 'package:sih_internship_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  UserAuthController userAuthController = Get.put(UserAuthController());
  ProfileController profileController = Get.put(ProfileController());
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        Utils.showtoast('Google Sign-In canceled.');
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        // Retrieve the user ID (UUID) and email
        String? userId = user.uid;
        String? email = user.email;
        log('uid: $userId');
        profileController.setUid(userId);
        profileController.emailController.text = email!;
        // You can use userId and email as needed
      }

      Utils.showtoast('Signed in with Google');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showtoast('Google Sign-In Failed: ${e.message}');
    }
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        bool verified = await userAuthController
            .auth(profileController.emailController.text);
        if (verified) {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: profileController.emailController.text,
            password: profileController.passwordController.text,
          );
          User? user = userCredential.user;

          if (user != null) {
            // Retrieve the user ID (UUID) and email
            String? userId = user.uid;
            String? email = user.email;
            profileController.setUid(userId);
            profileController.emailController.text = email!;
            // You can use userId and email as needed
          }
          Utils.showtoast('Login Successful');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          Utils.showtoast('Failed to Login.');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Utils.showtoast('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Utils.showtoast('Wrong password provided.');
        } else {
          log(e.message.toString());
          Utils.showtoast('Login Failed: ${e.message}');
        }
      } catch (e) {
        log(e.toString());
        Utils.showtoast('Login Failed: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/landing_background.jpg')),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                height: mq.height * 0.5,
                width: mq.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: mq.height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: mq.height * 0.064,
                      width: mq.width * 0.75,
                      child: TextFormField(
                        controller: profileController.emailController,
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: mq.height * 0.064,
                      width: mq.width * 0.75,
                      child: TextFormField(
                        controller: profileController.passwordController,
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          fixedSize: Size(mq.width * 0.75, mq.height * 0.064),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: _login,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.015,
                    ),
                    Row(
                      children: [
                        const Text('New User? '),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: const Text('SignUp')),
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.015,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        fixedSize: Size(mq.width * 0.75, mq.height * 0.064),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: _signInWithGoogle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/google.png',
                              height:
                                  24), // Ensure you add a Google logo in assets
                          const SizedBox(width: 10),
                          const Text(
                            'Sign In with Google',
                            style: TextStyle(
                                color: AppColors.background, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
