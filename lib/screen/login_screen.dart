import 'package:flutter/material.dart';
import 'package:food_ui_app/screen/password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true; // Password hide/show panna

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1E2F),
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER ---
            const Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Log In", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("Please sign in to your existing account", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
            ),
            
            // --- WHITE CONTAINER ---
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _inputLabel("EMAIL"),
                      _textField("example@gmail.com", false),
                      
                      const SizedBox(height: 20),
                      
                      _inputLabel("PASSWORD"),
                      // PASSWORD FIELD WITH EYE TOGGLE
                      TextField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: "**********",
                          filled: true,
                          fillColor: const Color(0xFFF0F1F5),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                            onPressed: () => setState(() => _isObscure = !_isObscure),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      // REMEMBER ME & FORGOT PASSWORD
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Remember me", style: TextStyle(color: Colors.grey)),
                          // 1. FORGOT PASSWORD NAVIGATION
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ForgotPasswordScreen()));
                              print("Going to Forgot Password Screen");
                            },
                            child: const Text("Forgot Password", style: TextStyle(color: Color(0xFFFF7A30), fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      
                      // LOG IN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7A30),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {},
                          child: const Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      
                      const SizedBox(height: 25),
                      
                      // SIGN UP LINK
                      const Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(text: "SIGN UP", style: TextStyle(color: Color(0xFFFF7A30), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Center(child: Text("Or", style: TextStyle(color: Colors.grey))),
                      const SizedBox(height: 20),

                      // --- 🟦 THREE SOCIAL LOGOS (BOTTOM SECTION) ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialIcon(const Color(0xFF3B5998), Icons.facebook), // Facebook
                          const SizedBox(width: 20),
                          _socialIcon(const Color(0xFF1DA1F2), Icons.flutter_dash), // Twitter/X Icon
                          const SizedBox(width: 20),
                          _socialIcon(const Color(0xFF000000), Icons.apple), // Apple
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SOCIAL ICON BUILDER
  Widget _socialIcon(Color color, IconData icon) {
    return Container(
      height: 55, width: 55,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }

  Widget _inputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)),
    );
  }

  Widget _textField(String hint, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF0F1F5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }
}