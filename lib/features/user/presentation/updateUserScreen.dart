import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/features/user/presentation/changepasswordScreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../../shared/main ui components/buttons.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({Key key}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  String roleValue;
  String capitalvalue;
  final List roles = ["مستثمر", "راىد اعمال"];
  final List capital = [
    "100K:500K",
    "500K: 1M",
    "1M: 2M",
    "More 5M",
  ];
  final TextEditingController usernameTextControler = TextEditingController();
  final TextEditingController phoneNumberTextControler =
      TextEditingController();
  final TextEditingController addressTextControler = TextEditingController();
  final TextEditingController confirmPasswordTextControler =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userProvideraction = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: secondarybackgroundcolor,
      body: Column(
        children: [
          UI.highetsizedBox(40, context),
          Row(
            children: [
              BackButton(
                color: backgroundcolor,
              ),
              Customtext(
                "حسابى",
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          UI.highetsizedBox(20, context),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  UI.highetsizedBox(15, context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig().widthr(16, context)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          OnlywidthRelativecontainer(
                            342,
                            child: CustomTextfield(
                              controller: usernameTextControler,
                              label: "اسم المستخدم",
                              hint: "الرجاء ادخال  اسم المستخدم",
                              validator: 6,
                              priffix: Icon(
                                PhosphorIcons.user,
                                size: SizeConfig().hieghtr(20, context),
                                color: textcolor,
                              ),
                            ),
                          ),
                          UI.highetsizedBox(15, context),
                          OnlywidthRelativecontainer(
                            342,
                            child: CustomTextfield(
                              controller: phoneNumberTextControler,
                              label: "دقم الهاتف",
                              isnumber: true,
                              hint: "الرجاء ادخال دقم الهاتف",
                              validator: 8,
                              priffix: Icon(
                                PhosphorIcons.envelope,
                                size: SizeConfig().hieghtr(20, context),
                                color: textcolor,
                              ),
                            ),
                          ),
                          UI.highetsizedBox(15, context),
                          OnlywidthRelativecontainer(342,
                              borderd: true,
                              raduis: 8,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: roleValue,
                                    hint: Row(
                                      children: [
                                        Icon(
                                          PhosphorIcons.user,
                                          color: textcolor,
                                          size: 20,
                                        ),
                                        UI.widthsizedBox(18, context),
                                        Normaltext(
                                          "انت",
                                          color: textcolor,
                                        ),
                                      ],
                                    ),
                                    isExpanded: true,
                                    onChanged: (val) {
                                      setState(() {
                                        roleValue = val;
                                      });
                                    },
                                    items: roles
                                        .map((e) => DropdownMenuItem(
                                              child: Customtext(e),
                                              value: e,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              )),
                          if (roleValue == "مستثمر")
                            Column(
                              children: [
                                UI.highetsizedBox(15, context),
                                OnlywidthRelativecontainer(342,
                                    borderd: true,
                                    raduis: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: capitalvalue,
                                          hint: Row(
                                            children: [
                                              Icon(
                                                PhosphorIcons.money,
                                                color: textcolor,
                                                size: 20,
                                              ),
                                              UI.widthsizedBox(18, context),
                                              Normaltext(
                                                "حجم رأس المال المتاح للإستثمار",
                                                color: textcolor,
                                              ),
                                            ],
                                          ),
                                          isExpanded: true,
                                          onChanged: (val) {
                                            setState(() {
                                              capitalvalue = val;
                                            });
                                          },
                                          items: capital
                                              .map((e) => DropdownMenuItem(
                                                    child: Customtext(e),
                                                    value: e,
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          UI.highetsizedBox(15, context),
                          OnlywidthRelativecontainer(
                            342,
                            child: CustomTextfield(
                              controller: addressTextControler,
                              label: "العنوان",
                              hint: "الرجاء ادخال دقم العنوان",
                              validator: 6,
                              priffix: Icon(
                                PhosphorIcons.house,
                                size: SizeConfig().hieghtr(20, context),
                                color: textcolor,
                              ),
                            ),
                          ),
                          UI.highetsizedBox(15, context),
                        ],
                      ),
                    ),
                  ),
                  UI.highetsizedBox(15, context),
                  GestureDetector(
                    onTap: () {
                      UI.push(
                          context,
                          ChangePasswordScreen(
                            fromprofile: true,
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig().widthr(16, context)),
                      child: Row(
                        children: [
                          Relativecontainer(
                            22,
                            24,
                            color: accentcolor.withOpacity(.1),
                            allraduis: 22,
                            child: const Icon(
                              PhosphorIcons.lock,
                              size: 14,
                              color: accentcolor,
                            ),
                          ),
                          UI.widthsizedBox(8, context),
                          const Normaltext("تغيير كلمة المرور")
                        ],
                      ),
                    ),
                  ),
                  UI.highetsizedBox(25, context),
                  AnimatedAccentButton(
                    onpressed: (thiscontext) {
                      if (_formKey.currentState.validate()) {
                        final map = {
                          "name": usernameTextControler.text ?? null,
                          "communtiy": roleValue ?? null,
                          "available_capital": capitalvalue ?? null,
                          // "bio": "", TODO add bio
                          "phone": phoneNumberTextControler.text,

                          "address": addressTextControler.text ?? null
                        };
                        userProvider.updateprofile(map, thiscontext);
                      }
                    },
                    tittle: "حفظ التغييرات",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
