import 'package:flutter/material.dart';
import 'package:news_app/API/ApiManager.dart';
import 'package:news_app/UI/Home/Categories/Category.dart';
import 'package:news_app/UI/Home/CategoryDetails/sourceTabsWidget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot){
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
                       await ApiManager.getSources(widget.category.id);
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
        var sourceList = snapshot.data?.sources;
        return sourceTabsWidget(sourceList!);
      }
    );
  }
}
