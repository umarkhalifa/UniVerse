import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/core/widgets/profile_picture.dart';
class FeedTextField extends StatelessWidget {
  const FeedTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        context.pushNamed(RouterNames.createPost.name);

      },
      child: TextFormField(
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: UniVerseColours.kGray),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: UniVerseColours.kPurple),
            ),
            prefixIcon: const Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ProfilePicture(),
            ),
            enabled: false,
            hintText:
            "What's new, ${FirebaseAuth.instance.currentUser?.displayName?.split(' ')[0]}",
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w100,
                color: UniVerseColours.kGray3),
            suffixIcon: const SizedBox(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    SolarIconsBold.gallery,
                    color: UniVerseColours.kGray3,
                  ),
                  Icon(
                    SolarIconsBold.plain2,
                    color: UniVerseColours.kGray3,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
