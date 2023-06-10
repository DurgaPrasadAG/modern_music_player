import 'package:flutter/cupertino.dart';

class ChangeThemeProvider extends ChangeNotifier {
  changeTheme() {
    notifyListeners();
  }
}