import 'package:flutter/material.dart';

class PagesProvider with ChangeNotifier {
  int _page = 0;
  int get page => _page;

  void setPage(int page) {
    _page = page;
    notifyListeners();
  }
}
