import 'package:flutter/material.dart';
import 'package:game_news_feed/classes/feed.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatefulWidget {
  @override
  _ArticleTileState createState() => _ArticleTileState();

  Feed feed;

  ArticleTile({Key? key, required this.feed}) : super(key: key);
}

class _ArticleTileState extends State<ArticleTile> {
  _launchBrowser(String url) async {
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _launchBrowser(widget.feed.link!);
      },
      onLongPress: () {
        Share.share(widget.feed.link!);
      },
      title: Text(
        //remover tags html do GameDeveloper
        widget.feed.title!.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
