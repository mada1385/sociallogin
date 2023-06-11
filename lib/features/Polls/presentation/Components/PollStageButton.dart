import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';

class PollStagebutton extends StatelessWidget {
  PollStagebutton({Key key, @required this.tittle, @required this.value})
      : super(key: key);
  final String tittle;
  final int value;
  final Map buttoncolor = {
    "رواد الأعمال": accentcolor,
    "المستثمرون": investorusercolor,
    "المتميزون": vipusercolor,
    "الجميع": secondarybackgroundcolor
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Provider.of<PollsProvider>(context, listen: false)
            .setcomunity(value, context),
        child: OnlyhightRelativecontainer(
          45,
          borderd: Provider.of<PollsProvider>(context).comunity == value,
          color: buttoncolor[tittle],
          child: Center(
              child: Normaltext(
            tittle,
            size: 14,
            color: backgroundcolor,
          )),
        ),
      ),
    );
  }
}
