import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Shimmer.fromColors(
        baseColor: UniVerseColours.kSecondary,
        highlightColor: UniVerseColours.kPurple.withOpacity(0.1),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const SizedBox(
                    height: 80,
                    width: 80,
                  ),
                ),
                gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: SizedBox(
                            height: 15,
                            width: MediaQuery.sizeOf(context).width),
                      ),
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: SizedBox(
                            height: 15,
                            width: MediaQuery.sizeOf(context).width),
                      ),
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: SizedBox(
                            height: 15,
                            width: MediaQuery.sizeOf(context).width * 0.3),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
