import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/presentation/OTP%20screen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/buttons.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';
import '../application/authprovider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController resetPasswordNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Relativecontainer(
              375,
              300,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  repeat: ImageRepeat.repeat,
                  image: AssetImage(
                    'asset/images/reset password art.png',
                  ),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [UI.highetsizedBox(58, context), BackButton()],
                ),
              ),
            ),
            UI.highetsizedBox(20, context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig().widthr(26, context)),
              child: Customtext(
                "إستعادة كلمة المرور",
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
                        isnumber: true,
                        label: "رقم الجوال",
                        hint: "من فضلك أدخل رقم الجوال",
                        validator: 3,
                        controller: resetPasswordNumber,
                        priffix: Icon(
                          PhosphorIcons.device_mobile,
                          size: SizeConfig().hieghtr(20, context),
                          color: textcolor,
                        ),
                      ),
                    ),
                    UI.highetsizedBox(15, context),
                    AnimatedAccentButton(
                      tittle: "إرسال الرابط",
                      onpressed: (thiscontext) async {
                        if (_formKey.currentState.validate()) {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => const OTPScreen()));

                          final bool res = await Provider.of<Authprovider>(
                                  thiscontext,
                                  listen: false)
                              .sendOTP(resetPasswordNumber.text, thiscontext);
                          if (res != null && res == true) {
                            UI.push(
                                context,
                                OTPScreen(
                                  fromreset: true,
                                ));
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
