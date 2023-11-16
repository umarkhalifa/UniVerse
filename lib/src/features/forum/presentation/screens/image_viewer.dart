import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/colors.dart';

class ImageViewer extends StatelessWidget {
  final String image;
  final String tweetId;

  const ImageViewer({super.key, required this.image, required this.tweetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: UniVerseColours.kWhite),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: tweetId,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
