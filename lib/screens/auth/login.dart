import 'package:flutter/material.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/screens/auth/signup.dart';
import 'package:sih_internship_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Perform sign-up logic (e.g., API call)
      Utils.showtoast("Login Succusfull");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 190, 247),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 122, 190, 247),
      //   title: const Text(
      //     'Login',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              height: mq.height * 0.4,
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 122, 190, 247),
                        fixedSize: Size(mq.width * 0.75, mq.height * 0.064),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: _signUp,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
