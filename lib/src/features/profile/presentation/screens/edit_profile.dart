import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/button.dart';
import 'package:uni_verse/src/core/widgets/text_field.dart';
import 'package:uni_verse/src/features/authentication/presentation/providers/auth_providers.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regState = ref.watch(bioDataNotifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit your profile",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              gapH16,
               Text(
                "Your have the ability to customize and edit your profile details",
                style: TextStyle(color: UniVerseColours.kGray2,fontSize: 14.sp),
              ),
              gapH20,
              Center(
                child: CircleAvatar(
                  backgroundColor: colors[0],
                  radius: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(males[3]),
                  ),
                ),
              ),
              gapH24,
              UniverseTextField(
                labelColor: UniVerseColours.kGray2,
                label: 'Name',
                enabled: false,
                controller: TextEditingController(text: 'Umar Khalifa'),
              ),
              gapH16,
              UniverseTextField(
                labelColor: UniVerseColours.kGray2,
                label: 'Email Address',
                enabled: false,
                controller: TextEditingController(text: 'Umarkhalifa138@gmail.com'),
              ),
              gapH16,

              UniverseTextField(
                label: 'UserName',
                controller: TextEditingController(text: '_umarKhalifa'),
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
                            backgroundColor: switch (level == regState.level) {
                              true => UniVerseColours.kPurple,
                              false => Colors.transparent
                            },
                            side: BorderSide(
                                color: switch (level == regState.level) {
                              true => Colors.transparent,
                              false => UniVerseColours.kWhite
                            }),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              gapH16,
              const Text(
                "Choose Color Theme",
                style: TextStyle(color: UniVerseColours.kGray2),
              ),
              gapH8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: colors
                    .sublist(0, 5)
                    .map((color) => GestureDetector(
                          onTap: () => ref
                              .read(bioDataNotifier.notifier)
                              .updateColor(color),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: switch (regState.theme == color) {
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
                        onTap: () => ref
                            .read(bioDataNotifier.notifier)
                            .updateColor(color),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: switch (regState.theme == color) {
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
              gapH24,
              const UniverseButton(label: "Save Profile")
            ],
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
  "400 Level",
];

