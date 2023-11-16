import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/authentication/data/data_source/auth_local_data_source.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTier();
  }

  void fetchTier() async {
    await Future.delayed(const Duration(seconds: 6));
    await ref.read(authLocalProvider).initialize().then((value) {
      final tier = ref.read(authLocalProvider).getTier();
      if (tier == 0) {
        context.pushReplacementNamed(RouterNames.onBoarding.name);
      } else if (tier == 1) {
        context.pushReplacementNamed(RouterNames.login.name);
      } else if (tier == 2) {
        context.pushReplacementNamed(RouterNames.selectGender.name);
      } else if (tier == 3) {
        context.pushReplacementNamed(RouterNames.navigation.name);
      } else {
        context.pushReplacementNamed(RouterNames.onBoarding.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: UniVerseColours.kPurple,
      body: Column(
        children: [
          Spacer(),
          BouncingLogo(),
          Spacer(),
          SpinKitChasingDots(
            color: UniVerseColours.kWhite,
          )
        ],
      ),
    );
  }
}

class BouncingLogo extends StatefulWidget {
  const BouncingLogo({super.key});

  @override
  BouncingLogoState createState() => BouncingLogoState();
}

class BouncingLogoState extends State<BouncingLogo> {
  late Timer timer;
  ValueNotifier<Map<String, dynamic>> values =
      ValueNotifier({'height': 100.0, 'width': 100.0, 'bouncing': false});

  @override
  void initState() {
    super.initState();
    start();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();

  }

  void start() {
    timer  = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        values.value['bouncing'] = !values.value['bouncing'];
        if (values.value['bouncing']) {
          // Increase the height and width for the "bounce up" animation
          values.value['height'] = 200.0;
          values.value['width'] = 200.0;
        } else {
          // Reset the height and width for the "bounce down" animation
          values.value['height'] = 100.0;
          values.value['width'] = 100.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: values,
        builder: (context, value, child) {
          return AnimatedContainer(
            color: Colors.transparent,
            duration: const Duration(milliseconds: 800),
            // Animation duration
            height: value['height'],
            width: value['width'],
            curve: value['bouncing'] ? Curves.easeOutBack : Curves.easeIn,
            child: Image.asset(UniVerseAssets.logo),
          );
        });
  }
}
