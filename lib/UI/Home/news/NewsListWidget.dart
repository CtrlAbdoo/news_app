import 'package:flutter/material.dart';
import 'package:news_app/API/ApiManager.dart';
import 'package:news_app/SourcesResponse/Source.dart';
import 'package:news_app/UI/Home/news/NewsWidget.dart';



class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source,{super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(widget.source.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data?.status == 'error') {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    title: Text("Error"),
                    content:
                    Text(snapshot.data?.message ?? snapshot.error.toString()),
                    actions: [
                      ElevatedButton(
                        onPressed: ()async {
                          await ApiManager.getNews(widget.source.id!);
                          setState(() {

                          });
                        },
                        child: Text("Try Again"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          var newsList = snapshot.data?.articles;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList![index]);
            },
            itemCount: newsList?.length??0,
          );
        },
    );

  }
}
