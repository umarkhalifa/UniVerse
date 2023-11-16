import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/authentication/data/data_source/auth_local_data_source.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Image.asset(
                UniVerseAssets.onBoarding,
                fit: BoxFit.cover,
              ),
            ),
            gapH24,
            gapH24,
            gapH24,
             Text(
              'Welcome to UniVerse\nYour Campus, Your Community',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
             Text(
              "UniVerse Campus is the life of the campus. This all-in-one platform is your ticket to seamless connections.",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w200,
                  color: UniVerseColours.kGray3),
              textAlign: TextAlign.center,
            ),
            gapH20,
            GestureDetector(
              // onTap: () => FirebaseAuth.instance.signOut(),
              onTap: () => context.pushNamed(RouterNames.login.name),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 52,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: UniVerseColours.kPurple,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Sign In",
                    style:
                        TextStyle(fontSize: 16, color: UniVerseColours.kWhite),
                  ),
                ),
              ),
            ),
            gapH20,
            GestureDetector(
              onTap: () {
                ref.read(authLocalProvider).setTier(1);
                context.pushNamed(RouterNames.register.name);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 52,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: UniVerseColours.kSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Create an account",
                    style:
                        TextStyle(fontSize: 16, ),
                  ),
                ),
              ),
            ),
            gapH20,
          ],
        ),
      ),
    );
  }
}
