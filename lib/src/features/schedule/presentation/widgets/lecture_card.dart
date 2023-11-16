import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
class LectureCard extends StatelessWidget {
  const LectureCard({
    super.key,
    required this.lecture,
  });

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 120,
      decoration: BoxDecoration(
        color: UniVerseColours.kSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 5,
            decoration: const BoxDecoration(
              color: UniVerseColours.kPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${lecture.code}: ${lecture.title}"),
                  Row(
                    children: [
                      const Icon(
                        SolarIconsOutline.mapPoint,
                        size: 15,
                        color: UniVerseColours.kGray3,
                      ),
                      gapW4,
                      Text(
                        '${lecture.venue}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: UniVerseColours.kGray3),
                        ),

                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        SolarIconsOutline.calendar,
                        size: 15,
                        color: UniVerseColours.kGray3,
                      ),
                      gapW4,
                      Text(
                        "${lecture.startTime}-${lecture.endTime}",
                        style: const TextStyle(
                          fontSize: 12,
                          color:UniVerseColours.kGray3,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
