import 'package:flutter/material.dart';
import 'package:news_app/API/ApiManager.dart';
import 'package:news_app/NewsResponse/News.dart';

class NewsListViewModel extends ChangeNotifier{
  List<News>? newsList;
  String? errorMessage;
  bool? showLoading =true;

  void getNews(String sourceId)async{
    showLoading = true;
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getNews(sourceId);
      showLoading = null;
      if(response.status == 'error'){
        errorMessage = response.message;
      }else{
        newsList = response.articles;
      }
    }catch(e){
      showLoading = false;
      errorMessage = e.toString();
    }

    notifyListeners();
  }
}