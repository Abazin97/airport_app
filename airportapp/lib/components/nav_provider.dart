import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier{
  int _pageIndex = 0;
  bool autofocus = false;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex){
    _pageIndex = newIndex;
    notifyListeners();
  }

  void openWithSearchFocus(){
    pageIndex = 1;
    autofocus = true;
    notifyListeners();
  }

  void resetAutoFocus(){
    autofocus = false;
  }
}