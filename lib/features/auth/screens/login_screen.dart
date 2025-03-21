import 'package:batch_meal_v2/core/routes/route_names.dart';
import 'package:batch_meal_v2/features/auth/widgets/custom_text_feild.dart';
import 'package:batch_meal_v2/features/auth/widgets/social_button.dart';
import 'package:batch_meal_v2/features/auth/widgets/title_text_widget.dart';
import 'package:batch_meal_v2/features/auth/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isPhoneSelected = true;
  bool rememberMe = false;
  final TextEditingController phoneOrEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneOrEmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Color(0xFFF05E36); // Theme Green
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/flat_logo.png', height: 100),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 5),
                  TitleTextWidget(
                    text: "Login to access your account",
                    color: Colors.black, // Adjust the color as needed
                  ),
                  const SizedBox(height: 30),
      
                  // Toggle Buttons (Phone Number / Email)
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        ToggleButton(
                          "Phone",
                          isSelected: isPhoneSelected,
                          onTap: () {
                            setState(() {
                              isPhoneSelected = true;
                              phoneOrEmailController.clear();
                            });
                          }, title: 'Phone Number',
                        ),
                        ToggleButton(
                          "Email",
                          isSelected: !isPhoneSelected,
                          onTap: () {
                            setState(() {
                              isPhoneSelected = false;
                              phoneOrEmailController.clear();
                            });
                          }, title: 'Email',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
      
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TitleTextWidget(
                      text: isPhoneSelected ? "Phone Number" : "Email",
                      color: Colors.black, // Adjust the color as needed
                    ),
                  ),
      
                  const SizedBox(height: 10),
      
                  CustomTextField(
                    hintText: isPhoneSelected ? "Phone Number" : "Email",
                    icon: isPhoneSelected ? Icons.phone : Icons.email,
                    inputType:
                        isPhoneSelected
                            ? TextInputType.phone
                            : TextInputType.emailAddress,
                    controller: phoneOrEmailController,
                    isPassword: false,
                  ),
      
                  const SizedBox(height: 20),
      
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TitleTextWidget(
                      text: "Password",
                      color: Colors.black, // Adjust the color as needed
                    ),
                  ),
      
                  const SizedBox(height: 10),
      
                  CustomTextField(
                    hintText: "Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: passwordController,
                    inputType: TextInputType.text,
                  ),
      
                  // Input Fields
                  const SizedBox(height: 15),
      
                  // Remember Me & Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            activeColor: primaryColor,
                            onChanged: (value) {
                              setState(() => rememberMe = value ?? false);
                            },
                          ),
                          Text("Remember me", style: TextStyle(color: textColor)),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
      
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement login logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 50),
      
                  // Social Login
                  Center(
                    child: Text(
                      "Or Sign In With",
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        'Google',
                        assetPath: 'assets/icons/google_bg.png',
                        onTap: () {},
                        text: 'Google',
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        'Facebook',
                        assetPath: 'assets/icons/facebook_bg.png',
                        onTap: () {},
                        text: 'Facebook',
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        'Apple',
                        assetPath: 'assets/icons/apple_bg.png',
                        onTap: () {},
                        text: 'Apple',
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Sign Up Link
                  Center(
                    child: GestureDetector(
                      onTap: () => context.go(RouteNames.signUpScreen),
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(color: textColor),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              onTap: () => context.go(RouteNames.signUpScreen),
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Toggle Buttons
  
}
