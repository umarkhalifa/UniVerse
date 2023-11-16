import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/widgets.dart';

import 'providers/auth_providers.dart';

class SelectAvatarScreen extends ConsumerWidget {
  final Function() changePage;

  const SelectAvatarScreen({super.key, required this.changePage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bioState = ref.watch(bioDataNotifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Select your avatar",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Personalize Your Look and Stand Out in the Community: Your avatar is more than just an image – it's your digital identity! Select your unique avatar to not only express your personality.",
            style: TextStyle(color: UniVerseColours.kGray2, fontSize: 12.sp),
          ),
        ),
        gapH24,
        gapH24,
        const Center(
          child: Icon(
            Icons.arrow_drop_down,
            color: UniVerseColours.kGray,
          ),
        ),
        bioState.isLoading! == true
            ? const Expanded(
                child: Center(
                  child: SpinKitChasingDots(
                    color: UniVerseColours.kWhite,
                  ),
                ),
              )
            : CarouselSlider.builder(
                itemCount: bioState.avatars?.length ?? 0,
                itemBuilder: (context, index, _) {
                  return AnimatedContainer(
                    width: 200,
                    padding: const EdgeInsets.all(20),
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: switch (
                            bioState.avatar == bioState.avatars?[index]) {
                          true => UniVerseColours.kPurple,
                          false => UniVerseColours.kBackground
                        },
                        boxShadow: [
                          BoxShadow(
                              color: UniVerseColours.kDark.withOpacity(0.1),
                              offset: const Offset(0, 3),
                              blurRadius: 5)
                        ]),
                    child: Image.network(bioState.avatars?[index] ?? '',
                      loadingBuilder: (BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: SpinKitDoubleBounce(
                              color: bioState.avatar == bioState.avatars?[index]
                                  ? UniVerseColours.kWhite
                                  : UniVerseColours.kPurple,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons
                            .error); // You can return a custom widget or a different error indicator here
                      },

                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  aspectRatio: 2,
                  onPageChanged: (index, _) {
                    ref
                        .read(bioDataNotifier.notifier)
                        .updateAvatar(bioState.avatars![index]);
                  },
                ),
              ),
        const Center(
          child: Icon(
            Icons.arrow_drop_up,
            color: UniVerseColours.kGray,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: UniverseButton(
            label: "Continue",
            onPressed: () => bioState.avatar != '' ?changePage():null,
          ),
        ),
      ],
    );
  }
}
