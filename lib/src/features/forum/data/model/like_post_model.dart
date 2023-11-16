import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_verse/src/features/forum/domain/entity/like_post.dart';

class LikePostModel extends LikePost {
  LikePostModel({
    super.userId,
    super.postId,
    super.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'postId': postId,
    };
  }

  factory LikePostModel.fromFirestore(DocumentSnapshot snapshot) {
    return LikePostModel(
        userId: snapshot['userId'], postId: snapshot['postId'],id: snapshot.id);
  }
}
