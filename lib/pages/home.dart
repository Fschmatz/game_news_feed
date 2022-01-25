import 'package:flutter/material.dart';
import 'package:game_news_feed/util/feeds_icons.dart';

import 'article_list_atom.dart';
import 'article_list_rss.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _articleList = [
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "https://www.rockpapershotgun.com/feed",
    ),
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "http://www.pcgamesn.com/mainrss.xml",
    ),
    ArticleListAtom(
      key: UniqueKey(),
      feedUrl: "https://www.reddit.com/r/gamernews/.rss",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _articleList[_currentIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).navigationBarTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.games_outlined,),
                selectedIcon: Icon(
                  Icons.games,
                  color: Colors.black87,
                ),
                label: 'Rock Paper Shotgun',
              ),
              NavigationDestination(
                icon: Icon(Icons.computer_outlined),
                selectedIcon: Icon(
                  Icons.computer,
                  color: Colors.black87,
                ),
                label: 'PCGamesN',
              ),
              NavigationDestination(
                icon: Icon(FeedsIcons.reddit_alien,size: 22,),
                selectedIcon: Icon(
                  FeedsIcons.reddit_alien,
                  size: 22,
                  color: Colors.black87,
                ),
                label: 'r/gamernews',
              ),
            ],
          ),
        ),
      ),
    );
  }
}