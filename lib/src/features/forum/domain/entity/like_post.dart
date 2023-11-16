class LikePost{

  final String? userId;
  final String? postId;
  final String? id;

  LikePost({this.userId, this.postId,this.id});

  @override
  String toString() {
    return 'LikePost{userId: $userId, postId: $postId, id: $id}';
  }
}