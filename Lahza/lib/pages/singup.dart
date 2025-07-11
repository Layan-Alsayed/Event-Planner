import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LAHZA',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF44A5FF),
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 40),
                // Full Name Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: const TextStyle(color: Color(0xFF383636)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    prefixIcon:
                        const Icon(Icons.person, color: Color(0xFF44A5FF)),
                  ),
                  style: const TextStyle(fontFamily: 'Roboto'),
                ),
                const SizedBox(height: 20),
                // Email Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Color(0xFF383636)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    prefixIcon:
                        const Icon(Icons.email, color: Color(0xFF44A5FF)),
                  ),
                  style: const TextStyle(fontFamily: 'Roboto'),
                ),
                const SizedBox(height: 20),
                // Password Field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Color(0xFF383636)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF44A5FF)),
                  ),
                  style: const TextStyle(fontFamily: 'Roboto'),
                ),
                const SizedBox(height: 20),
                // Confirm Password Field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Color(0xFF383636)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF44A5FF)),
                    ),
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF44A5FF)),
                  ),
                  style: const TextStyle(fontFamily: 'Roboto'),
                ),
                const SizedBox(height: 20),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/home'); // انتقال إلى الصفحة الرئيسية
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF44A5FF),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Navigate to Login Page
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'Roboto'),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: Color(0xFF44A5FF),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(
                                context); // العودة إلى صفحة تسجيل الدخول
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
