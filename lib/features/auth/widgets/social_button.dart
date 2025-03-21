import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String assetPath;
  final double fontSize;
  final VoidCallback onTap;
  final String fontFamily;

  const SocialButton(
    String s, {
    Key? key,
    required this.text,
    required this.assetPath,
    this.fontSize = 16.0,
    required this.onTap,
    this.fontFamily = "Poppins",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(assetPath, width: 40, height: 40),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}


// Container(
          //   padding: const EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey.shade300),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Image.asset(assetPath, width: 20, height: 20),
          // ),