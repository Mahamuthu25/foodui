import 'package:flutter/material.dart';
import 'package:food_ui_app/screen/login_screen.dart';

// --- SIGN UP SCREEN ---
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1E2F),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              
              SizedBox(
                height: constraints.maxHeight * 0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: IconButton(icon: const Icon(Icons.chevron_left, color: Colors.black, size: 20), onPressed: () => Navigator.pop(context)),
                        ),
                      ),
                    ),
                    const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                    const Text("Please sign up to get started", style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  ),
                  child: Column(
                    children: [
                      _inputField("NAME", "John doe"),
                      const Spacer(),
                      _inputField("EMAIL", "example@gmail.com"),
                      const Spacer(),
                      _inputField("PASSWORD", "**********", isPassword: true, showEye: true),
                      const Spacer(),
                      _inputField("RE-TYPE PASSWORD", "**********", isPassword: true, showEye: true),
                      const Spacer(flex: 2),
                      _actionButton("SIGN UP", () {
                          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// --- SHARED WIDGETS ---

Widget _inputField(String label, String hint, {bool isPassword = false, bool showEye = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
      const SizedBox(height: 5),
      TextField(
        obscureText: isPassword,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF4F7FA),
          suffixIcon: showEye ? const Icon(Icons.visibility_off_outlined, color: Colors.grey, size: 18) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        ),
      ),
    ],
  );
}

Widget _actionButton(String text, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF7A30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    ),
  );
}

Widget _socialIcon(Color color, IconData icon) {
  return Container(
    height: 48, width: 48,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    child: Icon(icon, color: Colors.white, size: 24),
  );
}