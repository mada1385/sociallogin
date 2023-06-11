import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/data/projectsapi.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/Projects/domain/comments.dart';
import 'package:social_login/features/Projects/domain/pagingmodel.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectList.dart';
import 'package:social_login/features/homescreen/application/homescreenProvider.dart';
import 'package:social_login/features/user/domain/usermodel.dart';
import 'package:social_login/shared/services/preference/preference.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class ProjectsProvider extends ChangeNotifier {
  int page = 0;
  int comunity = 4;
  Pagination pagination;
  bool loading = false;
  final PagingController<int, Project> pagingController =
      PagingController(firstPageKey: 0);
  List<Comments> comments;
  ListProject listproject = ListProject.projects;
  List<File> files = [];

  setlistproject(ListProject input) {
    listproject = input;
    resetProjects();
    notifyListeners();
  }

  setfiles(List<File> filesinput) {
    files = filesinput;
    notifyListeners();
  }

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

      final res = await ProjectsAPI().postComment(map, id);

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

  Future<bool> addToFav(BuildContext context, String id) async {
    UI.setbusy(context);

    Logger().d("addToFav");
    try {
      final res = await ProjectsAPI().addTofav(id);

      if (res != null) {
        UI.toast("تم اضفة المشروع للمضلة");
        fetchPage(context, fromfilter: true);
        return true;
      }
    } catch (error) {
      UI.errorlogger(error.toString());
      UI.setidle(context);
    }
    UI.setidle(context);
  }

  Future addproject(BuildContext context, Map input) async {
    UI.setbusy(context);

    Logger().d("addComments");
    try {
      final res = await ProjectsAPI().addproject(input);
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

    Logger().d(pid);

    try {
      final Map map = {"comment": comment};

      final res = await ProjectsAPI().postreply(map, pid, cid);

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

  Future<void> getComments(
      BuildContext context, String id, bool fromAll) async {
    if (fromAll) {
      UI.setbusy(context);
    }

    Logger().d(id);
    try {
      final res = await ProjectsAPI().getcomments(id);

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

  resetProjects() {
    pagingController.itemList?.clear();
    pagination = null;
  }

  Future<void> fetchPage(BuildContext context,
      {bool fromfilter = false, bool refresh = true}) async {
    if (refresh) {
      if (pagination == null) {
        setbusy();
      }
    }

    Logger().d("fetch");
    try {
      if (fromfilter) {
        if (refresh) {
          setbusy();
          resetProjects();
        }
      }

      final res = await ProjectsAPI().getprojects(comunity.toString(),
          pagination == null ? "1" : pagination.page.toString(), listproject);

      final newItems =
          res["data"].map<Project>((e) => Project.fromJson(e)).toList();
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
