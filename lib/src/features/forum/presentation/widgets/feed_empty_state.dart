import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
class FeedEmptyState extends StatelessWidget {
  const FeedEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: MediaQuery.sizeOf(context).width,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            SolarIconsOutline.chatDots,
            color: UniVerseColours.kPurple.withOpacity(0.5),
            size: 150,
          ),
          gapH12,
          const Text(
            "No feed yet, be the first to Post!",
            style:
            TextStyle(color: UniVerseColours.kGray),
          )
        ],
      ),
    );
  }
}
