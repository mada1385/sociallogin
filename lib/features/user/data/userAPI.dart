import 'dart:convert';

import 'package:http/http.dart';
import 'package:social_login/shared/config/connection.dart';

import '../../../shared/utils/uiutils.dart';

class UserApi {
  Future getuserprofile() async {
    try {
      final signup = await get(
        Uri.parse("${serverkey}users/me"),
      );
      var body = jsonDecode(signup.body);
      UI.logger(body);
      if (body["status"] == 200) {
        return body;
      } else {
        UI.toast(body["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.errorlogger(e);
    }
  }

  Future changePassword(Map input) async {
    try {
      final signup = await put(
        Uri.parse("${serverkey}users/change-password"),
      );
      var body = jsonDecode(signup.body);
      UI.logger(body);
      if (body["status"] == 200) {
        return body;
      } else {
        UI.errorlogger(body["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.catchlogger(e);
    }
  }

  Future updateprofile(Map input) async {
    try {
      final signup = await put(
        Uri.parse("${serverkey}users/update"),
      );
      var body = jsonDecode(signup.body);
      UI.logger(body);
      if (body["status"] == 200) {
        return body;
      } else {
        UI.errorlogger(body["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.catchlogger(e);
    }
  }
}
