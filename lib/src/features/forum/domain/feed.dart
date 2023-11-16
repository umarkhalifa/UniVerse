import 'dart:ui';

import 'package:uni_verse/src/core/constants/assets.dart';

class Feed{
  final Color? color;
  final String? name;
  final String? profilePic;
  final String? userName;
  final String? tweet;
  final String? image;
  final int? likes;
  final bool? isRetweet;
  final List<Feed>? comments;

  Feed({this.color, this.name,this.profilePic, this.userName, this.tweet, this.image, this.likes, this.isRetweet, this.comments});


}

final List<Feed> mockTweets = [
  Feed(
    color: colors[0],
    name: "Aisha Ahmad",
    profilePic: UniVerseAssets.female2,
    userName: "@A-Ahmad23",
    tweet: "Just finished my final exams! 😅 Can't believe the semester is over. Time to celebrate! 🎉📚",
    image: null,
    likes: 20,
    isRetweet: false,
    comments: [
      Feed(
        color: colors[1],
        name: "Usman Hassan",
        profilePic: males[5],
        userName: "@Hasan 56",
        tweet: "Congrats! 🎓 Enjoy your well-deserved break!",
        image: null,
        likes: 15,
        isRetweet: false,
        comments: [],
      ),
      Feed(
        color: colors[3],
        name: "Musa Ismail",
        profilePic: males[8],
        userName: "@Ismo 24",
        tweet: "Soft!, enjoyment plenty",
        image: null,
        likes: 3,
        isRetweet: false,
        comments: [],
      ),
    ],
  ),
  Feed(
    color: colors[2],
    name: "Bilal Nuradden",
    profilePic: males[11],
    userName: "@Bilboy-Jr",
    tweet: "Lost my student ID card today. 😩 Has anyone seen it?",
    image: null,
    likes: 8,
    isRetweet: false,
    comments: [
      Feed(
        color: colors[8],
        name: "Musa Ismail",
        profilePic: males[8],
        userName: "@Ismo 24",
        tweet: "Nope",
        image: null,
        likes: 3,
        isRetweet: false,
        comments: [],
      ),
      Feed(
        color: colors[2],
        name: "Hassan Kabir",
        profilePic: males[1],
        userName: "@HK",
        tweet: "E don go!",
        image: null,
        likes: 3,
        isRetweet: false,
        comments: [],
      ),
    ],
  ),
  Feed(
    color: colors[3],
    name: "Alamin Muhammad",
    profilePic: males[7],
    userName: "@Amin65",
    tweet: "This chelsea Squad sha!",
    image: null,
    likes: 12,
    isRetweet: false,
    comments: [],
  ),
  Feed(
    color: colors[4],
    name: "Nizaam Shahrudeen",
    userName: "@Nizam",
    profilePic: males[9],

    tweet: "Sen 205 holds by 9 today",
    image: null,
    likes: 25,
    isRetweet: false,
    comments: [
      Feed(
        color: colors[6],
        name: "Umar Khalifa",
        profilePic: males[3],
        userName: "@_umarkhalifa",
        tweet: "🧢",
        image: null,
        likes: 4,
        isRetweet: false,
        comments: [],
      ),
      Feed(
        color: colors[6],
        name: "Abdul Aliyu",
        profilePic: males[0],
        userName: "@_AA",
        tweet: "Tell am say we no come",
        image: null,
        likes: 7,
        isRetweet: false,
        comments: [],
      ),
    ],
  ),
  Feed(
    color: colors[5],
    name: "Fareed Usman",
    profilePic: males[10],
    userName: "@Frank45",
    tweet: "Ohboy this Sen 207 hard die!",
    image: null,
    likes: 18,
    isRetweet: false,
    comments: [],
  ),
  Feed(
    color: colors[7],
    name: "Sadiq Ismail",
    profilePic: males[11],
    userName: "@Sadiq",
    tweet: "If i no cheat for this test make i bend",
    image: UniVerseAssets.meme,
    likes: 22,
    isRetweet: false,
    comments: [
      Feed(
        color: colors[8],
        name: "Isabel",
        profilePic: females[5],

        userName: "@Isabel12",
        tweet: "🤣",
        image: null,
        likes: 5,
        isRetweet: false,
        comments: [
          Feed(
            color: colors[0],
            name: "Umar Khalifa",
            profilePic: males[3],
            userName: "@_umarkhalifa",
            tweet: "Why you dey laugh😂",
            image: null,
            likes: 0,
            isRetweet: false,
            comments: [],
          ),
          Feed(
            color: colors[6],
            name: "Bilal Nuradeen",
            profilePic: males[6],
            userName: "@Bilboy-jr",
            tweet: "To laugh na crime😂",
            image: null,
            likes: 2,
            isRetweet: false,
            comments: [],
          ),

        ],
      ),
      Feed(
        color: colors[8],
        name: "Khalif Umar",
        profilePic: males[3],
        userName: "@_umarkhalifa",
        tweet: "I dey ur side😂",
        image: null,
        likes: 5,
        isRetweet: false,
        comments: [],
      ),
      Feed(
        color: colors[8],
        name: "Bilal Nuradeen",
        profilePic: males[11],
        userName: "@Bilboy-Jr",
        tweet: "That one sure",
        image: null,
        likes: 5,
        isRetweet: false,
        comments: [],
      ),

    ],
  ),
  Feed(
    color: colors[8],
    name: "Ismail Nuhu",
    profilePic: males[6],
    userName: "@Nuhu",
    tweet: "Make i catch these security one day!😂",
    image: null,
    likes: 5,
    isRetweet: false,
    comments: [],
  ),
];

