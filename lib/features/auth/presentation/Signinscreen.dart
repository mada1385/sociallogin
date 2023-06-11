import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/application/authprovider.dart';
import 'package:social_login/features/auth/presentation/resetPasswordScreen.dart';
import 'package:social_login/features/auth/presentation/signupscreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/loadingindicator.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/providers/stateprovider.dart';
import 'package:social_login/shared/services/google-logging.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../../shared/main ui components/buttons.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Authprovider>(context);
    final userProvideraction = Provider.of<Authprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Relativecontainer(
              375,
              300,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150)),
              color: lightgray,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UI.highetsizedBox(40, context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig().widthr(26, context)),
                    child: Customtext(
                      "تسجيل الدخول",
                      fontWeight: FontWeight.w700,
                      size: 20,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset("asset/images/SigninArt.svg"),
                  ),
                ],
              ),
            ),
            UI.highetsizedBox(15, context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig().widthr(26, context)),
              child: Customtext(
                "أهلا بعودتك",
                size: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            UI.highetsizedBox(25, context),
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
                        controller: phoneNumberController,
                        label: "رقم الجوال",
                        hint: "من فضلك أدخل البريد الالكترونى",
                        validator: 3,
                        priffix: Icon(
                          PhosphorIcons.device_mobile,
                          size: SizeConfig().hieghtr(20, context),
                          color: textcolor,
                        ),
                      ),
                    ),
                    UI.highetsizedBox(15, context),
                    OnlywidthRelativecontainer(
                      342,
                      child: CustomTextfield(
                        controller: passwordController,
                        label: "كلمة المرور",
                        hint: "من فضلك أدخل كلمة المرور",
                        validator: 2,
                        isobscure: true,
                        priffix: Icon(
                          PhosphorIcons.lock,
                          size: SizeConfig().hieghtr(20, context),
                          color: textcolor,
                        ),
                      ),
                    ),
                    UI.highetsizedBox(15, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              UI.push(context, const ResetPasswordScreen()),
                          child: const Customtext(
                            "هل نسيت كلمة المرور؟",
                            size: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    UI.highetsizedBox(15, context),
                    AnimatedAccentButton(
                      onpressed: (thiscontext) async {
                        if (_formKey.currentState.validate()) {
                          await Provider.of<Authprovider>(context,
                                  listen: false)
                              .login(phoneNumberController.text,
                                  passwordController.text, thiscontext);
                        }
                      },
                      tittle: "تسجيل دخول",
                    ),
                    UI.highetsizedBox(25, context),
                    const Normaltext(
                      "أو",
                      color: textcolor,
                      size: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
            UI.highetsizedBox(25, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    FacebookLogin().signInWithFacebook();
                  },
                  child: Relativecontainer(
                    50,
                    55,
                    color: Colors.blueAccent.shade700,
                    allraduis: 40,
                    child: Icon(
                      Icons.facebook_sharp,
                      color: backgroundcolor,
                    ),
                  ),
                ),
                UI.widthsizedBox(15, context),

                GestureDetector(
                  onTap: () async {
                    UI.logger("signInWithGoogle");
                    final res = await GoogleLogin().signInWithGoogle();
                    final GoogleSignInAuthentication googleAuth =
                        await res?.authentication;
                    userProvideraction.setsocialname(
                        res.displayName, googleAuth.accessToken);
                    userProvideraction.socialLogin(
                        res.displayName, googleAuth.accessToken, context);
                  },
                  child: Relativecontainer(
                    50,
                    55,
                    color: warningcolor,
                    allraduis: 40,
                    child: Icon(
                      PhosphorIcons.google_logo_bold,
                      color: backgroundcolor,
                    ),
                  ),
                ),
                // UI.widthsizedBox(15, context),

                // Relativecontainer(
                //   50,
                //   55,
                //   color: Colors.lightBlue,
                //   allraduis: 40,
                //   child: Icon(
                //     PhosphorIcons.twitter_logo_fill,
                //     color: backgroundcolor,
                //   ),
                // )
                // FlutterSocialButton(
                //   buttonType: ButtonType.facebook,
                // )
                // social.facebookButtonCircle(onTap: () {}),
                // SocialButton.googleButtonCircle(onTap: () {}),
                // SocialButton.twitterButtonCircle(onTap: () {}),
              ],
            ),
            UI.highetsizedBox(25, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Normaltext(" ليس لديك حساب ؟",
                    size: 12, fontWeight: FontWeight.w400),
                GestureDetector(
                  onTap: () {
                    UI.push(context, const SignupScreen());
                  },
                  child: Normaltext(
                    " اضغط هنا",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: accentcolor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
