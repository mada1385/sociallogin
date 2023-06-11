import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/utils/uiutils.dart';
import '../../../../shared/main ui components/relativewidgets.dart';

class NewsHomeCard extends StatelessWidget {
  const NewsHomeCard({
    Key key,
    this.imageusrl,
    this.tittle,
    this.date,
    this.body,
  }) : super(key: key);
  final String imageusrl, tittle, date, body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(end: SizeConfig().widthr(18, context)),
      child: Relativecontainer(
        190,
        200,
        shadow: true,
        allraduis: 8,
        color: backgroundcolor,
        child: Column(children: [
          Relativecontainer(
            190,
            118,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(
                imageusrl,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          UI.highetsizedBox(10, context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      PhosphorIcons.calendar,
                      size: 10,
                    ),
                    Customtext(
                      date,
                      size: 10,
                      color: graymedium,
                    )
                  ],
                ),
                Customtext(
                  tittle,
                  size: 12,
                  color: graymedium,
                  fontWeight: FontWeight.bold,
                ),
                Customtext(
                  body,
                  size: 10,
                  color: graymedium,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
