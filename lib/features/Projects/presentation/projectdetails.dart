import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/shared/main%20ui%20components/commentsScreen.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../../shared/main ui components/commentsction.dart';
import '../../homescreen/presentation/homescreen.dart';

class ProjectDetails extends StatefulWidget {
  ProjectDetails({Key key, this.project}) : super(key: key);
  final Project project;

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProjectsProvider>(context, listen: false)
          .getComments(context, widget.project.id.toString(), true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    final projectaction = Provider.of<ProjectsProvider>(context, listen: false);

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
                      "تفاصيل المشروع",
                      color: backgroundcolor,
                      size: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final isfav = await projectaction.addToFav(
                            context, widget.project.id.toString());
                        if (isfav != null && isfav) {
                          setState(() {
                            widget.project.isFav = !widget.project.isFav;
                          });
                        }
                      },
                      child: Relativecontainer(
                        40,
                        40,
                        color: Colors.transparent,
                        child: Icon(
                          widget.project.isFav
                              ? PhosphorIcons.heart_fill
                              : PhosphorIcons.heart,
                          color: widget.project.isFav
                              ? UI.getcommunitycolor(context)
                              : backgroundcolor,
                          size: 35,
                        ),
                      ),
                    ),
                    UI.widthsizedBox(10, context),
                    Relativecontainer(
                      40,
                      40,
                      color: Colors.transparent,
                      child: Icon(
                        PhosphorIcons.dots_three_vertical_bold,
                        color: backgroundcolor,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            UI.highetsizedBox(30, context),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: widget.project.id,
                                child: CustomCircleAvatar(
                                  user: widget.project.user,
                                  raduis: SizeConfig().widthr(25, context),
                                  color: UI.convertcolor(
                                      widget.project.user.communityColor),
                                  url: widget.project.user.picture,
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: SizeConfig().widthr(230, context),
                                    child: Customnormaltext(
                                      widget.project.title,
                                      size: 12,
                                      color: blackcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  UI.highetsizedBox(10, context),
                                  FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              PhosphorIcons.user,
                                              color: graymedium,
                                              size: 15,
                                            ),
                                            UI.widthsizedBox(2, context),
                                            Customtext(
                                              widget.project.user.name,
                                              size: 8,
                                              color: graymedium,
                                            ),
                                            UI.widthsizedBox(5, context),
                                            Relativecontainer(
                                              1,
                                              10,
                                              color: textcolor,
                                            ),
                                          ],
                                        ),
                                        UI.widthsizedBox(5, context),
                                        Row(
                                          children: [
                                            Icon(
                                              PhosphorIcons.clock,
                                              color: graymedium,
                                              size: 12,
                                            ),
                                            UI.widthsizedBox(2, context),
                                            Customtext(
                                              widget.project.investmentField ??
                                                  " ",
                                              size: 8,
                                              color: graymedium,
                                            ),
                                            UI.widthsizedBox(5, context),
                                            Relativecontainer(
                                              1,
                                              10,
                                              color: textcolor,
                                            ),
                                          ],
                                        ),
                                        UI.widthsizedBox(5, context),
                                        Row(
                                          children: [
                                            Icon(
                                              PhosphorIcons.user,
                                              color: graymedium,
                                              size: 15,
                                            ),
                                            UI.widthsizedBox(2, context),
                                            Customtext(
                                              widget.project.user.name,
                                              size: 8,
                                              color: graymedium,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      UI.highetsizedBox(10, context),
                      OnlywidthRelativecontainer(
                        342,
                        color: Colors.white,
                        shadow: true,
                        raduis: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UI.highetsizedBox(12, context),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OnlywidthRelativecontainer(
                                      150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            PhosphorIcons.coins,
                                            color: UI.convertcolor(
                                                Provider.of<UserProvider>(
                                                        context)
                                                    .user
                                                    .communityColor),
                                          ),
                                          UI.widthsizedBox(10, context),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Customtext(
                                                "رأس المال الكلى",
                                                size: 12,
                                              ),
                                              UI.highetsizedBox(5, context),
                                              Customtext(
                                                widget.project.totalCapital
                                                    .toString(),
                                                size: 10,
                                                color: textcolor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Relativecontainer(
                                      1,
                                      20,
                                      color: graymedium,
                                    ),
                                    OnlywidthRelativecontainer(
                                      150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            PhosphorIcons.coins,
                                            color: UI.convertcolor(
                                                Provider.of<UserProvider>(
                                                        context)
                                                    .user
                                                    .communityColor),
                                          ),
                                          UI.widthsizedBox(5, context),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Customtext(
                                                "الربح المتوقع",
                                                size: 12,
                                              ),
                                              UI.highetsizedBox(5, context),
                                              Customtext(
                                                widget.project
                                                    .annualExpectedRevenue
                                                    .toString(),
                                                size: 10,
                                                color: textcolor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig().widthr(22, context)),
                                  child: Divider(
                                    color: graymedium,
                                    height: 20,
                                    thickness: 1,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OnlywidthRelativecontainer(
                                      150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            PhosphorIcons.coins,
                                            color: UI.convertcolor(
                                                Provider.of<UserProvider>(
                                                        context)
                                                    .user
                                                    .communityColor),
                                          ),
                                          UI.widthsizedBox(10, context),
                                          Column(
                                            children: [
                                              Customtext(
                                                "رأس المال المطلوب",
                                                size: 12,
                                              ),
                                              UI.highetsizedBox(5, context),
                                              Customtext(
                                                widget.project.requestedCapital
                                                    .toString(),
                                                size: 10,
                                                color: textcolor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Relativecontainer(
                                      1,
                                      20,
                                      color: graymedium,
                                    ),
                                    OnlywidthRelativecontainer(
                                      150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            PhosphorIcons.coins,
                                            color: UI.convertcolor(
                                                Provider.of<UserProvider>(
                                                        context)
                                                    .user
                                                    .communityColor),
                                          ),
                                          UI.widthsizedBox(10, context),
                                          Column(
                                            children: [
                                              Customtext(
                                                "عدد الشركاء",
                                                size: 12,
                                              ),
                                              UI.highetsizedBox(5, context),
                                              Customtext(
                                                widget
                                                    .project.partnerJoinedNumber
                                                    .toString(),
                                                size: 10,
                                                color: textcolor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            UI.highetsizedBox(12, context),
                          ],
                        ),
                      ),
                      UI.highetsizedBox(10, context),
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
                                  children: [
                                    Image.asset("asset/images/Group 17412.png"),
                                    UI.widthsizedBox(6, context),
                                    const Customtext(
                                      "تفاصيل المشروع",
                                      fontWeight: FontWeight.bold,
                                      size: 14,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                UI.highetsizedBox(15, context),
                                OnlywidthRelativecontainer(
                                  320,
                                  child: Center(
                                    child: Customtext(
                                      widget.project.details ?? " ",
                                      fontWeight: FontWeight.w700,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                UI.highetsizedBox(5, context),
                              ],
                            ),
                          )),
                      UI.highetsizedBox(10, context),
                      Relativecontainer(343, 161,
                          color: Colors.white,
                          shadow: true,
                          allraduis: 8,
                          child: Padding(
                            padding: EdgeInsets.all(
                                SizeConfig().hieghtr(10, context)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Customtext(
                                      "ملفات مرفقة",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                UI.highetsizedBox(10, context),
                                Relativecontainer(
                                  150,
                                  40,
                                  color: lightgray,
                                  allraduis: 8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          UI.widthsizedBox(4, context),
                                          Relativecontainer(
                                            30,
                                            30,
                                            child: Image.asset(
                                                "asset/images/WordLogo.png"),
                                          ),
                                          UI.widthsizedBox(8, context),
                                          Normaltext("ملف شرح"),
                                          UI.widthsizedBox(8, context),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Relativecontainer(
                                            26,
                                            26,
                                            allraduis: 4,
                                            color: backgroundcolor,
                                            child: Icon(
                                              PhosphorIcons.download,
                                              size: 18,
                                              color: textcolor,
                                            ),
                                          ),
                                          UI.widthsizedBox(8, context),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                UI.highetsizedBox(10, context),
                                Row(
                                  children: [
                                    Relativecontainer(
                                      22,
                                      24,
                                      color: greybuttoncolor,
                                      allraduis: 22,
                                      child: const Icon(
                                        PhosphorIcons.users,
                                        size: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    UI.widthsizedBox(8, context),
                                    Normaltext(
                                        userprovider.user.community.toString())
                                  ],
                                )
                              ],
                            ),
                          )),
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
                                        Image.asset(
                                            "asset/images/Group 17515.png"),
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
                                              id: widget.project.id.toString(),
                                            ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Normaltext(
                                            "عرض الكل",
                                            size: 12,
                                          ),
                                          Icon(
                                            UI.buildCaretOnDirection(context),
                                            color:
                                                UI.getcommunitycolor(context),
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
                                          ...Provider.of<ProjectsProvider>(
                                                  context)
                                              .comments
                                              .getRange(
                                                  0,
                                                  Provider.of<ProjectsProvider>(
                                                                  context)
                                                              .comments
                                                              .length <
                                                          3
                                                      ? Provider.of<
                                                                  ProjectsProvider>(
                                                              context)
                                                          .comments
                                                          .length
                                                      : 3)
                                              .toList()
                                              .map((e) => CommentsCopmponent(
                                                    comment: e,
                                                    id: widget.project.id
                                                        .toString(),
                                                  ))
                                              .toList()
                                        ],
                                      ),
                                UI.highetsizedBox(5, context),
                              ],
                            ),
                          )),
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
