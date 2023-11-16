import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/widgets.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            gapH16,
            Text(
              "Enter your email address to get a password reset link. Please check your mail and spam for the link",
              style: TextStyle(color: UniVerseColours.kGray2),
            ),
            gapH20,
            UniverseTextField(label: 'Email Address'),
            gapH24,
            gapH24,
            UniverseButton(label: "Send email")
          ],
        ),
      ),
    );

  }
}
