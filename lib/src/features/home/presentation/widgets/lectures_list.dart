import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/home/presentation/widgets/home_widgets.dart';
import 'package:uni_verse/src/features/schedule/presentation/widgets/lecture_card.dart';
class LecturesList extends StatelessWidget {
  final List<Lecture> lectures;

  const LecturesList({
    super.key,
    required this.lectures,
  });

  @override
  Widget build(BuildContext context) {
    return lectures.isEmpty
        ? const LecturesEmptyState()
        : ListView.separated(
      itemBuilder: (context, index) {
        final lecture = lectures[index];
        return LectureCard(lecture: lecture);
      },
      separatorBuilder: (_, __) {
        return gapH20;
      },
      itemCount: lectures.length ,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
