import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet{
  final String? id;
  final String? content;
  final String? image;
  final int? color;
  final String? profileImage;
  final String? tweetId;
  final String? name;
  final String? userName;
  final int? likes;
  final int? comments;
  final Timestamp? timestamp;
  const Tweet({
    this.id,
    this.content,
    this.image,
    this.color,
    this.profileImage,
    this.tweetId,
    this.name,
    this.userName,
    this.likes,
    this.comments,
    this.timestamp
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tweet &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          content == other.content &&
          image == other.image &&
          color == other.color &&
          profileImage == other.profileImage &&
          tweetId == other.tweetId &&
          name == other.name &&
          userName == other.userName &&
          timestamp == other.timestamp;

  @override
  int get hashCode =>
      id.hashCode ^
      content.hashCode ^
      image.hashCode ^
      color.hashCode ^
      profileImage.hashCode ^
      tweetId.hashCode ^
      name.hashCode ^
      userName.hashCode ^
      timestamp.hashCode;

  @override
  String toString() {
    return 'Tweet{id: $id, content: $content, image: $image, color: $color, profileImage: $profileImage, tweetId: $tweetId, name: $name, userName: $userName, likes: $likes, comments: $comments, timestamp: $timestamp}';
  }
}