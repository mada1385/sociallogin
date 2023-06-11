import 'package:flutter/material.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class StateProvider extends ChangeNotifier {
  var state;

  Future<void> setbusy(BuildContext context) async {
    state = context.widget.hashCode;

    notifyListeners();
  }

  void setidle() {
    state = "";

    notifyListeners();
  }
}
