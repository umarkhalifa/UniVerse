import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/button.dart';
import 'package:uni_verse/src/features/authentication/presentation/auth_screens.dart';

import 'providers/auth_providers.dart';

class SelectGenderScreen extends HookWidget {
  const SelectGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> width = ValueNotifier(MediaQuery.sizeOf(context).width * 0.23);
    final pageController = usePageController();
    void changePage() => pageController.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.ease);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease),
                      child: const Icon(SolarIconsOutline.arrowLeft)),
                  gapW24,
                  ValueListenableBuilder(valueListenable: width, builder: (context,value,child){
                    return Flexible(
                      child: AnimatedContainer(
                        height: 6,
                        duration: const Duration(milliseconds: 400),
                        width: value,
                        decoration: BoxDecoration(
                            color: UniVerseColours.kPurple,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (index){
                  if(index == 0){
                    width.value =  MediaQuery.sizeOf(context).width * 0.23;
                  }else if(index == 1){
                    width.value = MediaQuery.sizeOf(context).width * 0.43;
                  }else{
                    width.value = MediaQuery.sizeOf(context).width ;
                  }
                },
                children: [
                  GenderWidget(
                    changePage: changePage,
                  ),
                  SelectAvatarScreen(changePage: changePage),
                  const BioInformationScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderWidget extends ConsumerWidget {
  final Function() changePage;

  const GenderWidget({super.key, required this.changePage});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final regGender = ref.watch(bioDataNotifier).gender;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH24,
          Text(
            "What is your gender?",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
          Text(
            "We'd like to learn more about our users to provide a tailored experience. Please select your gender identity from the options below",
            style: TextStyle(color: UniVerseColours.kGray2, fontSize: 12.sp),
          ),
          gapH24,
          gapH24,
          Row(
            children: Gender.values.map((gender) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => ref
                      .read(bioDataNotifier.notifier)
                      .updateGender(gender),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(30),
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: UniVerseColours.kGray2.withOpacity(0.3),
                        ),
                        color: switch (gender == regGender) {
                          true => UniVerseColours.kPurple,
                          false => Colors.transparent
                        }),
                    child: Image.asset(gender.toGender()),
                  ),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          UniverseButton(
            label: "Continue",
            onPressed: (){
              ref.read(bioDataNotifier.notifier).fetchAvatars();
              changePage();
            },
          ),
        ],
      ),
    );
  }
}

class AuthLevel extends StatelessWidget {
  final int level;

  const AuthLevel({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(SolarIconsOutline.arrowLeft)),
        gapW24,
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              4,
              (index) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 4,
                    decoration: BoxDecoration(
                        color: switch (index < level) {
                          true => UniVerseColours.kPurple,
                          false => UniVerseColours.kGray2.withOpacity(0.2)
                        },
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
