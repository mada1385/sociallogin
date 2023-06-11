import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/Polls/data/pollsapi.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/Projects/data/projectsapi.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class HomescreenProvider extends ChangeNotifier {
  List<Project> projects = [];
  List<POLL> polls = [];

  getTopprojects(
    BuildContext context,
  ) async {
    UI.setbusy(context);
    try {
      final res = await ProjectsAPI().getTopprojects();
      if (res != null) {
        final newItems =
            res["data"].map<Project>((e) => Project.fromJson(e)).toList();

        projects = newItems;

        notifyListeners();
      }
    } catch (e) {
      UI.setidle(context);
      UI.catchlogger(e);
    }
    UI.setidle(context);
  }

  getTopPolls(BuildContext context, {bool refresh = true}) async {
    if (refresh) {
      UI.setbusy(context);
    }
    try {
      final res = await PollsAPI().getTopPolls();
      if (res != null) {
        final newItems =
            res["data"].map<POLL>((e) => POLL.fromJson(e)).toList();

        polls = newItems;

        notifyListeners();
      }
    } catch (e) {
      UI.setidle(context);
      UI.catchlogger(e);
    }
    if (refresh) {
      UI.setidle(context);
    }
  }
}
