import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/API/ApiManager.dart';
import 'package:news_app/SourcesResponse/Source.dart';
import 'package:news_app/UI/Home/news/NewsViewModel.dart';
import 'package:news_app/UI/Home/news/NewsWidget.dart';



class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source,{super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.source.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var newsList = state.newsList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsWidget(newsList![index]);
                },
                itemCount: newsList?.length ?? 0,
              );
            }
          case ErrorState():
            {
            return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AlertDialog(
                            title: const Text("Error"),
                            content:
                            Text(state.message),
                            actions: [
                              ElevatedButton(
                                onPressed: ()async {
                                  viewModel.loadNews(widget.source.id);
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
          case LoadingState():
            {
              return Center(child: CircularProgressIndicator());
            }
        }
      },
    );
    // return FutureBuilder(
    //     future: ApiManager.getNews(widget.source.id!),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //       if (snapshot.hasError || snapshot.data?.status == 'error') {
    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               AlertDialog(
    //                 title: const Text("Error"),
    //                 content:
    //                 Text(snapshot.data?.message ?? snapshot.error.toString()),
    //                 actions: [
    //                   ElevatedButton(
    //                     onPressed: ()async {
    //                       await ApiManager.getNews(widget.source.id!);
    //                       setState(() {
    //
    //                       });
    //                     },
    //                     child: const Text("Try Again"),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //
    //       var newsList = snapshot.data?.articles;
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           return NewsWidget(newsList![index]);
    //         },
    //         itemCount: newsList?.length??0,
    //       );
    //     },
    // );

  }
}
