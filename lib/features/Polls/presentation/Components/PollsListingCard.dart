import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/Polls/presentation/Polldetails.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/Projects/presentation/projectdetails.dart';
import 'package:social_login/features/homescreen/presentation/homescreen.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/buttons.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class PollsListingCard extends StatefulWidget {
  const PollsListingCard({
    Key key,
    this.poll,
  }) : super(key: key);
  final POLL poll;

  @override
  State<PollsListingCard> createState() => _PollsListingCardState();
}

class _PollsListingCardState extends State<PollsListingCard> {
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
        initiallyExpanded: true,
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
          raduis: 18,
          comunitycolor: UI.convertcolor(widget.poll.user.communityColor),
          url: widget.poll.user.picture,
        ),
        title: Customtext(
          widget.poll.user.name ?? " ",
          size: 14,
          color: graymedium,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Relativecontainer(
              40,
              20,
              allraduis: 3,
              color: UI.convertcolor(widget.poll.communityColor),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Normaltext(
                  widget.poll.communityLabel,
                  color: backgroundcolor,
                  size: 10,
                ),
              ),
            ),
            UI.widthsizedBox(8, context),
          ],
        ),
        children: [
          OnlywidthRelativecontainer(
            323,
            child: Column(
              children: [
                OnlywidthRelativecontainer(
                  320,
                  child: Customtext(
                    widget.poll.question ?? " ",
                    size: 14,
                  ),
                ),
                UI.highetsizedBox(20, context),
                Row(
                  children: [
                    Customtext(
                      "تاريخ الانتهاء: ",
                      size: 12,
                      color: textcolor,
                    ),
                    UI.widthsizedBox(8, context),
                    Customtext(
                      DateFormat("dd/MM/yyyy")
                          .format(DateTime.parse(widget.poll.expireDate)),
                      size: 12,
                      color: textcolor,
                    ),
                  ],
                ),
                UI.highetsizedBox(20, context),
                customButton(
                  onPressed: () {
                    UI.push(
                        context,
                        PollsDetails(
                          poll: widget.poll,
                        ));
                  },
                  child: const Normaltext(
                    "شارك",
                    size: 14,
                  ),
                  width: 180,
                  highet: 38,
                  buttoncolor: greycustombuttoncolor,
                ),
                UI.highetsizedBox(20, context),
              ],
            ),
          ),
          UI.highetsizedBox(10, context),
        ],
      ),
    );
  }
}
