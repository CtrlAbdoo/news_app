import 'package:flutter/material.dart';
import 'package:news_app/API/ApiManager.dart';
import 'package:news_app/SourcesResponse/Source.dart';

class CategoryDetailsViewModel  extends ChangeNotifier{
  List<Source>? newSourcesList;
  String? errorMessage;
  bool? showLoading =true;

  void getSources(String categoryId)async{
    showLoading = true;
    newSourcesList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getSources(categoryId);
      showLoading = null;
      if(response.status == 'error'){
        errorMessage = response.message;
      }else{
        newSourcesList = response.sources;
      }
    }catch(e){
      showLoading = null;
      errorMessage = e.toString();
    }

    notifyListeners();
  }
}