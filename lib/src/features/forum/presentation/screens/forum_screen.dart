import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/presentation/providers/feed_provider.dart';
import 'package:uni_verse/src/features/forum/presentation/widgets/feed_empty_state.dart';
import 'package:uni_verse/src/features/forum/presentation/widgets/feed_shimmer.dart';
import 'package:uni_verse/src/features/forum/presentation/widgets/feed_text_field.dart';
import 'package:uni_verse/src/features/forum/presentation/widgets/feed_widget.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
        title: const Text(
          "Class Forum",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [FeedTextField(), gapH20, FeedHolder()],
          ),
        ),
      ),
    );
  }
}

class FeedHolder extends ConsumerWidget {
  const FeedHolder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(feedNotifier);
    final feedStream = ref.watch(tweetStream);
    return feedStream.when(
      data: (data) {
        return FeedList(
          feed: data,
        );
      },
      error: (_, __) {
        ref
            .read(snackBarProvider)
            .showErrorMessageSnackBar('Error fetching tweets');
        return const FeedEmptyState();
      },
      loading: () {
        return const FeedShimmer();
      },
    );
  }
}

class FeedList extends StatelessWidget {
  final List<Tweet> feed;

  const FeedList({
    super.key,
    required this.feed,
  });

  @override
  Widget build(BuildContext context) {
    return feed.isEmpty
        ? const FeedEmptyState()
        : ListView.separated(
            itemBuilder: (context, index) {
              final tweet = feed[index];
              return GestureDetector(
                onTap: () {
                  context.pushNamed(RouterNames.comments.name, extra: tweet);
                },
                child: FeedWidget(tweet: tweet),
              );
            },
            separatorBuilder: (_, __) {
              return gapH16;
            },
            itemCount: feed.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
  }
}
