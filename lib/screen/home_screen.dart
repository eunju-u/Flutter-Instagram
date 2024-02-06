import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [
        StoryArea(),
        FeedList(),
      ]),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) => UserStory(userName: 'User $index')),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration:
            BoxDecoration(color: Colors.amberAccent, borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: 'loou', likeCount: 50, content: '하루 시작'),
  FeedData(userName: 'eueueu', likeCount: 24, content: ''),
  FeedData(userName: 'eunju-u', likeCount: 82, content: '나들이~'),
  FeedData(userName: 'wwwei', likeCount: 92, content: '꺄악'),
  FeedData(userName: 'xuuu0_0', likeCount: 43, content: ''),
  FeedData(userName: 'xdvg', likeCount: 72, content: 'Happy'),
  FeedData(userName: 'yne4', likeCount: 3, content: '오운완'),
  FeedData(userName: 'kiso0', likeCount: 0, content: ''),
  FeedData(userName: 'hhhhhhh__', likeCount: 24, content: '여행 일기'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.grey.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
                  IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble)),
                  IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: feedData.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: feedData.content),
              ],
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}