import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouterNames.courseDetail.name, extra: course);
      },
      child: Container(
        height: 180,
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
            color: UniVerseColours.kSecondary,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  child: Text(
                    '${course.courseCode?.substring(0, 2)}',
                  ),
                ),
                gapW16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${course.courseTitle}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        '${course.courseCode}',
                        style: TextStyle(
                            fontSize: 12.sp, color: UniVerseColours.kGray3),
                      )
                    ],
                  ),
                ),
              ],
            ),
            gapH16,
            const Divider(
              thickness: 0.2,
            ),
            gapW16,
            Row(
              children: [
                const Icon(
                  SolarIconsOutline.notes,
                  size: 17,
                  color: UniVerseColours.kGray3,
                ),
                gapH4,
                Text(
                  "${course.creditHours} Units",
                  style:
                      TextStyle(fontSize: 13.sp, color: UniVerseColours.kGray3),
                ),
                const Spacer(),
                Text(
                  course.status == 'C'
                      ? "Compulsory".toUpperCase()
                      : "Required".toUpperCase(),
                  style: TextStyle(
                      fontSize: 10.sp, color: UniVerseColours.kPurple),
                ),
              ],
            ),
            gapH24,
            const Spacer(),
            Row(
              children: [
                const Icon(
                  SolarIconsOutline.user,
                  color: UniVerseColours.kGray3,
                ),
                gapW8,
                Expanded(
                  child: Text(
                    '${course.instructor}',
                    style: const TextStyle(
                      color: UniVerseColours.kGray3,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
