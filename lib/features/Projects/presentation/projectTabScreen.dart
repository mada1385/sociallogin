import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectList.dart';
import 'package:social_login/features/Projects/presentation/projecthomescreen.dart';
import 'package:social_login/features/Projects/presentation/selectedProjectsScreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class ProjectTabScreen extends StatelessWidget {
  const ProjectTabScreen({Key key}) : super(key: key);

  get backgroundcolor => null;

  @override
  Widget build(BuildContext context) {
    final provideraction =
        Provider.of<ProjectsProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            onTap: () {
              provideraction.setlistproject(ListProject.projects);
              Provider.of<ProjectsProvider>(context, listen: false)
                  .setcomunity(null, context);
              UI.push(context, ProjectHomeScreen());
            },
            horizontalTitleGap: -SizeConfig().widthr(2, context),
            leading: Relativecontainer(
              40,
              40,
              color: Colors.transparent,
              child: Icon(
                PhosphorIcons.users_fill,
                size: 18,
              ),
            ),
            title: Customtext(
              "استثمارات vg",
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            trailing: Icon(UI.buildCaretOnDirection(context)),
          ),
          Divider(
            color: textcolor,
          ),
          ListTile(
            onTap: () {
              provideraction.setlistproject(ListProject.myProject);
              Provider.of<ProjectsProvider>(context, listen: false)
                  .setcomunity(null, context);

              UI.push(
                  context,
                  SelectedProjectScreen(
                    isfav: false,
                  ));
            },
            horizontalTitleGap: -SizeConfig().widthr(2, context),
            leading: Relativecontainer(
              40,
              40,
              color: Colors.transparent,
              child: Icon(
                PhosphorIcons.user_fill,
                size: 18,
              ),
            ),
            title: Customtext(
              "استثماراتي",
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            trailing: Icon(UI.buildCaretOnDirection(context)),
          ),
          Divider(
            color: textcolor,
          ),
          ListTile(
            onTap: () {
              provideraction.setlistproject(ListProject.favourite);
              Provider.of<ProjectsProvider>(context, listen: false)
                  .setcomunity(null, context);

              UI.push(
                  context,
                  SelectedProjectScreen(
                    isfav: true,
                  ));
            },
            horizontalTitleGap: -SizeConfig().widthr(2, context),
            leading: Relativecontainer(
              40,
              40,
              color: Colors.transparent,
              child: Icon(
                PhosphorIcons.heart_fill,
                color: backgroundcolor,
                size: 18,
              ),
            ),
            title: Customtext(
              "المفضله",
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            trailing: Icon(UI.buildCaretOnDirection(context)),
          ),
          Divider(
            color: textcolor,
          ),
        ],
      ),
    );
  }
}
