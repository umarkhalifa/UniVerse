import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/button.dart';
import 'package:uni_verse/src/core/widgets/text_field.dart';
import 'package:uni_verse/src/utils/extension/validation_extension.dart';

import 'providers/auth_providers.dart';

class BioInformationScreen extends HookConsumerWidget {
  const BioInformationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final regNumberController = useTextEditingController();
    final regState = ref.watch(bioDataNotifier);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH16,
                  Text(
                    "Complete your profile",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "To enhance your experience and provide you with tailored content, we kindly request some basic information",
                    style:
                        TextStyle(color: UniVerseColours.kGray2, fontSize: 12.sp),
                  ),
                  gapH24,
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: regState.theme,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.network(
                          regState.avatar ?? '',
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: SpinKitDoubleBounce(
                                    color: UniVerseColours.kWhite),
                              );
                            }
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(Icons
                                .error); // You can return a custom widget or a different error indicator here
                          },
                        ),
                      ),
                    ),
                  ),
                  gapH24,
                   UniverseTextField(
                    label: "User Name",
                    controller: userNameController,
                     validator: context.validateUserName,
                  ),
                  gapH16,
                  UniverseTextField(
                    label: "Department",
                    enabled: false,
                    labelColor: UniVerseColours.kGray2,
                    controller:
                        TextEditingController(text: "Software Engineering"),
                  ),
                  gapH16,
                 UniverseTextField(
                    label: "Matric Number",
                   controller: regNumberController,
                   validator: context.validateFieldNotEmpty,
                  ),
                  gapH16,
                  Text(
                    "Choose your level",
                    style:
                        TextStyle(color: UniVerseColours.kGray2, fontSize: 14.sp),
                  ),
                  gapH16,
                  Wrap(
                    children: level
                        .map(
                          (level) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: GestureDetector(
                              onTap: () => ref
                                  .read(bioDataNotifier.notifier)
                                  .updateLevel(level),
                              child: Chip(
                                label: Text(level),
                                backgroundColor: switch (
                                    level == regState.level) {
                                  true => UniVerseColours.kPurple,
                                  false => Colors.transparent
                                },
                                side: BorderSide(
                                    color: switch (level == regState.level) {
                                  true => Colors.transparent,
                                  false => UniVerseColours.kWhite
                                }),
                                labelStyle: TextStyle(color: switch (
                                level == regState.level) {
                                  true => UniVerseColours.kWhite,
                                  false => UniVerseColours.kDark
                                },),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  gapH16,
                  Text(
                    "Choose Color Theme",
                    style:
                        TextStyle(color: UniVerseColours.kGray2, fontSize: 14.sp),
                  ),
                  gapH8,
                  ColorsCard(
                      userColor: regState.theme!,
                      updateColor:
                          ref.read(bioDataNotifier.notifier).updateColor),
                  gapH24,
                  UniverseButton(
                    label: "Submit",
                    loading: regState.isLoading,
                    onPressed:() {
                      if(formKey.currentState!.validate()){
                        ref.read(bioDataNotifier.notifier).setBioData(
                          userName: userNameController.text.trim(),
                          regNumber: regNumberController.text.trim(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> level = [
  "100 Level",
  "200 Level",
  "300 Level",
];

class ColorsCard extends StatelessWidget {
  final Color userColor;
  final Function(Color) updateColor;

  const ColorsCard(
      {super.key, required this.userColor, required this.updateColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: colors
              .sublist(0, 5)
              .map((color) => GestureDetector(
                    onTap: () => updateColor(color),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: switch (userColor == color) {
                            true => UniVerseColours.kPurple,
                            false => Colors.transparent
                          })),
                      child: Center(
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: color,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: colors
              .sublist(5)
              .map(
                (color) => GestureDetector(
                  onTap: () => updateColor(color),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: switch (userColor == color) {
                          true => UniVerseColours.kPurple,
                          false => Colors.transparent
                        })),
                    child: Center(
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: color,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
