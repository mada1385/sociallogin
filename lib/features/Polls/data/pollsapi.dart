import 'dart:convert';
import 'package:http/http.dart';
import 'package:social_login/shared/config/connection.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class PollsAPI {
  Future getpolls(String community, String page) async {
    try {
      final headers = await Connection.chooseheadear();
      UI.logger(headers);

      final res = await get(
          Uri.parse(
              "${serverkey}polls/list/${community ?? "4"}?page=${page ?? "1"}"),
          headers: headers);
      UI.logger(res.body);
      var body = jsonDecode(res.body);
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

  Future getTopPolls() async {
    try {
      final headers = await Connection.chooseheadear();
      UI.logger(headers);

      final res = await get(Uri.parse("${serverkey}polls/list/4?page=1"),
          headers: headers);
      UI.logger(res.body);

      var body = jsonDecode(res.body);

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

  Future getcomments(String pollsid) async {
    try {
      // TODO make the state system
      // UI.setbusy(context);
      final headers = await Connection.chooseheadear();
      UI.logger(headers);

      final res = await get(Uri.parse("${serverkey}polls/$pollsid/comments"),
          headers: headers);
      var body = jsonDecode(res.body);
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

  Future postComment(Map input, String pollsid) async {
    try {
      final inputbody = json.encode(input);
      UI.logger(input);
      final headers = await Connection.chooseheadear();
      final res = await post(
          Uri.parse("${serverkey}polls/$pollsid/comments/add"),
          body: inputbody,
          headers: headers);
      var body = jsonDecode(res.body);
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

  Future postreply(Map input, String pollsid, String commentid) async {
    try {
      final inputbody = json.encode(input);
      UI.logger(input);
      final headers = await Connection.chooseheadear();
      final res = await post(
          Uri.parse("${serverkey}polls/$pollsid/comments/$commentid/reply"),
          body: inputbody,
          headers: headers);
      var body = jsonDecode(res.body);
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

  Future vote(String pollsid, String voteid) async {
    try {
      final headers = await Connection.chooseheadear();
      final res = await post(
          Uri.parse("${serverkey}polls/$pollsid/vote/$voteid"),
          headers: headers);
      var body = jsonDecode(res.body);
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

  Future addPolls(Map input) async {
    try {
      final inputbody = json.encode(input);
      UI.logger(input);
      final headers = await Connection.chooseheadear();
      final res = await post(Uri.parse("${serverkey}polls/store"),
          body: inputbody, headers: headers);
      var body = jsonDecode(res.body);
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
}
