import 'package:flutter/material.dart';
import 'package:news_app/UI/Home/Categories/Category.dart';
import 'package:news_app/UI/Home/CategoryDetails/sourceTabsWidget.dart';
import 'package:news_app/model/Source.dart';

class CategoryDetails extends StatelessWidget {
  Category category;
  CategoryDetails(this.category,{super.key});
  List<Source> sourceList = [
    Source('bbc', 'BBC'),
    Source('cnn', 'CNN'),
    Source('AlJazira', 'AlJazira'),
    Source('AlJazira', 'AlJazira'),
    Source('AlJazira', 'AlJazira'),
    Source('AlJazira', 'AlJazira'),
    Source('AlJazira', 'AlJazira'),
    Source('AlJazira', 'AlJazira'),
  ];
  @override
  Widget build(BuildContext context) {
    return sourceTabsWidget(sourceList);
  }
}
