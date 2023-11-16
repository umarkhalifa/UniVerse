import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';

class ProfilePicture extends ConsumerWidget{
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeState = ref.watch(homeNotifier);

    return CircleAvatar(
      backgroundColor:
      Color(homeState.userEntity?.color ?? 0XFF000000)
          .withOpacity(1),
      radius: 25,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: CachedNetworkImage(
          imageUrl: homeState.userEntity?.avatar ?? '',
          progressIndicatorBuilder:
              (context, url, downloadProgress) =>
          const SpinKitChasingDots(
            color: UniVerseColours.kWhite,
            size: 30,
          ),
          errorWidget: (context, url, error) => const Icon(
            SolarIconsBold.userMinus,
          ),
        ),
      ),
    );
  }
}
