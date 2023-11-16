import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/profile_picture.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const ProfilePicture(),
          gapW16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style:
                TextStyle(fontSize: 12.sp, color: UniVerseColours.kGray2),
              ),
              Text(
                "${FirebaseAuth.instance.currentUser?.displayName}👋",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                border: Border.all(color: UniVerseColours.kWhite),
                shape: BoxShape.circle),
            child: const Icon(SolarIconsOutline.bell),
          )
        ],
      ),
    );
  }
}
