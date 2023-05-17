import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return VideoTile(
            thumbnail: AssetImage('lib/assets/image.jpg'),
            title: 'Video ${index + 1}',
            author: 'Author ${index + 1}',
            length: Duration(minutes: index + 1, seconds: (index * 10) % 60),
            viewCount: (index + 1) * 1000,
          );
        },
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  final ImageProvider thumbnail;
  final String title;
  final String author;
  final Duration length;
  final int viewCount;

  const VideoTile({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.author,
    required this.length,
    required this.viewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: thumbnail,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(author),
                const SizedBox(height: 4),
                Text('${length.inMinutes}:${length.inSeconds % 60} - $viewCount views'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
