import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: colors[0],
                radius: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(males[3]),
                ),
              ),
            ),
            gapH16,
            Text(
              "Umar Khalifa",
              style: TextStyle(fontSize: 18.sp),
            ),
             Text(
              "@umar_khalifa",
              style: TextStyle(color: UniVerseColours.kGray2,fontSize: 14.sp),
            ),
            gapH24,
            gapH24,
            ProfileSetting(
              iconData: SolarIconsOutline.lock,
              label: "Change Password",
              route: RouterNames.changePassword.name,
            ),
            gapH24,
            ProfileSetting(
              iconData: SolarIconsOutline.user,
              label: "Edit Profile",
              route: RouterNames.editProfile.name,
            ),
            gapH24,
            ProfileSetting(
              iconData: SolarIconsOutline.letter,
              label: "Contact Us",
              onPress: () async {
                await showDialog(
                    context: context,
                    builder: (context) => const EmailDialog());
              },
            ),
            gapH24,
            ProfileSetting(
              iconData: SolarIconsOutline.password,
              label: "Privacy Policy",
              onPress: () {},
            ),
            gapH24,
            ProfileSetting(
              iconData: SolarIconsOutline.logout,
              label: "Logout",
              onPress: () {FirebaseAuth.instance.signOut();
                },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSetting extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String? route;
  final Function()? onPress;

  const ProfileSetting({
    super.key,
    required this.iconData,
    required this.label,
    this.route,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        route != null ? context.pushNamed(route!) : onPress!();
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: UniVerseColours.kPurple.withOpacity(0.3),
            child: Icon(iconData),
          ),
          gapW16,
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}

class EmailDialog extends StatelessWidget {
  const EmailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: UniVerseColours.kBackground,
      insetPadding: EdgeInsets.all(10),
      child: SizedBox(
        height: 180,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              gapH16,
              Text(
                "Send us an email at umarkhalifa138@gmail.com and we will eagerly get back to you",
                style: TextStyle(color: UniVerseColours.kGray2),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Ok",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Contact",
                    style:
                        TextStyle(color: UniVerseColours.kPurple, fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
