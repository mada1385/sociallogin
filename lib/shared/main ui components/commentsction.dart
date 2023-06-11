import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/domain/comments.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/main%20ui%20components/commentsScreen.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class CommentsCopmponent extends StatefulWidget {
  const CommentsCopmponent(
      {Key key, this.comment, @required this.id, this.commentType})
      : super(key: key);

  final Comments comment;
  final String id;
  final CommentType commentType;

  @override
  _CommentsCopmponentState createState() => _CommentsCopmponentState();
}

class _CommentsCopmponentState extends State<CommentsCopmponent> {
  TextEditingController ctrl = TextEditingController();
  bool showmore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentTreeWidget<Comment, Comment>(
          Comment(
              avatar: widget.comment.picture,
              userName: widget.comment.userName,
              content: widget.comment.comment),
          widget.comment.replies
              .getRange(0, showmore ? widget.comment.replies.length : 3)
              .toList()
              .map((e) => Comment(
                  avatar: e.picture, userName: e.userName, content: e.comment))
              .toList(),
          treeThemeData:
              TreeThemeData(lineColor: Colors.transparent, lineWidth: 3),
          avatarRoot: (context, data) => PreferredSize(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              // backgroundImage: AssetImage('assets/avatar_2.png'),
            ),
            preferredSize: Size.fromRadius(18),
          ),
          avatarChild: (context, data) => PreferredSize(
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              // backgroundImage: AssetImage('assets/avatar_1.png'),
            ),
            preferredSize: Size.fromRadius(12),
          ),
          contentChild: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.userName,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          contentRoot: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.userName,
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        showmore = !showmore;
                      });
                    },
                    child: Normaltext(
                      showmore ? "عرض اقل" : "عرض المزيد",
                      size: 12,
                      color: UI.convertcolor(Provider.of<UserProvider>(context)
                          .user
                          .communityColor),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Column(
                children: [
                  UI.highetsizedBox(15, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      UI.widthsizedBox(40, context),
                      Relativecontainer(
                        250,
                        40,
                        color: lightgray,
                        allraduis: 8,
                        child: CustomTextfield(
                          controller: ctrl,
                          hint: "Reply",
                        ),
                      ),
                      UI.widthsizedBox(8, context),
                      GestureDetector(
                        onTap: () {
                          if (widget.commentType == CommentType.project) {
                            Provider.of<ProjectsProvider>(context,
                                    listen: false)
                                .addreply(context, widget.comment.id.toString(),
                                    widget.id, ctrl.text);
                          }
                          if (widget.commentType == CommentType.poll) {
                            Provider.of<PollsProvider>(context, listen: false)
                                .addreply(context, widget.comment.id.toString(),
                                    widget.id, ctrl.text);
                          }
                        },
                        child: UI.checkBusy(context)
                            ? Relativecontainer(
                                20,
                                20,
                                child: CircularProgressIndicator(),
                              )
                            : Icon(
                                Icons.send_outlined,
                                size: 20.0,
                                color: graymedium,
                              ),
                      )
                    ],
                  ),
                  UI.highetsizedBox(20, context),
                ],
              ),
            )
          ],
        ),
        UI.highetsizedBox(20, context),
      ],
    );
  }
}
