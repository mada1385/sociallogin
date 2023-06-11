import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/presentation/projectdetails.dart';
import 'package:social_login/features/homescreen/presentation/homescreen.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../domain/ProjectModel.dart';

class ProjectListingCard extends StatefulWidget {
  const ProjectListingCard({
    Key key,
    this.project,
  }) : super(key: key);
  final Project project;

  @override
  State<ProjectListingCard> createState() => _ProjectListingCardState();
}

class _ProjectListingCardState extends State<ProjectListingCard> {
  bool isexpanded = false;
  @override
  Widget build(BuildContext context) {
    return OnlywidthRelativecontainer(
      200,
      raduis: 8,
      shadow: true,
      borderd: true,
      color: backgroundcolor,
      child: ExpansionTile(
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                isexpanded ? PhosphorIcons.caret_up : PhosphorIcons.caret_down,
                size: 16,
                color: graymedium,
              )
            ],
          ),
          tilePadding: EdgeInsets.all(10),
          onExpansionChanged: (value) {
            setState(() {
              setState(() {
                isexpanded = !isexpanded;
              });
            });
          },
          leading: CustomCircleAvatar(
            raduis: 25,
            comunitycolor: UI.convertcolor(widget.project.user.communityColor),
            url: widget.project.user.picture,
          ),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeConfig().widthr(200, context),
                    child: Customnormaltext(
                      widget.project.title,
                      size: 12,
                      color: blackcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              UI.highetsizedBox(10, context)
            ],
          ),
          subtitle: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Relativecontainer(
                  37,
                  22,
                  allraduis: 3,
                  color: UI.convertcolor(widget.project.communityColor),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Normaltext(
                      widget.project.communityLabel,
                      color: backgroundcolor,
                      size: 10,
                    ),
                  ),
                ),
                UI.widthsizedBox(8, context),
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
                      widget.project.investmentField ?? "",
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
                    Customtext(
                      "الحالة :",
                      size: 8,
                      color: graymedium,
                    ),
                    UI.widthsizedBox(2, context),
                    Customtext(
                      widget.project.statusLabel,
                      size: 8,
                      color: graymedium,
                    ),
                  ],
                )
              ],
            ),
          ),
          children: [
            OnlywidthRelativecontainer(
              323,
              child: Column(
                children: [
                  OnlywidthRelativecontainer(
                    320,
                    child: Customtext(widget.project.details ?? " "),
                  ),
                  UI.highetsizedBox(20, context),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OnlywidthRelativecontainer(
                                  150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        PhosphorIcons.coins,
                                        color: UI.convertcolor(
                                            Provider.of<UserProvider>(context)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        PhosphorIcons.coins,
                                        color: UI.convertcolor(
                                            Provider.of<UserProvider>(context)
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
                                            widget.project.annualExpectedRevenue
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
                                  horizontal: SizeConfig().widthr(22, context)),
                              child: Divider(
                                color: graymedium,
                                height: 20,
                                thickness: 1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OnlywidthRelativecontainer(
                                  150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        PhosphorIcons.coins,
                                        color: UI.convertcolor(
                                            Provider.of<UserProvider>(context)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        PhosphorIcons.coins,
                                        color: UI.convertcolor(
                                            Provider.of<UserProvider>(context)
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
                                            widget.project.partnerJoinedNumber
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
                  UI.highetsizedBox(20, context),
                  GestureDetector(
                    onTap: () {
                      Provider.of<ProjectsProvider>(context, listen: false)
                          .resetcomments();
                      UI.push(
                          context,
                          ProjectDetails(
                            project: widget.project,
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Normaltext(
                          "عرض التفاصيل",
                          size: 12,
                        ),
                        Icon(
                          UI.buildCaretOnDirection(context),
                          color: UI.convertcolor(widget.project.communityColor),
                          size: 16,
                        )
                      ],
                    ),
                  ),
                  UI.highetsizedBox(10, context),
                ],
              ),
            )
          ]),
    );
  }
}
