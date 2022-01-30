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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchBrowser(widget.feed.link!);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    //remover tags html do GameDeveloper
                    widget.feed.title!.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 55,
                  child: TextButton(
                    onPressed: () {
                      Share.share(widget.feed.link!);
                    },
                    child: Icon(
                      Icons.share_outlined,
                      size: 18.0,
                      color: Theme.of(context)
                          .textTheme
                          .headline6!
                          .color!
                          .withOpacity(0.7),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Theme.of(context).cardTheme.color,
                      onPrimary: Theme.of(context).colorScheme.secondaryVariant,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}