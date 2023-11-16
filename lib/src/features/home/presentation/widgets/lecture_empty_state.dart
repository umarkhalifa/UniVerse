import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
class LecturesEmptyState extends StatelessWidget {
  const LecturesEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Icon(
            SolarIconsOutline.notes,
            size: 200,
            color: UniVerseColours.kPurple.withOpacity(0.5),
          ),
          gapH20,
          Text(
            'Take a break!. No lectures today',
            style: TextStyle(
              color: UniVerseColours.kGray,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
