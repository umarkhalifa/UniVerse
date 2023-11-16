import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel(
      {super.courseCode,
      super.courseTitle,
      super.creditHours,
      super.description,
      super.instructor,
      super.status,super.materials,super.pastQuestions});

  factory CourseModel.fromFireStore(DocumentSnapshot snapshot){
    return CourseModel(
      courseCode: snapshot['courseCode'],
      courseTitle: snapshot['courseTitle'],
      creditHours: snapshot['creditHours'],
      description: snapshot['description'],
      instructor: snapshot['instructor'],
      status: snapshot['status'],
      materials: snapshot['materials'],
      pastQuestions: snapshot['pastQuestions']
    );
  }
}
