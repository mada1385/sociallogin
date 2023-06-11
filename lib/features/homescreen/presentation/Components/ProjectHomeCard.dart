import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/Projects/presentation/projectdetails.dart';
import 'package:social_login/features/homescreen/presentation/homescreen.dart';
import 'package:social_login/features/user/domain/usermodel.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';
import '../../../../shared/config/mediaqueryconfig.dart';
import '../../../../shared/main ui components/customtext.dart';

class ProjectHomeCard extends StatelessWidget {
  const ProjectHomeCard({Key key, this.project}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UI.push(
            context,
            ProjectDetails(
              project: project,
            ));
      },
      child: Padding(
        padding:
            EdgeInsetsDirectional.only(end: SizeConfig().widthr(18, context)),
        child: Relativecontainer(
          200,
          200,
          color: backgroundcolor,
          shadow: true,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Hero(
                  tag: project.id,
                  child: CustomCircleAvatar(
                    user: project.user as Usermodel,
                    raduis: 25,
                    comunitycolor: UI.convertcolor(project.user.communityColor),
                    url: project.user.picture,
                  ),
                ),
                UI.highetsizedBox(8, context),
                SizedBox(
                  width: SizeConfig().widthr(189, context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        PhosphorIcons.user,
                        color: textcolor,
                        size: 16,
                      ),
                      UI.widthsizedBox(8, context),
                      Normaltext(
                        project.user.name,
                        size: 12,
                        color: textcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                UI.highetsizedBox(16, context),
                SizedBox(
                  width: SizeConfig().widthr(189, context),
                  child: Normaltext(
                    project.title,
                    size: 12,
                    color: graymedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                UI.highetsizedBox(8, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          PhosphorIcons.clock,
                          color: graymedium,
                          size: 15,
                        ),
                        UI.widthsizedBox(2, context),
                        Customtext(
                          project.investmentField,
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
                          project.statusLabel,
                          size: 8,
                          color: graymedium,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
