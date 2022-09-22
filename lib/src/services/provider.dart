import 'package:flutter/material.dart';

class ProviderNoticias extends ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = new PageController();

  PageController get getPageController {
    Duration(milliseconds: 500);
    return _pageController;
  }

  set ChangePagesCurrent(int index) {
    _paginaActual = index;

    _pageController.animateToPage(_paginaActual,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 250));
    notifyListeners();
  }

  int get pagesActual {
    return _paginaActual;
  }
}
