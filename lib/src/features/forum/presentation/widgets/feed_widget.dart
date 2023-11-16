import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/presentation/providers/feed_provider.dart';

class FeedWidget extends StatelessWidget {
  final Tweet tweet;

  const FeedWidget({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      Color(tweet.color ?? 0XFF000000).withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(
                      tweet.profileImage ?? '',
                      errorBuilder: (context, _, __) {
                        return const Icon(
                          Icons.error,
                          color: UniVerseColours.kPurple,
                        );
                      },
                    ),
                  ),
                ),
                gapW12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tweet.name ?? '',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          tweet.userName ?? '',
                          style: TextStyle(
                              fontSize: 12.sp, color: UniVerseColours.kGray3),
                        ),
                        gapW4,
                        Text(
                          timeago.format(
                            DateTime.fromMicrosecondsSinceEpoch(
                                tweet.timestamp!.microsecondsSinceEpoch),
                          ),
                          style: TextStyle(
                              fontSize: 12.sp, color: UniVerseColours.kGray3),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              tweet.content ?? '',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          tweet.image != ''
              ? GestureDetector(
                  onTap: () {
                    context.pushNamed(RouterNames.imageView.name,
                        extra: {'id': tweet.tweetId!, 'image': tweet.image!});
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          tweet.image!,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.low,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                LikeRow(tweet.id!, tweet.likes!),
                gapW24,
                const Icon(
                  SolarIconsOutline.chatDots,
                  color: UniVerseColours.kGray3,
                  size: 18,
                ),
                gapW4,
                Text(
                  tweet.comments.toString(),
                  style:
                      TextStyle(color: UniVerseColours.kGray3, fontSize: 14.sp),
                ),
              ],
            ),
          ),
          gapH4,
          const Divider(
            thickness: 0.2,
            color: UniVerseColours.kGray3,
          ),
        ],
      ),
    );
  }
}

class LikeRow extends ConsumerWidget {
  final String id;
  final int likes;

  const LikeRow(this.id, this.likes, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeState = ref.watch(feedNotifier).likes;
    final userLikes = likeState!.map((e) => e.postId).toList();
    return Row(
      children: [
        GestureDetector(
          key: UniqueKey(),
          onTap: () {
            if (userLikes.contains(id)) {
              ref.read(feedNotifier.notifier).unLikeTweet(postId: id,id: userLikes.indexOf(id));
            } else {
              ref.read(feedNotifier.notifier).likeTweet(postId: id);
            }
          },
          child: userLikes.contains(id)
              ? Icon(
                  key: UniqueKey(),
                  SolarIconsBold.heart,
                  color: UniVerseColours.kPurple,
                )
              : Icon(
                  key: UniqueKey(),
                  SolarIconsOutline.heart,
                  color: UniVerseColours.kGray3,
                ).animate(effects: [
                  const ScaleEffect(duration: Duration(milliseconds: 400))
                ]),
        ),
        gapW4,
        Text(
          '$likes',
          style: TextStyle(color: UniVerseColours.kGray3, fontSize: 14.sp),
        ),
      ],
    );
  }
}
