import 'package:flutter/material.dart';
import 'package:food_ui_app/screen/signup_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) FocusScope.of(context).requestFocus(focusNodes[0]);
    });
  }

  Widget otpBox(int index) {
    return SizedBox(
      width: 65,
      height: 65,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: const Color(0xffF0F1F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          if (value.isEmpty && index > 0) FocusScope.of(context).requestFocus(focusNodes[index - 1]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // பின்புலம் வெள்ளை
      body: SingleChildScrollView( // முழு ஸ்கிரீனும் ஸ்க்ரோல் ஆகும், எதுவும் மறையாது
        child: Column(
          children: [
            /// 🟦 கரும் நீல நிற பகுதி (மேல் பகுதி)
            Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff0D1230),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    left: -60,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset("lib/assets/image/BG Asset.png", width: 450),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Verification", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold,fontFamily: 'sen')),
                        SizedBox(height: 10),
                        Text("We have sent a code to your email", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 5),
                        Text("example@gmail.com", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// ⬜ வளைந்த வெள்ளை கார்டு பகுதி
            /// Transform.translate மூலம் இதை நீல பகுதிக்கு மேல் 'Overlap' செய்கிறோம்
            Transform.translate(
              offset: const Offset(0, -40), // இதுதான் அந்த வெள்ளை லேயரை மேலே தூக்கும், எதையும் மறைக்காது
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("CODE", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                        Row(
                          children: const [
                            Text("Resend", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                            SizedBox(width: 5),
                            Text("in.50sec", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [otpBox(0), otpBox(1), otpBox(2), otpBox(3)],
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF7A1A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("VERIFY", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}