import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/application/authprovider.dart';
import 'package:social_login/features/user/presentation/changepasswordScreen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/buttons.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/loadingindicator.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key key, this.fromreset = false}) : super(key: key);
  final fromreset;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  OtpFieldController otpFieldController = OtpFieldController();
  String otpBin = "";

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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  repeat: ImageRepeat.repeat,
                  image: AssetImage(
                    'asset/images/OtP art.png',
                  ),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UI.highetsizedBox(58, context),
                  ],
                ),
              ),
            ),
            UI.highetsizedBox(20, context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig().widthr(26, context)),
              child: const Customtext(
                "كود التحقق",
                size: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            UI.highetsizedBox(25, context),
            OTPTextField(
              outlineBorderRadius: 5,
              otpFieldStyle: OtpFieldStyle(focusBorderColor: accentcolor),
              controller: otpFieldController,
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 80,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onChanged: (bin) {
                otpBin = bin;
              },
              onCompleted: (bin) {
                otpBin = bin;
              },
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: SizeConfig().widthr(16, context)),
            //   child: Form(
            //     key: _formKey,
            //     child: Column(
            //       children: [
            //         OnlywidthRelativecontainer(
            //           342,
            //           child: CustomTextfield(
            //             isnumber: true,
            //             label: "رقم الجوال",
            //             hint: "من فضلك أدخل رقم الجوال",
            //             validator: 3,
            //             controller: resetPasswordNumber,
            //             priffix: Icon(
            //               PhosphorIcons.device_mobile,
            //               size: SizeConfig().hieghtr(20, context),
            //               color: textcolor,
            //             ),
            //           ),
            //         ),
            UI.highetsizedBox(25, context),
            AnimatedAccentButton(
              tittle: "إرسال الرابط",
              onpressed: (thiscontext) async {
                if (otpBin.isNotEmpty) {
                  if (otpBin.length != 4) {
                    UI.errorlogger("Please complete the otp");
                  } else {
                    final bool res = await Provider.of<Authprovider>(
                            thiscontext,
                            listen: false)
                        .verifyOTP(otpBin, thiscontext);
                    if (res != null && res == true) {
                      if (widget.fromreset == true) {
                        UI.pushReplaceAll(
                            context,
                            ChangePasswordScreen(
                              fromprofile: false,
                            ));
                      } else {
                        Provider.of<Authprovider>(context, listen: false)
                            .register(context);
                      }
                    }
                  }
                } else {
                  UI.errorlogger("Please complete the otp");
                }
              },
            ),

            UI.highetsizedBox(25, context),
//TODO resend code
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Normaltext("لم تستلم الكود بعد ؟ ",
            //         size: 12, fontWeight: FontWeight.w400),
            //     Normaltext(
            //       "أعد إرسال الكود٠",
            //       size: 12,
            //       fontWeight: FontWeight.w400,
            //       color: accentcolor,
            //     )
            //   ],
            // )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
