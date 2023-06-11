import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/application/authprovider.dart';
import 'package:social_login/features/auth/presentation/OTP%20screen.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/buttons.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key, this.socail = false}) : super(key: key);
  final bool socail;
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List roles = ["مستثمر", "راىد اعمال"];
  final List capital = [
    "100K:500K",
    "500K: 1M",
    "1M: 2M",
    "More 5M",
  ];
  String roleValue;
  String capitalvalue;
  TextEditingController usernameTextControler;
  final TextEditingController phoneNumberTextControler =
      TextEditingController();
  final TextEditingController passwordTextControler = TextEditingController();
  final TextEditingController confirmPasswordTextControler =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        usernameTextControler = TextEditingController(
            text: widget.socail
                ? Provider.of<Authprovider>(context, listen: false).socialName
                : null);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Authprovider>(context);
    final userProvideraction =
        Provider.of<Authprovider>(context, listen: false);
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
                    'asset/images/signupimage.png',
                  ),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UI.highetsizedBox(58, context),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig().widthr(26, context)),
                      child: Row(
                        children: [
                          BackButton(),
                          Customtext(
                            "انشا، حساب",
                            fontWeight: FontWeight.w700,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            UI.highetsizedBox(20, context),
            Normaltext(
              "المبلغ الاجمالى المتاح للاستثمار  (ريال)",
              fontWeight: FontWeight.w700,
              size: 10,
              color: textcolor,
            ),
            UI.highetsizedBox(15, context),
            Normaltext(
              userProvider.sumOfTotalCapital
                  .toInt()
                  .toString()
                  .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (match) => '${match[1]},'),
              fontWeight: FontWeight.w700,
              size: 20,
            ),
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
                        validator: 0,
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
                        validator: 3,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                        controller: passwordTextControler,
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
                    OnlywidthRelativecontainer(
                      342,
                      child: CustomTextfield(
                        controller: confirmPasswordTextControler,
                        label: "تأكيد كلمة المرور",
                        hint: "من فضلك اعد أدخال كلمة المرور",
                        validator: 7,
                        password: passwordTextControler.text,
                        // confirmpassword: confirmPasswordTextControler.text,

                        isobscure: true,
                        priffix: Icon(
                          PhosphorIcons.lock,
                          size: SizeConfig().hieghtr(20, context),
                          color: textcolor,
                        ),
                      ),
                    ),
                    UI.highetsizedBox(15, context),
                    AnimatedAccentButton(
                      thatcontext: context,
                      onpressed: (thiscontext) {
                        UI.logger(roleValue);

                        if (_formKey.currentState.validate()) {
                          if (roleValue != null) {
                            if (roleValue == "مستثمر") {
                              Logger().d("مستثمر");
                              if (capitalvalue != null) {
                                userProvideraction.setregisterform({
                                  "name": usernameTextControler.text,
                                  "phone": phoneNumberTextControler.text,
                                  "communtiy": 2,
                                  "available_capital": capitalvalue ?? " ",
                                  "password": passwordTextControler.text,
                                });
                                if (!widget.socail) {
                                  UI.push(
                                      context,
                                      OTPScreen(
                                        fromreset: false,
                                      ));
                                } else {
                                  Provider.of<Authprovider>(context,
                                          listen: false)
                                      .register(context, fromsocail: true);
                                }
                              } else {
                                UI.toast("Please choose capital");
                              }
                            } else {
                              Provider.of<Authprovider>(context, listen: false)
                                  .setregisterform({
                                "name": usernameTextControler.text,
                                "phone": phoneNumberTextControler.text,
                                "communtiy": 1,
                                "available_capital": capitalvalue ?? " ",
                                "password": passwordTextControler.text,
                              });
                              if (!widget.socail) {
                                UI.push(
                                    context,
                                    OTPScreen(
                                      fromreset: false,
                                    ));
                              } else {
                                Provider.of<Authprovider>(context,
                                        listen: false)
                                    .register(context, fromsocail: true);
                              }
                            }
                          } else {
                            UI.toast("Please select a role");
                          }
                        }
                      },
                      tittle: "إنشاء حساب",
                    )
                  ],
                ),
              ),
            ),
            UI.highetsizedBox(25, context),
          ],
        ),
      ),
    );
  }
}
