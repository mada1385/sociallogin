import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/buttons.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import 'commentsction.dart';

enum CommentType { project, poll }

class CommentsScreen extends StatefulWidget {
  CommentsScreen({Key key, this.id, @required this.commentType})
      : super(key: key);
  final String id;
  final CommentType commentType;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController ctrl = TextEditingController();

  @override
  void initState() {
    const oneSec = Duration(seconds: 10);

    Timer.periodic(oneSec, (Timer t) {
      if (widget.commentType == CommentType.project) {
        Provider.of<ProjectsProvider>(context, listen: false)
            .getComments(context, widget.id.toString(), false);
      }
      if (widget.commentType == CommentType.poll) {
        Provider.of<PollsProvider>(context, listen: false)
            .getComments(context, widget.id.toString(), false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 131,
        elevation: 5,
        toolbarHeight: SizeConfig().hieghtr(80, context),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackButton(),
            UI.widthsizedBox(4, context),
            const Customtext(
              "جميع التعليقات",
              color: backgroundcolor,
              size: 18,
            ),
          ],
        ),
        backgroundColor: secondarybackgroundcolor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig().hieghtr(10, context)),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              if (widget.commentType == CommentType.project)
                                ...Provider.of<ProjectsProvider>(context)
                                    .comments
                                    .map((e) => CommentsCopmponent(
                                          commentType: widget.commentType,
                                          id: widget.id.toString(),
                                          comment: e,
                                        ))
                                    .toList()
                              else
                                ...Provider.of<PollsProvider>(context)
                                    .comments
                                    .map((e) => CommentsCopmponent(
                                          id: widget.id.toString(),
                                          comment: e,
                                        )),
                            ],
                          ),
                          UI.highetsizedBox(5, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          OnlyhightRelativecontainer(
            210,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Customtext(
                        "إضافة تعليق",
                        fontWeight: FontWeight.bold,
                        size: 14,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  OnlywidthRelativecontainer(
                    320,
                    child: CustomTextfield(
                      borderd: true,
                      controller: ctrl,
                      hint: " ",
                      maxlines: 1,
                    ),
                  ),
                  UI.highetsizedBox(8, context),
                  OnlywidthRelativecontainer(
                    320,
                    child: AnimatedAccentButton(
                      onpressed: (thiscontext) async {
                        if (ctrl.text.isNotEmpty) {
                          if (widget.commentType == CommentType.project) {
                            Provider.of<ProjectsProvider>(thiscontext,
                                    listen: false)
                                .addComments(thiscontext, widget.id.toString(),
                                    ctrl.text);
                          }
                          if (widget.commentType == CommentType.poll) {
                            Provider.of<PollsProvider>(thiscontext,
                                    listen: false)
                                .addComments(thiscontext, widget.id.toString(),
                                    ctrl.text);
                          }
                        }
                      },
                      tittle: "إضافة تعليق",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
