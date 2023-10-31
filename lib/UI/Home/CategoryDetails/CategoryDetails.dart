import 'package:flutter/material.dart';
import 'package:news_app/UI/Home/Categories/Category.dart';
import 'package:news_app/UI/Home/CategoryDetails/CategoryDetailsViewModel.dart';
import 'package:news_app/UI/Home/CategoryDetails/sourceTabsWidget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category, {super.key});
  var viewModel = CategoryDetailsViewModel();

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.viewModel,
      child: Consumer<CategoryDetailsViewModel>(

        builder: (context, viewModel, child) {
          if (widget.viewModel.showLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (widget.viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    title: const Text("Error"),
                    content: Text(widget.viewModel.errorMessage ?? ' '),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          viewModel.getSources(widget.category.id);
                          setState(() {});
                        },
                        child: const Text("Try Again"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          var sourceList = widget.viewModel.newSourcesList;
          return sourceTabsWidget(sourceList!);
        },
      ),
    );
    // return FutureBuilder(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot){
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError || snapshot.data?.status == 'error') {
    //       return Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             AlertDialog(
    //               title: Text("Error"),
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
    //                   child: Text("Try Again"),
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
