import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/commentsScreen.dart';
import 'package:social_login/shared/main%20ui%20components/commentsction.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';
import 'package:social_login/shared/utils/uiutils.dart';
import '../../homescreen/presentation/homescreen.dart';

class PollsDetails extends StatelessWidget {
  PollsDetails({Key key, this.poll}) : super(key: key);
  final POLL poll;

  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("asset/images/26 - تفاصيل المشروع.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UI.highetsizedBox(54, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackButton(
                      color: backgroundcolor,
                    ),
                    Customnormaltext(
                      "شارك بالاستفتاء",
                      color: backgroundcolor,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
            UI.highetsizedBox(50, context),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      OnlywidthRelativecontainer(
                        343,
                        color: Colors.white,
                        shadow: true,
                        raduis: 8,
                        child: Padding(
                          padding:
                              EdgeInsets.all(SizeConfig().widthr(16, context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Hero(
                                        tag: poll.id,
                                        child: CustomCircleAvatar(
                                          raduis:
                                              SizeConfig().widthr(25, context),
                                          color: UI.convertcolor(
                                              poll.user.communityColor),
                                          url: poll.user.picture,
                                        ),
                                      ),
                                      UI.widthsizedBox(8, context),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Customnormaltext(
                                            poll.user.name,
                                            size: 14,
                                            color: blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          UI.highetsizedBox(8, context),
                                          Customnormaltext(
                                            poll.user.communityLabel,
                                            size: 10,
                                            color: textcolor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Relativecontainer(
                                    40,
                                    30,
                                    allraduis: 3,
                                    color: UI
                                        .convertcolor(poll.user.communityColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Normaltext(
                                        poll.progressStatusesLabel,
                                        color: backgroundcolor,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              UI.highetsizedBox(16, context),
                              PollAnswerWidget(
                                poll: poll,
                              )
                            ],
                          ),
                        ),
                      ),
                      UI.highetsizedBox(16, context),
                      OnlywidthRelativecontainer(343,
                          color: Colors.white,
                          shadow: true,
                          raduis: 8,
                          child: Padding(
                            padding: EdgeInsets.all(
                                SizeConfig().hieghtr(10, context)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Relativecontainer(
                                          20,
                                          20,
                                          child: Image.asset(
                                              "asset/images/Calender.png"),
                                        ),
                                        UI.widthsizedBox(6, context),
                                        const Customtext(
                                          "تاريخ الإضافة",
                                          fontWeight: FontWeight.w700,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                    Normaltext(
                                      DateFormat("yyyy/MM/dd", "ar").format(
                                          DateTime.parse(poll.expireDate)),
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                      color: textcolor,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                UI.highetsizedBox(15, context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Relativecontainer(
                                          20,
                                          20,
                                          child: Image.asset(
                                              "asset/images/Calender.png"),
                                        ),
                                        UI.widthsizedBox(6, context),
                                        const Customtext(
                                          "تاريخ الانتهاء",
                                          fontWeight: FontWeight.w700,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                    Normaltext(
                                      DateFormat("yyyy/MM/dd", "ar").format(
                                          DateTime.parse(poll.expireDate)),
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                      color: textcolor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      UI.highetsizedBox(16, context),
                      CommentSection(
                        poll: poll,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  const CommentSection({
    Key key,
    this.poll,
  }) : super(key: key);

  final POLL poll;

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PollsProvider>(context, listen: false)
          .getComments(context, widget.poll.id.toString(), true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnlywidthRelativecontainer(343,
        color: Colors.white,
        shadow: true,
        raduis: 8,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig().hieghtr(10, context)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("asset/images/Group 17515.png"),
                      UI.widthsizedBox(6, context),
                      const Customtext(
                        "التعليقات",
                        fontWeight: FontWeight.bold,
                        size: 14,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      UI.push(
                          context,
                          CommentsScreen(
                            commentType: CommentType.poll,
                            id: widget.poll.id.toString(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Normaltext(
                          "عرض الكل",
                          size: 12,
                        ),
                        Icon(
                          UI.buildCaretOnDirection(context),
                          color: UI.getcommunitycolor(context),
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              UI.highetsizedBox(15, context),
              UI.checkBusy(context)
                  ? Relativecontainer(
                      342,
                      400,
                      child: LoadingListPage(),
                    )
                  : Column(
                      children: [
                        ...Provider.of<PollsProvider>(context)
                            .comments
                            .getRange(
                                0,
                                Provider.of<PollsProvider>(context)
                                            .comments
                                            .length <
                                        3
                                    ? Provider.of<PollsProvider>(context)
                                        .comments
                                        .length
                                    : 3)
                            .toList()
                            .map((e) => CommentsCopmponent(
                                  commentType: CommentType.poll,
                                  id: widget.poll.id.toString(),
                                  comment: e,
                                ))
                            .toList()
                      ],
                    ),
              UI.highetsizedBox(5, context),
            ],
          ),
        ));
  }
}

class PollAnswerWidget extends StatelessWidget {
  const PollAnswerWidget({Key key, this.poll}) : super(key: key);
  final POLL poll;

  @override
  Widget build(BuildContext context) {
    return FlutterPolls(
      heightBetweenTitleAndOptions: 20,
      votedBackgroundColor: lightgray,

      // pollEnded: true,
      pollOptionsBorder: Border.all(color: Colors.transparent),
      leadingVotedProgessColor: UI.getcommunitycolor(context),
      pollOptionsFillColor: lightgray,
      votedProgressColor: UI.getcommunitycolor(context).withOpacity(.3),
      hasVoted: poll.votedId != null,
      userVotedOptionId: poll.votedId,
      pollId: poll.id.toString(),
      onVoted: (PollOption pollOption, int newTotalVotes) async {
        final res = await Provider.of<PollsProvider>(context, listen: false)
            .vote(context, pollOption.id.toString(), poll.id.toString());
        if (res != null) {
          return true;
        }
      },
      pollTitle: Customnormaltext(
        poll.question,
        size: 12,
        color: blackcolor,
        fontWeight: FontWeight.bold,
      ),
      pollOptions: poll.answers
          .map((e) => PollOption(
              id: e.id,
              title: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: UI.padding8horizntal(context),
                  child: OnlywidthRelativecontainer(
                    190,
                    child: Customtext(
                      e.answer,
                      size: 12,
                    ),
                  ),
                ),
              ),
              votes: e.votesCount))
          .toList(),
      votedCheckmark: Icon(
        PhosphorIcons.check_circle,
        color: graymedium,
        size: 18,
      ),
    );
  }
}
