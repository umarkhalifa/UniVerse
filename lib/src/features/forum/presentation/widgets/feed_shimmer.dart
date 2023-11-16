import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';

class FeedShimmer extends StatelessWidget {
  const FeedShimmer({
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
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: SizedBox(
                                height: 15,
                                width: MediaQuery.sizeOf(context).width * 0.4),
                          ),
                          Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: SizedBox(
                                height: 15,
                                width: MediaQuery.sizeOf(context).width * 0.1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    height: 70,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ),
                gapH12,
                const Divider()
              ],
            );
          },
        ),
      ),
    );
  }
}
