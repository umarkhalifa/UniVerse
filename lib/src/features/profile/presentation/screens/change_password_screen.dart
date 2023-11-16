import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/button.dart';
import 'package:uni_verse/src/core/widgets/text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create new password",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            ),
            gapH16,
            Text(
              "Your new password must be different from your previous used passwords",
              style: TextStyle(color: UniVerseColours.kGray2,fontSize: 14.sp),
            ),
            gapH20,
            const UniverseTextField(label: 'Old Password'),
            gapH8,
            Text(
              "Must be at least 8 characters and include at least 1 uppercase, lowercase and a number",
              style: TextStyle(fontSize: 12.sp, color: UniVerseColours.kGray2),
            ),
            gapH16,
            const UniverseTextField(label: 'New Password'),
            gapH8,

            Text(
              "Both password must match",
              style: TextStyle(fontSize: 12.sp, color: UniVerseColours.kGray2),
            ),
            gapH24,
            gapH24,
            const UniverseButton(label: "Reset password")
          ],
        ),
      ),
    );
  }
}
