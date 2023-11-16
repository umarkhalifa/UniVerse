import 'dart:developer';
import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/model/like_post_model.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uuid/uuid.dart';

class FeedDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  FeedDataSource(this._firestore, this._firebaseAuth);

  Stream<List<TweetModel>> streamTweets({required String level}) {
    try {
      final collection = _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase()).orderBy('timeStamp',descending: true)
          .snapshots();
      return collection.map((event) =>
          event.docs.map((e) => TweetModel.fromFirestore(e)).toList());
    } catch (e) {
      throw 'Error fetching tweets. Please try again';
    }
  }

//  ! FETCH FEED

  Future<List<TweetModel>> fetchTweets(
      {required String level, required String lastId}) async {
    try {
      // ! DECLARE THE FIREBASE COLLECTION
      final collection = _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase());

      /// ! Check if tweets has been fetched before so you can fetch tweets
      /// starting from the last tweet id
      if (lastId != '') {
        /// ! Get last tweet id
        final lastTweet = await collection.doc(lastId).get();

        /// Fetch tweets starting from last tweet
        final value = await collection
            .limit(10)
            .orderBy('timeStamp', descending: true)
            .startAfterDocument(lastTweet)
            .get();
        return [
          for (DocumentSnapshot doc in value.docs) TweetModel.fromFirestore(doc)
        ];
      } else {
        /// If no tweet has been previously fetched, fetch first 10 tweets
        final value = await collection
            .limit(10)
            .orderBy('timeStamp', descending: true)
            .get();
        return [
          for (DocumentSnapshot doc in value.docs) TweetModel.fromFirestore(doc)
        ];
      }
    } catch (e) {
      log(e.toString());
      throw 'Error fetching feed';
    }
  }

//  ! REFRESH FEED
  Future<List<TweetModel>> refreshTweets({required String level}) async {
    try {
      // ! DECLARE THE FIREBASE COLLECTION
      final collection = _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase());
      final value = await collection
          .limit(10)
          .orderBy('timeStamp', descending: true)
          .get();
      return [
        for (DocumentSnapshot doc in value.docs) TweetModel.fromFirestore(doc)
      ];
    } catch (e) {
      throw 'Error fetching feed';
    }
  }

  Future<TweetModel> updateTweet(
      {required String id, required String level}) async {
    try {
      // ! DECLARE THE FIREBASE COLLECTION
      final tweet = await _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase())
          .doc(id)
          .get();
      return TweetModel.fromFirestore(tweet);
    } catch (e) {
      throw 'Error fetching tweet';
    }
  }

// ! FETCH COMMENTS
  Stream<List<TweetModel>> fetchComments({
    required String id,
    required String level,
  }) async* {
    try {
      final collection = _firestore
          .collection("COMMENT")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase())
          .where('tweetId', isEqualTo: id)
          .snapshots();
      List<TweetModel> tweets = [];
      collection.listen(
        (event) {
          for (var element in event.docs) {
            tweets.add(TweetModel.fromFirestore(element));
          }
        },
      );
      await Future.delayed(const Duration(seconds: 3));
      yield tweets;
    } catch (e) {
      log(e.toString());
      throw 'Error fetching feed';
    }
  }

//  ! ADD POST
  Future<TweetModel> uploadPost(
      {required TweetModel tweet, required String level}) async {
    try {
      if (tweet.image != '') {
        // Create a Reference to the file
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('FEED')
            .child(const Uuid().v4());

        await ref.putFile(io.File(tweet.image!));
        final url = await ref.getDownloadURL();
        tweet = tweet.copyWith(image: url);
      }
      final reference = await _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase())
          .add(tweet.toMap());
      return TweetModel.fromFirestore(await reference.get());
    } catch (e) {
      log(e.toString());
      throw "Couldn't upload post. Please try again";
    }
  }

// ! COMMENT ON FEED
  Future<TweetModel> commentOnPost({
    required TweetModel tweet,
    required String level,
  }) async {
    try {
      final collection = _firestore
          .collection("COMMENT")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase());
      final value = await collection.add(tweet.toMap());
      _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase())
          .doc(tweet.tweetId)
          .update({'comments': FieldValue.increment(1)});
      return TweetModel.fromFirestore(await value.get());
    } catch (e) {
      throw "Couldn't upload post. Please try again";
    }
  }

//  ! FETCH USERS LIKES
  Future<List<LikePostModel>> fetchLikes() async {
    try {
      final collection = await _firestore
          .collection("USERS")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('LIKES')
          .get();
      return collection.docs
          .map((e) => LikePostModel.fromFirestore(e))
          .toList();
    } catch (e) {
      throw 'Error';
    }
  }

  Future<String> likePost({
    required String postId,
    required String level,
  }) async {
    try {
      final like = await _firestore
          .collection("USERS")
          .doc(_firebaseAuth.currentUser?.uid)
          .collection("LIKES")
          .add(LikePostModel(
                  userId: _firebaseAuth.currentUser?.uid, postId: postId)
              .toMap());
      await _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase())
          .doc(postId)
          .update({'likes': FieldValue.increment(1)});
      return like.id;
    } catch (e) {
      log(e.toString());
      throw 'Error';
    }
  }

  Future<bool> unLikePost(
      {required String postId, required String level,required String id}) async {
    try {
      await _firestore
          .collection("USERS")
          .doc(_firebaseAuth.currentUser?.uid).collection('LIKES').doc(id).delete();
      await _firestore
          .collection("FEED")
          .doc('SOFTWARE ENGINEERING')
          .collection(level.toUpperCase())
          .doc(postId)
          .update({'likes': FieldValue.increment(-1)});
      return true;
    } catch (e) {
      throw 'Error';
    }
  }



// ! LIKE FEED
}

final feedDataProvider = Provider((ref) {
  return FeedDataSource(FirebaseFirestore.instance, FirebaseAuth.instance);
});
