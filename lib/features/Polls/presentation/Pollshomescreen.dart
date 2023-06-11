import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/presentation/Components/PollStageButton.dart';
import 'package:social_login/features/Polls/presentation/Components/project;ist.dart';
import 'package:social_login/features/Polls/presentation/addPoll.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/Projects/presentation/addproject.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';

import '../../../shared/utils/uiutils.dart';
import '../../Projects/presentation/Components/ProjectsListingCard.dart';
import '../application/Pollsprovider.dart';
import '../domain/PollModel.dart';

class Pollshomescreen extends StatefulWidget {
  const Pollshomescreen({Key key}) : super(key: key);

  @override
  State<Pollshomescreen> createState() => _PollshomescreenState();
}

class _PollshomescreenState extends State<Pollshomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UI.push(context, AddPoll());
        },
        child: Icon(
          PhosphorIcons.plus,
          color: backgroundcolor,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: SizeConfig().hieghtr(80, context),
        centerTitle: false,
        title: Customnormaltext(
          "",
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
                PollStagebutton(
                  tittle: "رواد الأعمال",
                  value: 1,
                ),
              if (Provider.of<UserProvider>(context).user.community >= 2)
                PollStagebutton(
                  tittle: "المستثمرون",
                  value: 2,
                ),
              if (Provider.of<UserProvider>(context).user.community >= 3)
                PollStagebutton(
                  tittle: "المتميزون",
                  value: 3,
                ),
              if (Provider.of<UserProvider>(context).user.community != 1)
                PollStagebutton(
                  tittle: "الجميع",
                  value: 4,
                ),
            ],
          ),
          Expanded(
            child: PollList(
              pagingController:
                  Provider.of<PollsProvider>(context).pagingController,
            ),
          )
        ],
      ),
    );
  }
}
