import 'package:flutter/material.dart';
import 'package:social_login/features/user/data/userAPI.dart';
import 'package:social_login/features/user/domain/usermodel.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class UserProvider extends ChangeNotifier {
  Usermodel user;
  void setuser(Usermodel input) {
    user = input;
    notifyListeners();
  }

  Future<void> getprofile() async {
    final res = await UserApi().getuserprofile();
    if (res != null) {
      user = Usermodel.fromJson(res["data"]);
    }
  }

  Future<void> updateprofile(Map updateinput, BuildContext context) async {
    UI.setbusy(context);
    try {
      final res = await UserApi().updateprofile(updateinput);
      if (res != null) {
        user = Usermodel.fromJson(res["data"]);
      }
    } catch (e) {
      UI.catchlogger(e);
    }
    UI.setidle(context);
  }

  Future<void> changePassword(Map updateinput, BuildContext context) async {
    try {
      final res = await UserApi().changePassword(updateinput);
      if (res != null) {
        UI.toast("Password change Succesfully");
      }
    } catch (e) {
      UI.catchlogger(e);
    }
  }
}
