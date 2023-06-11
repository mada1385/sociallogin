import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/homescreen/presentation/Components/NewsHomeCard.dart';
import 'package:social_login/features/homescreen/presentation/Components/PollsHomeCard.dart';
import 'package:social_login/features/homescreen/presentation/Components/ProjectHomeCard.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';
import 'package:social_login/shared/utils/uiutils.dart';
import '../../../../shared/main ui components/relativewidgets.dart';
import '../../application/homescreenProvider.dart';

enum Datatypes {
  projecs,
  news,
  polls,
}

class HomeDashboardHoriznalScroll extends StatefulWidget {
  const HomeDashboardHoriznalScroll({
    Key key,
    this.tittle,
    this.addfunction,
    this.showmorefunction,
    this.data,
    this.type,
  }) : super(key: key);
  final String tittle;
  final Function addfunction, showmorefunction;
  final List data;
  final Datatypes type;

  @override
  State<HomeDashboardHoriznalScroll> createState() =>
      _HomeDashboardHoriznalScrollState();
}

class _HomeDashboardHoriznalScrollState
    extends State<HomeDashboardHoriznalScroll> {
  @override
  void initState() {
    if (widget.type == Datatypes.projecs) {
      Provider.of<HomescreenProvider>(context, listen: false)
          .getTopprojects(context);
    }
    if (widget.type == Datatypes.polls) {
      Provider.of<HomescreenProvider>(context, listen: false)
          .getTopPolls(context);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Customtext(
              widget.tittle,
              size: 18,
              fontWeight: FontWeight.bold,
            ),
            if (widget.type != Datatypes.news)
              GestureDetector(
                onDoubleTap: widget.addfunction,
                child: Relativecontainer(
                  25,
                  27,
                  allraduis: 30,
                  color: UI.convertcolor(
                      Provider.of<UserProvider>(context).user.communityColor),
                  child: const Icon(
                    PhosphorIcons.plus,
                    color: backgroundcolor,
                    size: 20,
                  ),
                ),
              )
          ],
        ),
        UI.highetsizedBox(10, context),
        OnlyhightRelativecontainer(
          widget.type == Datatypes.news
              ? 200
              : widget.type == Datatypes.polls
                  ? 250
                  : 200,
          child: UI.checkBusy(context)
              ? LoadingListPage(
                  vertical: false,
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.type == Datatypes.polls
                      ? Provider.of<HomescreenProvider>(context).polls.length
                      : Provider.of<HomescreenProvider>(context)
                          .projects
                          .length,
                  itemBuilder: (context, index) => widget.type == Datatypes.news
                      ? const NewsHomeCard(
                          body:
                              "هذا النص هو مثال لنص يمكن أن يستبدل نفس لقد تم توليد هذا النص المزيد",
                          tittle: "التعرف على العوالم الافتراضية",
                          date: "24/2/2021",
                          imageusrl:
                              "https://lh3.googleusercontent.com/6TmJZBxJkiTtJOpshLzm9RVrg2xKnbPj8Xmqlc7cxz7pqGcw_gks9dDCTU2D-4Q8RS7JhxYujppIZapt=w544-h544-l90-rj",
                        )
                      : widget.type == Datatypes.polls
                          ? PollsHomeCard(
                              poll: Provider.of<HomescreenProvider>(context)
                                  .polls[index],
                            )
                          : ProjectHomeCard(
                              project: Provider.of<HomescreenProvider>(context)
                                  .projects[index],
                            )),
        ),
        UI.highetsizedBox(10, context),
        GestureDetector(
          onDoubleTap: widget.showmorefunction,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Customtext(
                "المزيد",
                size: 18,
                color: UI.getcommunitycolor(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
