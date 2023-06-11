import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/application/authprovider.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/features/user/presentation/UserprofileScreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../../shared/main ui components/buttons.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key key, this.fromprofile = false})
      : super(key: key);
  final bool fromprofile;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController OldpasswordTextControler =
      TextEditingController();
  final TextEditingController newPasswordTextControler =
      TextEditingController();
  final TextEditingController confirmPasswordTextControler =
      TextEditingController();
  String confirmpassword;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userProvideraction =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: secondarybackgroundcolor,
      body: Column(
        children: [
          UI.highetsizedBox(40, context),
          Row(
            children: [
              if (widget.fromprofile)
                BackButton(
                  color: backgroundcolor,
                )
              else
                UI.widthsizedBox(20, context),
              Customtext(
                "تغيير كلمة المرور",
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
                          if (widget.fromprofile)
                            OnlywidthRelativecontainer(
                              342,
                              child: CustomTextfield(
                                controller: OldpasswordTextControler,
                                label: "كلمة المرور القديمة",
                                hint: "من فضلك أدخل كلمة المرور القديمة",
                                validator: 2,
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
                              controller: newPasswordTextControler,
                              label: " كلمة المرور الجديدة",
                              hint: "من فضلك أدخل كلمة المرور الجديدة",
                              validator: 2,
                              priffix: Icon(
                                PhosphorIcons.house,
                                size: SizeConfig().hieghtr(20, context),
                                color: textcolor,
                              ),
                            ),
                          ),
                          UI.highetsizedBox(15, context),
                          OnlywidthRelativecontainer(
                            342,
                            child: CustomTextfield(
                              onChanged: (val) {
                                setState(() {
                                  confirmpassword = val;
                                });
                              },
                              password: newPasswordTextControler.text,
                              controller: confirmPasswordTextControler,
                              label: "تأكيد كلمة المرور الجديدة",
                              hint: "الرجاء أكيد كلمة المرور الجديدة",
                              validator: 7,
                              priffix: Icon(
                                PhosphorIcons.user,
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
                  UI.highetsizedBox(25, context),
                  AnimatedAccentButton(
                    onpressed: (thiscontext) async {
                      if (_formKey.currentState.validate()) {
                        if (widget.fromprofile) {
                          final map = {
                            "oldpassword": OldpasswordTextControler.text,
                            "newpassword": newPasswordTextControler.text
                          };
                          userProvideraction.changePassword(map, thiscontext);
                        } else {
                          final bool res = await Provider.of<Authprovider>(
                                  context,
                                  listen: false)
                              .resetpassword(
                                  newPasswordTextControler.text, thiscontext);
                          if (res != null && res == true) {
                            UI.push(context, UserprofileScreen());
                          }
                        }
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
