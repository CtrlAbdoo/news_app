import 'package:flutter/material.dart';
import 'package:news_app/UI/Home/Categories/CategoriesFragment.dart';
import 'package:news_app/UI/Home/Categories/Category.dart';
import 'package:news_app/UI/Home/CategoryDetails/CategoryDetails.dart';
import 'package:news_app/UI/Home/HomeDrawer.dart';
import 'package:news_app/UI/Home/Settings/SettingsFragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
        image: DecorationImage(
          image:  AssetImage('assets/images/BG.jpg'),
          fit: BoxFit.fill,
        )
      ),
        child: Scaffold(
          drawer: HomeDrawer(onMenuItemClick),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text('News App'),
            centerTitle: true,
          ),
          body: selectedWidget,
        )
    );
  }

  late Widget selectedWidget;

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.categories:
        selectedWidget = CategoriesFragment(onCategoryItemClick);

      case MenuItem.settings:
        selectedWidget = const SettingsFragment();
    }

    setState(() {

    });
  }
  void onCategoryItemClick(Category category){
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
