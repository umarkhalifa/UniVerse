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
import 'package:uni_verse/src/features/authentication/presentation/providers/register_provider.dart';
import 'package:uni_verse/src/utils/extension/validation_extension.dart';

import '../../../core/widgets/widgets.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerNotifier);
    final formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
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
                      "Create an account",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Sign up now and start exploring",
                      style: TextStyle(
                          color: UniVerseColours.kGray2, fontSize: 14.sp),
                    ),
                    gapH20,
                    UniverseTextField(
                      label: "Full Name",
                      iconData: SolarIconsOutline.user,
                      controller: nameController,
                      validator: context.validateFullName,
                    ),
                    gapH16,
                    UniverseTextField(
                      label: "Email Address",
                      iconData: SolarIconsOutline.letter,
                      controller: emailController,
                      validator: context.validateEmailAddress,
                    ),
                    gapH16,
                    UniverseTextField(
                      label: "Password",
                      obscureText: true,
                      iconData: SolarIconsOutline.lock,
                      controller: passwordController,
                      validator: context.validatePassword,
                      maxLines: 1,

                    ),
                    gapH20,
                    gapH20,
                    Center(
                      child: Text(
                        "By clicking create an account you agree to Universe's\n"
                        "Terms & Conditions and Privacy Policy",
                        style: TextStyle(
                            fontSize: 12.sp, color: UniVerseColours.kGray2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    gapH24,
                    UniverseButton(
                      label: "Register",
                      loading: registerState.loading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ref
                              .read(registerNotifier.notifier)
                              .registerWithEmail(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                        }
                      },
                    ),
                    const Spacer(),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: UniVerseColours.kDark,
                              fontFamily: "Faktum"),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context
                                    .replaceNamed(RouterNames.login.name),
                              text: "Sign In",
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
