import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/Polls/presentation/Polldetails.dart';
import 'package:social_login/features/homescreen/presentation/homescreen.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/services/localization/localization.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../../../shared/main ui components/buttons.dart';
import '../../../../shared/main ui components/relativewidgets.dart';

class PollsHomeCard extends StatelessWidget {
  const PollsHomeCard({
    Key key,
    this.poll,
  }) : super(key: key);

  final POLL poll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(end: SizeConfig().widthr(18, context)),
      child: Relativecontainer(
        190,
        300,
        color: backgroundcolor,
        shadow: true,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCircleAvatar(
                    url: poll.user.picture,
                    raduis: SizeConfig().widthr(18, context),
                    comunitycolor: UI.convertcolor(poll.user.communityColor),
                  ),
                  UI.widthsizedBox(8, context),
                  SizedBox(
                    width: SizeConfig().widthr(120, context),
                    height: SizeConfig().hieghtr(50, context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EllipsisCustomtext(
                          poll.user.name,
                          maxlines: 1,
                          size: 12,
                          color: graymedium,
                          fontWeight: FontWeight.bold,
                        ),
                        UI.highetsizedBox(8, context),
                        Relativecontainer(
                          40,
                          20,
                          allraduis: 4,
                          color: UI.convertcolor(poll.user.communityColor),
                          child: Normaltext(
                            poll.user.communityLabel,
                            color: backgroundcolor,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              UI.highetsizedBox(15, context),
              EllipsisCustomtext(
                poll.question,
                maxlines: 3,
                size: 12,
                color: graymedium,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Customtext(
                    "تاريخ الانتهاء: ",
                    size: 12,
                    color: textcolor,
                  ),
                  Customtext(
                    DateFormat("dd/MM/yyyy",
                            AppLocalizations.of(context).locale.languageCode)
                        .format(DateTime.parse(poll.expireDate)),
                    size: 12,
                    color: textcolor,
                  ),
                ],
              ),
              UI.highetsizedBox(15, context),
              customButton(
                onPressed: () {
                  UI.push(
                      context,
                      PollsDetails(
                        poll: poll,
                      ));
                },
                child: const Normaltext(
                  "شارك",
                  size: 14,
                ),
                width: 180,
                highet: 38,
                buttoncolor: greycustombuttoncolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
