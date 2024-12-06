import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/screens/home_screen.dart';
import 'package:sih_internship_app/screens/auth/login.dart';
import 'package:sih_internship_app/screens/profile/create_profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());

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
        String userId = user.uid;
        String? email = user.email;
        profileController.setUid(userId);
        profileController.emailController.text = email ?? "";
        // You can use userId and email as needed
      }

      Utils.showtoast('Signed in with Google');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateProfile()),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showtoast('Google Sign-In Failed: ${e.message}');
    }
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        User? user = userCredential.user;

        if (user != null) {
          // Retrieve the user ID (UUID) and email
          String userId = user.uid;
          String? email = user.email;
          profileController.setUid(userId);
          profileController.emailController.text = email ?? "";
          // You can use userId and email as needed
        }
        Utils.showtoast('Sign Up Successful');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CreateProfile()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Utils.showtoast('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Utils.showtoast('An account already exists for that email.');
        } else {
          Utils.showtoast('Sign Up Failed: ${e.message}');
        }
      } catch (e) {
        Utils.showtoast('Sign Up Failed: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 122, 190, 247),
      //   title: const Text(
      //     'Sign Up',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              height: mq.height * 0.6,
              width: mq.width * 0.8,
              padding: EdgeInsets.symmetric(
                  horizontal: mq.height * 0.02, vertical: mq.width * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.background,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: mq.height * 0.064,
                    width: mq.width * 0.75,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          //fillColor: AppColors.background,
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
                      controller: _passwordController,
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
                  SizedBox(
                    height: mq.height * 0.064,
                    width: mq.width * 0.75,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        fixedSize: Size(mq.width * 0.75, mq.height * 0.064),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: _signUp,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  Row(
                    children: [
                      const Text('Already a User? '),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: const Text('Login')),
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
    );
  }
}
