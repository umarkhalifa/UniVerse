import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/models/course.dart';
import 'package:uni_verse/src/features/home/data/models/lecture.dart';
import 'package:uni_verse/src/features/home/data/models/user.dart';

class HomeDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  HomeDataSource(this._firebaseAuth, this._firestore);

// ! GET USER PROFILE INFORMATION
  Future<UserModel> getUser() async {
    try {
      final data = await _firestore
          .collection("USERS")
          .doc(_firebaseAuth.currentUser?.uid)
          .get();
      return UserModel.fromFirestore(data);
    } catch (e) {
      throw 'Error getting user profile';
    }
  }

// ! GET FIVE COURSES OF THE USER

  Future<List<CourseModel>> getHomeCourses({required String level}) async {
    try {
      final data = await _firestore
          .collection("COURSES")
          .doc("SOFTWARE ENGINEERING")
          .collection(level.toUpperCase())
          .limit(5)
          .get();
      return [
        for (var element in data.docs) CourseModel.fromFireStore(element)
      ];
    } catch (e) {
      throw 'Error fetching courses';
    }
  }

// ! GET THE USERS LECTURES FOR THE DAY

  Future<List<LectureModel>> getCurrentLectures({required String level}) async {
    try {
      final data = await _firestore
          .collection("TIMETABLE")
          .doc("NAAS")
          .collection("SOFTWARE ENGINEERING")
          .doc(level.toUpperCase())
          .collection("HARMATTAN")
          .where('day', isEqualTo: DateTime.now().weekday)
          .get();


      return[
        for(DocumentSnapshot doc in data.docs) LectureModel.fromFireStore(doc)
      ];
    } catch (e) {
      log(e.toString());
      throw 'Error fetching courses';
    }
  }

  void test()async{
  }
//  ! FETCH COURSES
Future<List<CourseModel>> courses({required String level})async{
    try{
      final data = await _firestore
          .collection("COURSES")
          .doc("SOFTWARE ENGINEERING")
          .collection(level.toUpperCase())
          .get();
      return [
        for (var element in data.docs) CourseModel.fromFireStore(element)
      ];
    }catch (e) {
      log(e.toString());
      throw 'Error fetching courses';
    }

}
}

final homeDataProvider = Provider((ref) {
  return HomeDataSource(FirebaseAuth.instance, FirebaseFirestore.instance);
});
