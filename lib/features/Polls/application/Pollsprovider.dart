import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/data/pollsapi.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/Projects/domain/comments.dart';
import 'package:social_login/features/Projects/domain/pagingmodel.dart';
import 'package:social_login/features/homescreen/application/homescreenProvider.dart';
import 'package:social_login/features/user/domain/usermodel.dart';
import 'package:social_login/shared/services/preference/preference.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class PollsProvider extends ChangeNotifier {
  int page = 0;
  int comunity = 4;
  Pagination pagination;
  bool loading = false;
  final PagingController<int, POLL> pagingController =
      PagingController(firstPageKey: 0);
  List<Comments> comments;
  resetcomments() {
    comments = [];
  }

  setidle() {
    loading = false;
    notifyListeners();
  }

  setbusy() {
    loading = true;
    notifyListeners();
  }

  get serverkey => null;

  setcomunity(int comunityinput, BuildContext context) {
    if (!loading) {
      if (comunityinput == null) {
        UI.logger("comunity is null");

        Usermodel user = Usermodel.fromJson(
            jsonDecode(Preference.getString(PrefKeys.userData)));
        comunity = user.community;
      } else {
        UI.logger("comunity is $comunityinput");

        comunity = comunityinput;
      }
      fetchPage(context, fromfilter: true);

      UI.logger(comunity);

      notifyListeners();
    }
  }

  Future<void> addComments(
      BuildContext context, String id, String comment) async {
    UI.setbusy(context);

    Logger().d("addComments");
    try {
      final Map map = {"comment": comment};

      final res = await PollsAPI().postComment(map, id);

      if (res != null) {
        await getComments(context, id, false);
      }
      notifyListeners();
    } catch (error) {
      UI.errorlogger(error.toString());
      UI.setidle(context);
    }
    UI.setidle(context);
  }

  Future addPoll(BuildContext context, Map input) async {
    UI.setbusy(context);

    Logger().d("addComments");
    try {
      final res = await PollsAPI().addPolls(input);
      if (res != null) {
        UI.toast("تمت اضافة المشروع");
        UI.setidle(context);
        await Future.wait(<Future<dynamic>>[
          fetchPage(context, fromfilter: true),
          Provider.of<HomescreenProvider>(context, listen: false)
              .getTopprojects(context)
        ]);

        return res;
      }
      notifyListeners();
    } catch (error) {
      UI.errorlogger(error.toString());
      UI.setidle(context);
    }
    UI.setidle(context);
  }

  Future<void> addreply(
      BuildContext context, String cid, String pid, String comment) async {
    UI.setbusy(context);

    Logger().d("addComments");
    try {
      final Map map = {"comment": comment};

      final res = await PollsAPI().postreply(map, pid, cid);

      if (res != null) {
        await getComments(context, pid, false);
      }
      notifyListeners();
    } catch (error) {
      UI.errorlogger(error.toString());
      UI.setidle(context);
    }
    UI.setidle(context);
  }

  Future vote(
    BuildContext context,
    String vid,
    String pid,
  ) async {
    UI.setbusy(context);
    Logger().d("voting");
    try {
      final res = await PollsAPI().vote(pid, vid);

      if (res != null) {
        fetchPage(context, fromfilter: true, refresh: false);
        Provider.of<HomescreenProvider>(context, listen: false)
            .getTopPolls(context);
        return res;
      }
      notifyListeners();
    } catch (error) {
      UI.errorlogger(error.toString());
      UI.setidle(context);
    }
  }

  Future<void> getComments(
      BuildContext context, String id, bool fromAll) async {
    if (fromAll) {
      UI.setbusy(context);
    }

    Logger().d("getComments");
    try {
      final res = await PollsAPI().getcomments(id);

      if (res != null) {
        final List<Comments> newItems =
            res["data"].map<Comments>((e) => Comments.fromJson(e)).toList();
        comments = newItems;
      }
      notifyListeners();
    } catch (error) {
      UI.errorlogger(error.toString());
      UI.setidle(context);
    }
    UI.setidle(context);
  }

  Future<void> fetchPage(BuildContext context,
      {bool fromfilter = false, bool refresh = true}) async {
    Logger().d("fetch");

    if (refresh) {
      if (pagination == null) {
        setbusy();
      }
    }

    try {
      if (fromfilter) {
        if (refresh) {
          setbusy();
        }
        pagingController.itemList?.clear();
        pagination = null;
      }

      final res = await PollsAPI().getpolls(comunity.toString(),
          pagination == null ? "1" : pagination.page.toString());

      final newItems = res["data"].map<POLL>((e) => POLL.fromJson(e)).toList();
      pagination = Pagination.fromJson(res);
      Logger().d(newItems.length);

      final isLastPage = pagination.pageCount.ceil() == pagination.page;

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(
            newItems, pagination == null ? 1 : pagination.page++);
      }
    } catch (error) {
      pagingController.error = error;
      UI.errorlogger(error.toString());
      setidle();
    }
    if (refresh) {
      setidle();
    }
  }
}
