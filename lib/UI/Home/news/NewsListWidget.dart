import 'package:flutter/material.dart';
import 'package:news_app/SourcesResponse/Source.dart';
import 'package:news_app/UI/Home/news/NewsListViewModel.dart';
import 'package:news_app/UI/Home/news/NewsWidget.dart';
import 'package:provider/provider.dart';



class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source,{super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsListViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.source.id??'');
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsListViewModel>(

        builder: (context, viewModel, child) {
          if (viewModel.showLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    title: const Text("Error"),
                    content:
                    Text(viewModel.errorMessage ?? ' '),
                    actions: [
                      ElevatedButton(
                        onPressed: ()async {
                          viewModel.getNews(widget.source.id!);
                          setState(() {

                          });
                        },
                        child: const Text("Try Again"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          var newsList = viewModel.newsList;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList![index]);
            },
            itemCount: newsList?.length??0,
          );
        },
      ),
    );
  }
}
