import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/widgets/profile_picture.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/presentation/widgets/feed_widget.dart';

import '../../../../core/constants/sizes.dart';
import '../providers/comment_provider.dart';

class CommentScreen extends HookConsumerWidget {
  final Tweet feed;

  const CommentScreen({super.key, required this.feed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(chatProvider(feed.id!));
    final commentController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
        title: const Text(
          "Tweet",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FeedWidget(tweet: feed),
                  comments.when(data: (data) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return CommentWidget(feed: data[index]);
                      },
                      separatorBuilder: (_, __) {
                        return gapH16;
                      },
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 40),
                    );
                  }, error: (_, __) {
                    return const Text('Error');
                  }, loading: () {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: UniVerseColours.kPurple,
                      ),
                    );
                  }),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: TextFormField(
                controller: commentController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: UniVerseColours.kGray3,
                      width: 0.3,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  hintText: "Send your comment.....",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w100, fontSize: 13.sp),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: ProfilePicture(),
                  ),
                  filled: true,
                  fillColor: UniVerseColours.kSecondary,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (commentController.text.isNotEmpty) {
                        ref
                            .read(commentNotifier.notifier)
                            .addComment(commentController.text, feed.id!);
                        commentController.clear();
                      }
                    },
                    child: const Icon(
                      SolarIconsBold.plain3,
                      color: UniVerseColours.kPurple,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final Tweet feed;

  const CommentWidget({super.key, required this.feed});

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
                      Color(feed.color ?? 0XFFFFFF).withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(feed.profileImage ?? ''),
                  ),
                ),
                gapW12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feed.name ?? '',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Text(
                      feed.userName ?? '',
                      style: TextStyle(
                          fontSize: 12.sp, color: UniVerseColours.kGray3),
                    )
                  ],
                ),
              ],
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 63.0),
            child: Text(
              feed.content ?? '',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 63.0),
            child: Row(
              children: [
                const Icon(
                  SolarIconsOutline.heart,
                  color: UniVerseColours.kGray3,
                  size: 18,
                ),
                gapW4,
                Text(
                  feed.likes!.toString(),
                  style: TextStyle(
                      color: UniVerseColours.kGray3, fontSize: 14.sp),
                ),
                gapW24,
                const Icon(
                  SolarIconsOutline.chatDots,
                  color: UniVerseColours.kGray3,
                  size: 18,
                ),
                gapW4,
                Text(
                  feed.comments!.toString(),
                  style: TextStyle(
                      color: UniVerseColours.kGray3, fontSize: 14.sp),
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
