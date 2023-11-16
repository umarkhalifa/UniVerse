import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/models/lecture.dart';

class ScheduleDataSource {
  final FirebaseFirestore _firestore;

  ScheduleDataSource(this._firestore);


  // ! FETCH TIME TABLE
  Future<List<LectureModel>> getCurrentLectures({required String level}) async {
    try {
      final data = await _firestore
          .collection("TIMETABLE")
          .doc("NAAS")
          .collection("SOFTWARE ENGINEERING")
          .doc(level.toUpperCase())
          .collection("HARMATTAN")
          .get();
      return [
        for (var element in data.docs) LectureModel.fromFireStore(element)
      ];
    } catch (e) {
      throw 'Error fetching courses';
    }
  }
}

final scheduleDataProvider = Provider((ref) {
  return ScheduleDataSource(FirebaseFirestore.instance);
});