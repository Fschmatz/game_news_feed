import 'package:flutter/material.dart';
import 'package:game_news_feed/classes/feed.dart';
import 'package:game_news_feed/widgets/app_bar_sliver.dart';
import 'package:game_news_feed/widgets/article_tile.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class ArticleListAtom extends StatefulWidget {
  String feedUrl;

  ArticleListAtom({Key? key, required this.feedUrl}) : super(key: key);

  @override
  _ArticleListAtomState createState() => _ArticleListAtomState();
}

class _ArticleListAtomState extends State<ArticleListAtom> {
  List<AtomItem> _articlesList = [];
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
    var channel = AtomFeed.parse(response.body);
    setState(() {
      _articlesList = channel.items!.toList();
      _loading = false;
    });
    client.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[const AppBarSliver()];
      },
      body: RefreshIndicator(
        onRefresh: getRssData,
        color: Theme.of(context).colorScheme.primary,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 0,
                              ),
                          shrinkWrap: true,
                          itemCount:  _articlesList.length < 20 ?  _articlesList.length : 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: ArticleTile(
                                feed: Feed(
                                  link: _articlesList[index].links![0].href!,
                                  title: _articlesList[index].title!,
                                  data: _articlesList[index].published!,
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 50,
                      )
                    ]),
        ),
      ),
    ));
  }
}