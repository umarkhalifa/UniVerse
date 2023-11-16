import 'package:dartz/dartz.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uni_verse/src/features/forum/domain/entity/like_post.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<Tweet>>> fetchTweets(
      {required String level, required String lastId});

  Future<Either<Failure, List<Tweet>>> refreshTweets({required String level, required Set<String> tweetIds });


  Stream<Either<Failure, List<Tweet>>> fetchComments(
      {required String level, required String id});

  Future<Either<Failure, Tweet>> uploadPost(
      {required TweetModel tweet, required String level});


  Future<Either<Failure, Tweet>> addComment(
      {required TweetModel tweet, required String level});

  Future<Either<Failure, Tweet>> updateTweet(
      {required String id, required String level});

  Future<Either<Failure,List<LikePost>>> fetchLikes();
  Future<Either<Failure,String>> likeTweet({required String postId,required String level});
  Future<Either<Failure,bool>> deleteLike({required String postId,required String level,required String id});



}
