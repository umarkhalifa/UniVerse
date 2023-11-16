import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/presentation/widgets/home_widgets.dart';
class HomeCourseList extends StatelessWidget {
  final List<Course> courses;

  const HomeCourseList({
    super.key,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(
            course: course,
          );
        },
        separatorBuilder: (_, __) {
          return gapW20;
        },
        itemCount: courses.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
