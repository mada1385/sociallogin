import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectList.dart';
import 'package:social_login/features/Projects/presentation/Components/stageButton.dart';
import 'package:social_login/features/Projects/presentation/addproject.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import '../../../shared/utils/uiutils.dart';
import '../application/Projectprovider.dart';

class ProjectHomeScreen extends StatefulWidget {
  const ProjectHomeScreen({Key key}) : super(key: key);

  @override
  State<ProjectHomeScreen> createState() => _ProjectHomeScreenState();
}

class _ProjectHomeScreenState extends State<ProjectHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Relativecontainer(
        50,
        50,
        child: FloatingActionButton(
          backgroundColor: UI.getcommunitycolor(context),
          onPressed: () {
            UI.push(context, Addproject());
          },
          child: Icon(
            PhosphorIcons.plus,
            color: backgroundcolor,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: SizeConfig().hieghtr(80, context),
        centerTitle: false,
        title: Customnormaltext(
          "المشاريع",
          color: backgroundcolor,
          size: 20,
        ),
        backgroundColor: secondarybackgroundcolor,
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(PhosphorIcons.magnifying_glass),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              if (Provider.of<UserProvider>(context).user.community != 1)
                Stagebutton(
                  tittle: "رواد الأعمال",
                  value: 1,
                ),
              if (Provider.of<UserProvider>(context).user.community >= 2)
                Stagebutton(
                  tittle: "المستثمرون",
                  value: 2,
                ),
              if (Provider.of<UserProvider>(context).user.community >= 3)
                Stagebutton(
                  tittle: "المتميزون",
                  value: 3,
                ),
              if (Provider.of<UserProvider>(context).user.community != 1)
                Stagebutton(
                  tittle: "الجميع",
                  value: 4,
                ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ProjectList(
              pagingController:
                  Provider.of<ProjectsProvider>(context).pagingController,
            ),
          )
        ],
      ),
    );
  }
}
