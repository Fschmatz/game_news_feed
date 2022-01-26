import 'package:flutter/material.dart';
import 'package:game_news_feed/classes/feed.dart';
import 'package:game_news_feed/widgets/app_bar_sliver.dart';
import 'package:game_news_feed/widgets/article_tile.dart';
import 'package:game_news_feed/widgets/dateTile.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
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
    _articlesList = channel.items!.toList();

    //ORGANIZE REDDIT FEED
    _articlesList.sort((a,b) => a.published!.compareTo(b.published!));
    List<AtomItem> reversedList = List.from(_articlesList.reversed);

    setState(() {
      _articlesList = reversedList;
      _loading = false;
    });
    client.close();
  }

  bool checkDate(int index) {
    return Jiffy(_articlesList[index == 0 ? index : index - 1].published!)
        .format("dd/MM/yyyy") !=
        Jiffy(_articlesList[index].published!).format("dd/MM/yyyy");
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
                          //reverse: true,
                          shrinkWrap: true,
                          itemCount:  _articlesList.length < 20 ?  _articlesList.length : 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Column(
                                children: [
                                  Visibility(
                                      visible: index == 0,
                                      child: DateTile(
                                        data: DateTime.parse(_articlesList[index].published!),
                                        index: index,
                                      )
                                  ),
                                  Visibility(
                                      visible: checkDate(index),
                                      child: DateTile(
                                        data: DateTime.parse(_articlesList[index].published!),
                                        index: index,
                                      )
                                  ),
                                  ArticleTile(
                                    feed: Feed(
                                      link: _articlesList[index].links![0].href!,
                                      title: _articlesList[index].title!,
                                      data: _articlesList[index].published!,
                                    ),
                                  ),
                                ],
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
