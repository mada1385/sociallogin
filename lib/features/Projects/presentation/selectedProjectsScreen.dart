import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/presentation/Pollshomescreen.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectsListingCard.dart';
import 'package:social_login/features/Projects/presentation/Components/stageButton.dart';
import 'package:social_login/features/Projects/presentation/addproject.dart';
import 'package:social_login/features/homescreen/application/homescreenProvider.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/features/user/presentation/UserprofileScreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';

import '../../../shared/utils/uiutils.dart';
import '../application/Projectprovider.dart';
import '../domain/ProjectModel.dart';
import 'Components/ProjectList.dart';

class SelectedProjectScreen extends StatelessWidget {
  const SelectedProjectScreen({Key key, this.isfav = true}) : super(key: key);
  final bool isfav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isfav
          ? Container()
          : Relativecontainer(
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
          isfav ? "المشاريع المفضله" : "استثماراتي",
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
          UI.highetsizedBox(16, context),
          Expanded(
            child: ProjectList(
              pagingController:
                  Provider.of<ProjectsProvider>(context).pagingController,
            ),
          ),
        ],
      ),
    );
  }
}
