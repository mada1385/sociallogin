import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/features/user/presentation/updateUserScreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class UserprofileScreen extends StatefulWidget {
  const UserprofileScreen({Key key}) : super(key: key);

  @override
  State<UserprofileScreen> createState() => _UserprofileScreenState();
}

class _UserprofileScreenState extends State<UserprofileScreen> {
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("asset/images/user profile background.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UI.highetsizedBox(54, context),
            BackButton(
              color: backgroundcolor,
            ),
            UI.highetsizedBox(30, context),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      OnlywidthRelativecontainer(
                        343,
                        color: Colors.white,
                        shadow: true,
                        raduis: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  SizeConfig().hieghtr(10, context)),
                              child: Relativecontainer(
                                50,
                                22,
                                color: accentcolor,
                                borderd: true,
                                allraduis: 5,
                                child: Normaltext(
                                  userprovider.user.communityLabel,
                                  color: Colors.white,
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 50,
                                  backgroundImage:
                                      userprovider.user.picture == null
                                          ? AssetImage(
                                              "asset/images/user image.png")
                                          : Image.network(
                                              userprovider.user.picture),
                                ),
                                Normaltext(
                                  userprovider.user.name,
                                  size: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                UI.highetsizedBox(15, context),
                                GestureDetector(
                                  onTap: () => UI.push(
                                      context, const UpdateUserScreen()),
                                  child: Row(
                                    children: [
                                      Relativecontainer(100, 40,
                                          color: greybuttoncolor,
                                          borderd: true,
                                          allraduis: 5,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  "asset/images/edit icon.png"),
                                              UI.widthsizedBox(10, context),
                                              const Customtext(
                                                "تعديل",
                                                size: 14,
                                                color: graymedium,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                UI.highetsizedBox(15, context),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  SizeConfig().hieghtr(10, context)),
                              child: Relativecontainer(
                                30,
                                30,
                                color: greybuttoncolor,
                                borderd: true,
                                allraduis: 5,
                                child: Icon(PhosphorIcons.dots_three_vertical),
                              ),
                            ),
                          ],
                        ),
                      ),
                      UI.highetsizedBox(10, context),
                      Relativecontainer(
                        345,
                        50,
                        color: Colors.white,
                        shadow: true,
                        allraduis: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Relativecontainer(
                                  22,
                                  24,
                                  color: greybuttoncolor,
                                  allraduis: 22,
                                  child: const Icon(
                                    PhosphorIcons.map_pin_fill,
                                    size: 14,
                                    color: textcolor,
                                  ),
                                ),
                                UI.widthsizedBox(8, context),
                                Normaltext(userprovider.user.address)
                              ],
                            ),
                            Relativecontainer(
                              1,
                              22,
                              color: greybuttoncolor,
                            ),
                            Row(
                              children: [
                                Relativecontainer(
                                  22,
                                  24,
                                  color: greybuttoncolor,
                                  allraduis: 22,
                                  child: const Icon(
                                    PhosphorIcons.users,
                                    size: 14,
                                    color: textcolor,
                                  ),
                                ),
                                UI.widthsizedBox(8, context),
                                Normaltext(
                                    userprovider.user.community.toString())
                              ],
                            )
                          ],
                        ),
                      ),
                      UI.highetsizedBox(10, context),
                      OnlywidthRelativecontainer(343,
                          color: Colors.white,
                          shadow: true,
                          raduis: 8,
                          child: Padding(
                            padding: EdgeInsets.all(
                                SizeConfig().hieghtr(10, context)),
                            child: Column(
                              children: [
                                const Customtext(
                                  "نبذة عنا",
                                  fontWeight: FontWeight.bold,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Customtext(
                                  userprovider.user.bio ?? " ",
                                  fontWeight: FontWeight.w700,
                                  size: 12,
                                ),
                                UI.highetsizedBox(5, context),
                              ],
                            ),
                          )),
                      UI.highetsizedBox(10, context),
                      Relativecontainer(343, 161,
                          color: Colors.white,
                          shadow: true,
                          allraduis: 8,
                          child: Padding(
                            padding: EdgeInsets.all(
                                SizeConfig().hieghtr(10, context)),
                            child: Column(
                              children: [
                                const Customtext(
                                  "معلومات أخرى",
                                  fontWeight: FontWeight.bold,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                UI.highetsizedBox(10, context),
                                Row(
                                  children: [
                                    Relativecontainer(
                                      22,
                                      24,
                                      color: greybuttoncolor,
                                      allraduis: 22,
                                      child: const Icon(
                                        PhosphorIcons.map_pin_fill,
                                        size: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    UI.widthsizedBox(8, context),
                                    Normaltext(userprovider.user.address)
                                  ],
                                ),
                                UI.highetsizedBox(10, context),
                                Row(
                                  children: [
                                    Relativecontainer(
                                      22,
                                      24,
                                      color: greybuttoncolor,
                                      allraduis: 22,
                                      child: const Icon(
                                        PhosphorIcons.users,
                                        size: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    UI.widthsizedBox(8, context),
                                    Normaltext(
                                        userprovider.user.community.toString())
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
