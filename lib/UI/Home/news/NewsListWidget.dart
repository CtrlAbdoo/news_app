import 'package:flutter/material.dart';
import 'package:news_app/UI/Home/news/NewsWidget.dart';
import 'package:news_app/model/News.dart';
import 'package:news_app/model/Source.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
  NewsListWidget(this.source,{super.key});
  List<News> newsList =[
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
    News(10, "Why are football's biggest clubs starting a new \ntournament?",
        'assets/images/liver.png', 'Sun 19 march', 'BBC News'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return NewsWidget(newsList[index]);
        },
      itemCount: newsList.length,
    );
  }
}
