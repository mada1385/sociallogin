import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:social_login/features/Projects/presentation/projectTabScreen.dart';
import 'package:social_login/features/Projects/presentation/projecthomescreen.dart';
import 'package:social_login/features/homescreen/presentation/homescreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class Dashboardscreen extends StatefulWidget {
  Dashboardscreen({Key key}) : super(key: key);

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int index = 0;
  final List<Widget> screens = const [
    Homescreen(),
    Homescreen(),
    Homescreen(),
    ProjectTabScreen(),
    Homescreen(),
  ];
  final List<String> tittle = const [
    " الرئيسية",
    " الرئيسية",
    " الرئيسية",
    " استثمار",
    " الرئيسية",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 5,
        toolbarHeight: SizeConfig().hieghtr(80, context),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UI.widthsizedBox(16, context),
            Customtext(
              tittle[index],
              color: backgroundcolor,
              size: 18,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              const Icon(PhosphorIcons.envelope_simple),
              UI.widthsizedBox(10, context),
              const Icon(PhosphorIcons.bell),
              UI.widthsizedBox(20, context),
              CustomCircleAvatar(
                comunitycolor: UI.getcommunitycolor(context),
              ),
              UI.widthsizedBox(16, context),
            ],
          )
        ],
        backgroundColor: secondarybackgroundcolor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: ((value) {
          setState(() {
            index = value;
          });
        }),
        selectedItemColor: UI.getcommunitycolor(context),
        unselectedItemColor: graymedium,
        unselectedLabelStyle: const TextStyle(color: graymedium),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.house_fill), label: "الرئيسية"),
          BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.chat_fill), label: "المحادثات"),
          BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.share_network), label: "شبكتى"),
          BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.money), label: "استثمر"),
          BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.square), label: "المزيد"),
        ],
      ),
      body: screens[index],
    );
  }
}
