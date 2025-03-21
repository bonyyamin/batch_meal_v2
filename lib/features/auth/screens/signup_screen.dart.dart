import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:batch_meal_v2/features/auth/widgets/custom_text_feild.dart';
import 'package:batch_meal_v2/features/auth/widgets/title_text_widget.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFFF05E36);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: textColor),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/flat_logo.png', height: 80),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(height: 5),
                TitleTextWidget(
                  text: "Create your new account",
                  color: Colors.black,
                ),
                const SizedBox(height: 30),

                TitleTextWidget(text: "Full Name", color: Colors.black),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Enter your full name",
                  icon: Icons.person_outline,
                  controller: nameController,
                  inputType: TextInputType.name,
                ),

                const SizedBox(height: 20),
                TitleTextWidget(text: "Phone Number", color: Colors.black),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Enter your phone number",
                  icon: Icons.phone_outlined,
                  controller: phoneController,
                  inputType: TextInputType.phone,
                ),

                const SizedBox(height: 20),
                TitleTextWidget(text: "Email", color: Colors.black),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Enter your email",
                  icon: Icons.email_outlined,
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),
                TitleTextWidget(text: "Password", color: Colors.black),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Enter your password",
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  isPassword: true,
                  inputType: TextInputType.visiblePassword,
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement signup logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
