import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_verse/src/features/home/domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel(
    super.userName,
    super.color,
    super.avatar,
    super.department,
    super.level,
  );

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    return UserModel(
      snapshot['User Name'],
      snapshot['Color'],
      snapshot['Avatar'],
      snapshot['Department'],
      snapshot['Level'],
    );
  }
}
