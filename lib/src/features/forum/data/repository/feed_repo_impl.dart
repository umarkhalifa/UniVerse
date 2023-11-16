import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/data_source/feed_data_source.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uni_verse/src/features/forum/domain/entity/like_post.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/domain/repository/feed_repostiory.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedDataSource _dataSource;

  FeedRepositoryImpl(this._dataSource);

  @override
  Stream<Either<Failure, List<Tweet>>> fetchComments(
      {required String level, required String id}) async* {
    try {
      ///
      final data = _dataSource.fetchComments(
        id: id,
        level: level,
      );
      List<Tweet> tweets = [];
      await data.forEach((element) {
        tweets = element;
      });

      yield Right(tweets);
    } catch (e) {
      yield Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Tweet>>> fetchTweets(
      {required String level, required String lastId}) async {
    try {
      final data = await _dataSource.fetchTweets(level: level, lastId: lastId);
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Tweet>>> refreshTweets(
      {required String level, required Set<String> tweetIds}) async {
    try {
      /// Fetch latest 10 tweets then map through our list of tweet ids to check
      /// if any of the tweets have been previously fetched. to avoid duplicity
      /// of tweets
      final data = await _dataSource.refreshTweets(level: level);
      final tweet = data.where((element) => !tweetIds.contains(element.id)).toList();
      return Right(tweet);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tweet>> addComment({
    required TweetModel tweet,
    required String level,
  }) async {
    try {
      final data = await _dataSource.commentOnPost(tweet: tweet, level: level);
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tweet>> uploadPost(
      {required TweetModel tweet, required String level}) async {
    try {
      final data = await _dataSource.uploadPost(tweet: tweet, level: level);
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tweet>> updateTweet(
      {required String id, required String level}) async {
    try {
      final data = await _dataSource.updateTweet(id: id, level: level);
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteLike({required String postId,required String level,required String id}) async {
    try {
      return Right(await _dataSource.unLikePost(postId: postId,level: level,id: id));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LikePost>>> fetchLikes() async {
    try {
      final data = await _dataSource.fetchLikes();
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> likeTweet({required String postId,required String level}) async {
    try {
      return Right(await _dataSource.likePost(postId: postId,level: level));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

final feedRepoProvider = Provider((ref) {
  final data = ref.read(feedDataProvider);
  return FeedRepositoryImpl(data);
});
