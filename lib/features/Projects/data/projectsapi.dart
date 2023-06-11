import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectList.dart';
import 'package:social_login/shared/config/connection.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class ProjectsAPI {
  Future getprojects(
      String community, String page, ListProject listProject) async {
    try {
      String module = "";
      if (listProject == ListProject.myProject) {
        module = "/my";
      }
      if (listProject == ListProject.favourite) {
        module = "/fav";
      }
      Logger().d(module);
      final headers = await Connection.chooseheadear();
      UI.logger(headers);

      final res = await get(
          Uri.parse(
              "${serverkey}projects/list/${community ?? "4"}$module?page=${page ?? "1"}"),
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

  Future getTopprojects() async {
    try {
      final headers = await Connection.chooseheadear();
      UI.logger(headers);

      final res =
          await get(Uri.parse("${serverkey}projects/top-10"), headers: headers);
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

  Future getcomments(String ProjectID) async {
    try {
      // TODO make the state system
      // UI.setbusy(context);
      final headers = await Connection.chooseheadear();
      UI.logger(headers);

      final res = await get(
          Uri.parse("${serverkey}projects/$ProjectID/comments"),
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

  Future postComment(Map input, String projectid) async {
    try {
      final inputbody = json.encode(input);
      UI.logger(input);
      final headers = await Connection.chooseheadear();
      final res = await post(
          Uri.parse("${serverkey}projects/$projectid/comments/add"),
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

  Future addTofav(String projectid) async {
    try {
      final headers = await Connection.chooseheadear();
      final res = await post(Uri.parse("${serverkey}projects/$projectid/fav"),
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

  Future postreply(Map input, String projectid, String commentid) async {
    try {
      final inputbody = json.encode(input);
      UI.logger(input);
      final headers = await Connection.chooseheadear();
      final res = await post(
          Uri.parse(
              "${serverkey}projects/$projectid/comments/$projectid/reply"),
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

  Future addproject(Map input) async {
    try {
      final inputbody = json.encode(input);
      UI.logger(input);
      final headers = await Connection.chooseheadear();
      final res = await post(
          Uri.parse("https://dev.vginv.com/ar/api/mobile/projects/store"),
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
}
