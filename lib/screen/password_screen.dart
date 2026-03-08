import 'package:flutter/material.dart';
import 'package:food_ui_app/screen/foodlist.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controller to get input text
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Colors based on image
    const Color darkBlue = Color(0xff0D1230);
    const Color orangeColor = Color(0xffFF7A1A);
    const Color inputBg = Color(0xffF0F1F5);

    return Scaffold(
      body: SingleChildScrollView( // Allows scrolling, prevents keyboard auto-open
        child: Column(
          children: [
            /// 🟦 BLUE HEADER SECTION
            Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: darkBlue,
              ),
              child: Stack(
                children: [
                  // Background asset/image (ensure path exists)
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Opacity(
                      opacity: 0.1, // Soft background pattern
                      child: Image.asset("assets/image/BG Asset.png", width: 400), 
                    ),
                  ),
                  
                  // Back Button
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
                  
                  // Text Content (Centered horizontally)
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold, // Sen Bold
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Please sign in to your existing account",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// ⬜ WHITE DETAILS CARD SECTION (No Stack overlap)
            Transform.translate(
              offset: const Offset(0, -30), // Pulls card slightly up over blue area
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
                  crossAxisAlignment: CrossAxisAlignment.start, // Align labels to left
                  children: [
                    // EMAIL LABEL
                    const Text(
                    "EMAIL",
                      style: TextStyle(
                        color: Color(0xff5F6170), // Gray color for labels
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    // EMAIL INPUT FIELD
                    Container(
                      decoration: BoxDecoration(
                        color: inputBg, // Light gray input background
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: "example@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          border: InputBorder.none, // Removes default border
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 35),

                    // SEND CODE BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 60, // Match height of input field
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                             MaterialPageRoute(
                                 builder: (context) => FoodListScreen(),
                                ),
                                );
                          // Handle send code logic
                          print("Sending code to: ${_emailController.text}");
                        },
                        child: const Text(
                          "SEND CODE",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // Sen Bold
                          ),
                        ),
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