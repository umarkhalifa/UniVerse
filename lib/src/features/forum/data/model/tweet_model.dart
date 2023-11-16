import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';

class TweetModel extends Tweet {
  TweetModel(
      {super.content,
        super.id,
      super.comments,
      super.image,
        super.color,
      super.likes,
      super.name,
      super.profileImage,
      super.userName,super.timestamp,super.tweetId});

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'content': content,
      'image': image,
      'color': color,
      'profileImage': profileImage,
      'name': name,
      'userName': userName,
      'likes': likes,
      'comments': comments,
      'timeStamp': timestamp,
      'tweetId':tweetId
    };
  }

  factory TweetModel.fromFirestore(DocumentSnapshot snapshot){
      return TweetModel(
        id: snapshot.id,
          content: snapshot['content'],
          image: snapshot['image'],
          profileImage: snapshot['profileImage'],
          name: snapshot['name'],
          userName: snapshot['userName'],
          likes: snapshot['likes'],
          comments: snapshot['comments'],
        timestamp: snapshot['timeStamp'],
        color: snapshot['color'],
        tweetId: snapshot['tweetId']
      );
  }
  TweetModel copyWith({
    String? id,
    String? content,
    String? image,
    int? color,
    String? profileImage,
    String? name,
    String? userName,
    int? likes,
    int? comments,
    Timestamp? timestamp,
    String? tweetId,
  }) {
    return TweetModel(
      id: id ?? this.id,
      content: content ?? this.content,
      image: image ?? this.image,
      color: color ?? this.color,
      profileImage: profileImage ?? this.profileImage,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      timestamp: timestamp ?? this.timestamp,
      tweetId: tweetId ?? this.tweetId
    );
  }






}
