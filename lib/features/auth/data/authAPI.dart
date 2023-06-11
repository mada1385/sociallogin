import 'dart:convert';
import 'package:http/http.dart';
import '../../../shared/config/connection.dart';
import '../../../shared/utils/uiutils.dart';

class AuthApi {
  Future register(Map input) async {
    try {
      final headers = await Connection.chooseheadear(token: false);

      final inputbody = jsonEncode(input);
      final signup = await post(Uri.parse("${serverkey}auth/register"),
          body: inputbody, headers: headers);
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

  Future login(Map input) async {
    try {
      final headers = await Connection.chooseheadear(token: false);
      final inputbody = jsonEncode(input);

      final signup = await post(Uri.parse("${serverkey}auth/login"),
          body: inputbody, headers: headers);
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
      return e;
    }
  }

  sendotp(Map data) async {
    try {
      UI.logger(data);
      final res = await post(
          Uri.parse(
            "${serverkey}auth/send-otp",
          ),
          body: data);
      final resbody = jsonDecode(res.body);
      UI.logger(resbody);
      if (res.statusCode == 200) {
        return resbody;
      } else {
        UI.errorlogger(resbody["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.catchlogger(e);
    }
  }

  verifyOTP(Map data) async {
    try {
      UI.logger(data);
      final res =
          await post(Uri.parse("${serverkey}auth/verify-otp"), body: data);
      final resbody = jsonDecode(res.body);
      UI.logger(resbody);
      if (res.statusCode == 200) {
        return resbody;
      } else {
        UI.errorlogger(resbody["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.catchlogger(e);
    }
  }

  resetpassword(Map data) async {
    try {
      UI.logger(data);
      final res =
          await put(Uri.parse("${serverkey}auth/reset-password"), body: data);
      final resbody = jsonDecode(res.body);
      UI.logger(resbody);
      if (res.statusCode == 200) {
        return resbody;
      } else {
        UI.errorlogger(resbody["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.catchlogger(e);
    }
  }

  sociallogin(Map data) async {
    try {
      UI.logger(data);
      final res =
          await put(Uri.parse("${serverkey}auth/social-login"), body: data);
      final resbody = jsonDecode(res.body);
      UI.logger(resbody);
      if (res.statusCode == 200 && res.statusCode == 401) {
        return resbody;
      } else {
        UI.errorlogger(resbody["message"]);
      }
    } catch (e) {
      UI.errorhPTIC();
      UI.catchlogger(e);
    }
  }
}
