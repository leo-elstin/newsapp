import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/data_model/news_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.details}) : super(key: key);
  final Article details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.bookmark_outline_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.ios_share),
          ),
        ],
      ),
      body: Column(
        children: [
          Image(
            image: NetworkImage(details.urlToImage ?? 'Not Available'),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              details.title ?? 'Content Unavailable',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.comment_sharp),
                Icon(Icons.favorite),
                Icon(Icons.share),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              details.content!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
