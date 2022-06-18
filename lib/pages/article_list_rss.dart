import 'package:flutter/material.dart';
import 'package:game_news_feed/classes/feed.dart';
import 'package:game_news_feed/widgets/app_bar_sliver.dart';
import 'package:game_news_feed/widgets/article_tile.dart';
import 'package:game_news_feed/widgets/dateTile.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:webfeed/webfeed.dart';

class ArticleListRss extends StatefulWidget {

  String feedUrl;

  ArticleListRss({Key? key,required this.feedUrl}) : super(key: key);

  @override
  _ArticleListRssState createState() => _ArticleListRssState();
}

class _ArticleListRssState extends State<ArticleListRss> {

  List<RssItem> _articlesList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getRssData();
  }

  Future<void> getRssData() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(widget.feedUrl)).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Text('Loading Error'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () => getRssData(),
          ),
        ));
      },
    );
    var channel = RssFeed.parse(response.body);
    _articlesList = channel.items!.toList();

    setState(() {
      _articlesList;
      _loading = false;
    });
    client.close();
  }

  bool checkDate(int index) {
    return Jiffy(_articlesList[index == 0 ? index : index - 1].pubDate!)
        .format("dd/MM/yyyy") !=
        Jiffy(_articlesList[index].pubDate!).format("dd/MM/yyyy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:RefreshIndicator(
            onRefresh: getRssData,
            color: Theme.of(context).colorScheme.primary,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: _loading
                  ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
                  : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _articlesList.length < 20 ?  _articlesList.length : 20,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Visibility(
                                  visible: index == 0,
                                  child: DateTile(
                                    data: _articlesList[index].pubDate!,
                                    index: index,
                                  )
                              ),
                              Visibility(
                                  visible: checkDate(index),
                                  child: DateTile(
                                     data: _articlesList[index].pubDate!,
                                    index: index,
                                  )
                              ),
                              ArticleTile(
                                feed: Feed(
                                  link: _articlesList[index].link,
                                    title: _articlesList[index].title!,
                                    data: _articlesList[index].pubDate.toString(),
                                ),
                              ),
                            ],
                          );
                        }
                        ),
                    const SizedBox(
                      height: 50,
                    )
                  ]),
            ),
          ),
        );
  }
}