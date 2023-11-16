import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/core/widgets/widgets.dart';
import 'package:uni_verse/src/features/authentication/presentation/providers/sign_in_provider.dart';
import 'package:uni_verse/src/utils/extension/validation_extension.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInNotifier);

    final formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),

                    Text(
                      "Welcome Back 👋",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "to the ",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Faktum",
                            color: UniVerseColours.kDark),
                        children: [
                          TextSpan(
                            text: "UniVerse",
                            style: TextStyle(
                                fontSize: 24.sp,
                                color: UniVerseColours.kPurple,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(
                          color: UniVerseColours.kGray2, fontSize: 14.sp),
                    ),
                    gapH20,
                    UniverseTextField(
                      label: "Email Address",
                      iconData: SolarIconsOutline.letter,
                      controller: emailController,
                      validator: context.validateEmailAddress,
                    ),
                    gapH16,
                    UniverseTextField(
                      label: "Password",
                      iconData: SolarIconsOutline.lock,
                      controller: passwordController,
                      validator: context.validatePassword,
                    ),
                    gapH8,
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RouterNames.forgotPassword.name);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: UniVerseColours.kPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                    gapH20,
                    UniverseButton(
                      label: "Sign In",
                      loading: signInState.loading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          ref.read(signInNotifier.notifier).signInWithEmail(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        }
                      },
                    ),
                    gapH20,
                    const Spacer(),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "New here? ",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: UniVerseColours.kDark,
                              fontFamily: "Faktum"),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context
                                    .pushNamed(RouterNames.register.name),
                              text: "Create an account",
                              style: const TextStyle(
                                  color: UniVerseColours.kPurple,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    gapH24,
                    gapH24,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
