import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';

class LectureModel extends Lecture {
  LectureModel(
      {super.code,
      super.day,
      super.endTime,
      super.semester,
      super.startTime,
      super.title,
      super.venue});

  factory LectureModel.fromFireStore(DocumentSnapshot snapshot) {
    return LectureModel(
        code: snapshot['code'],
        day: snapshot['day'],
        endTime: snapshot['endTime'],
        semester: snapshot['semester'].toString().toSemester(),
        startTime: snapshot['startTime'],
        title: snapshot['title'],
        venue: snapshot['venue']);
  }
}
