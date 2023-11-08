import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/Home/Categories/Category.dart';
import 'package:news_app/UI/Home/CategoryDetails/CategoryDetailsViewModel.dart';
import 'package:news_app/UI/Home/CategoryDetails/sourceTabsWidget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var sourcesList = state.sourcesList;
              return sourceTabsWidget(sourcesList!);
            }
          case LoadingState():
            {
              return Center(
                  child: Column(
                    children: [
                      Text(state.message),
                      CircularProgressIndicator(),
                    ],
                  ));
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
                      Text(state.errorMessage),
                      actions: [
                        ElevatedButton(
                          onPressed: ()async {
                            viewModel.loadSources(widget.category.id);
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
        }
      },
    );
    // return FutureBuilder(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot){
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError || snapshot.data?.status == 'error') {
    //       return Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             AlertDialog(
    //               title: const Text("Error"),
    //               content:
    //                   Text(snapshot.data?.message ?? snapshot.error.toString()),
    //               actions: [
    //                 ElevatedButton(
    //                   onPressed: ()async {
    //                    await ApiManager.getSources(widget.category.id);
    //                    setState(() {
    //
    //                    });
    //                   },
    //                   child: const Text("Try Again"),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //     var sourceList = snapshot.data?.sources;
    //     return sourceTabsWidget(sourceList!);
    //   }
    // );
  }
}
