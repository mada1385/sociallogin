import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/Polls/presentation/Pollshomescreen.dart';
import 'package:social_login/features/Polls/presentation/addPoll.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectList.dart';
import 'package:social_login/features/Projects/presentation/addproject.dart';
import 'package:social_login/features/homescreen/presentation/Components/homedashboaedcardslist.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/features/user/domain/usermodel.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../Projects/application/Projectprovider.dart';
import '../../Projects/presentation/projecthomescreen.dart';
// import this

class Homescreen extends StatelessWidget {
  const Homescreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HomeDashboardHoriznalScroll(
              addfunction: () {
                UI.push(context, Addproject());
              },
              showmorefunction: () async {
                Provider.of<ProjectsProvider>(context, listen: false)
                    .setlistproject(ListProject.projects);
                Provider.of<ProjectsProvider>(context, listen: false)
                    .setcomunity(null, context);

                UI.push(context, const ProjectHomeScreen());
              },
              type: Datatypes.projecs,
              tittle: "مشاريع",
              data: const [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
              ],
            ),
            UI.highetsizedBox(30, context),
            const HomeDashboardHoriznalScroll(
              type: Datatypes.news,
              tittle: "أخبار",
              data: [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
              ],
            ),
            UI.highetsizedBox(30, context),
            HomeDashboardHoriznalScroll(
              addfunction: () {
                UI.push(context, AddPoll());
              },
              showmorefunction: () async {
                Provider.of<PollsProvider>(context, listen: false)
                    .setcomunity(null, context);

                UI.push(context, const Pollshomescreen());
              },
              type: Datatypes.polls,
              tittle: "استفتاءات",
              data: [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key key,
    this.raduis = 18,
    this.user,
    this.url,
    this.color,
    this.comunitycolor,
  }) : super(key: key);
  final double raduis;
  final Usermodel user;
  final Color comunitycolor;
  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: raduis * 2 + 4,
      height: raduis * 2 + 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis * 12 + 2),
        color: comunitycolor != null
            ? comunitycolor
            : color == null
                ? Colors.transparent
                : color,
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: raduis,
                foregroundImage: url == null
                    ? const AssetImage("asset/images/no-photo.png")
                    : NetworkImage(url),
              ),
            ),
          ),
          if (user != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Relativecontainer(
                40,
                20,
                allraduis: 4,
                color: UI.convertcolor(user.communityColor),
                child: Normaltext(
                  user.communityLabel,
                  color: backgroundcolor,
                  size: 12,
                ),
              ),
            )
        ],
      ),
    );
  }
}
