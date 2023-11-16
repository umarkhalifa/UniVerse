import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
class ScheduleShimmer extends StatelessWidget {
  const ScheduleShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Shimmer.fromColors(
        baseColor: UniVerseColours.kSecondary,
        highlightColor: UniVerseColours.kPurple.withOpacity(0.1),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child:  SizedBox(
                      height: 120,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                    ),
                  ),

                ],
              ),
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
