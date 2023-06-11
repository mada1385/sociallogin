import 'dart:async';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/providers/stateprovider.dart';
import '../config/mediaqueryconfig.dart';
import '../services/localization/localization.dart';
import 'package:logger/logger.dart';

class UI {
  // static loading(BuildContext context) {
  //   return Provider.of<Stateprovider>(
  //             context,
  //           ).state ==
  //           "idle"
  //       ? Container()
  //       : Loadingstack();
  // }

  static Color convertcolor(String hexa) {
    return Color(int.parse("0xff${hexa.replaceFirst("#", "")}"));
  }

  static Color getcommunitycolor(BuildContext context) {
    return convertcolor(Provider.of<UserProvider>(context).user.communityColor);
  }

  static void setbusy(BuildContext context) {
    Provider.of<StateProvider>(context, listen: false).setbusy(context);
  }

  static void setidle(BuildContext context) {
    Provider.of<StateProvider>(context, listen: false).setidle();
  }

  static bool checkBusy(BuildContext context) {
    return Provider.of<StateProvider>(context).state == context.widget.hashCode;
  }

  static logger(dynamic input) {
    Logger().d(input);
  }

  static errorlogger(dynamic input) {
    Logger().e(input);
    toast(input.toString());
  }

  static catchlogger(dynamic input) {
    Logger().e(input);
    toast("somthing went wrong please try again later");
  }

  static buttonhaptic() {
    HapticFeedback.heavyImpact();
  }

  static errorhPTIC() async {
    HapticFeedback.heavyImpact();
    await Future.delayed(Duration(milliseconds: 20));
    HapticFeedback.heavyImpact();
  }

  static Future<dynamic> push(BuildContext context, Widget page,
      {bool replace = false, int delay}) async {
    if (delay != null)
      await Future.delayed(Duration(milliseconds: delay), () {});
    final route = MaterialPageRoute(builder: (c) => page);

    return replace
        ? await Navigator.pushReplacement(context, route)
        : await Navigator.push(context, route);
  }

  static Future<dynamic> pushReplaceAll(BuildContext context, Widget page,
      {int delay}) async {
    if (delay != null)
      await Future.delayed(Duration(milliseconds: delay), () {});
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> dialog(
      {BuildContext context,
      bool dismissible = true,
      Widget child,
      bool accept,
      String title,
      String msg,
      String acceptMsg,
      String cancelMsg}) async {
    return await showDialog<dynamic>(
        context: context,
        barrierDismissible: dismissible,
        builder: (context) {
          return Dialog(
            // ignore: prefer_if_null_operators
            child: child != null
                ? child
                : Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (child != null) child,
                        if (title != null)
                          Text(title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        if (msg != null)
                          Text(msg,
                              maxLines: 2, style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5),
                        if (accept != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                                style: ButtonStyle(),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(
                                  cancelMsg,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(
                                  acceptMsg,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
          );
        });
  }

  static highetsizedBox(double highet, BuildContext context) {
    return SizedBox(
      height: SizeConfig().hieghtr(highet, context),
    );
  }

  static widthsizedBox(@required double width, BuildContext context) {
    return SizedBox(
      width: SizeConfig().widthr(width, context),
    );
  }

  static unfocus(context) {
    FocusScope.of(context).unfocus();
  }

  static toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 15.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey[700],
    );
  }

  static cherrytoast(String msg, BuildContext context) {
    CherryToast.error(title: Text(msg)).show(context);
  }

  static PhosphorIconsData buildCaretOnDirection(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return locale.locale.languageCode == "en"
        ? PhosphorIcons.caret_right
        : PhosphorIcons.caret_left;
  }

  // static Future<DateTime> showBirthdayCalender(BuildContext context,
  //     {DateTime currentTime,
  //     DateTime maxTime,
  //     Function(DateTime) onDone}) async {
  //   return await DatePicker.showDatePicker(
  //     context,
  //     currentTime: currentTime,
  //     maxTime: maxTime,
  //     theme: const DatePickerTheme(
  //       doneStyle: TextStyle(
  //         color: primarycolor,
  //         fontFamily: "inter",
  //         fontWeight: FontWeight.w500,
  //       ),
  //       cancelStyle: TextStyle(
  //         color: graymedium,
  //         fontFamily: "inter",
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //     onConfirm: (val) {
  //       onDone(val);
  //     },
  //     onCancel: () {},
  //   );
  // }

  static Future<DateTime> showMonYearCalender(
    BuildContext context, {
    DateTime initDate,
    DateTime startDate,
    DateTime endDate,
  }) async {
    return await showMonthYearPicker(
        context: context,
        initialDate: initDate,
        firstDate: startDate,
        lastDate: endDate,
        builder: (context, chld) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: const MaterialColor(
                  0xff5998AB,
                  const <int, Color>{
                    50: const Color(0xff5998AB),
                    100: const Color(0xff5998AB),
                    200: const Color(0xff5998AB),
                    300: const Color(0xff5998AB),
                    400: const Color(0xff5998AB),
                    500: const Color(0xff5998AB),
                    600: const Color(0xff5998AB),
                    700: const Color(0xff5998AB),
                    800: const Color(0xff5998AB),
                    900: const Color(0xff5998AB),
                  },
                ),
              ),
            ),
            child: chld,
          );
        });
  }

  static padding24all(BuildContext context) {
    return EdgeInsets.symmetric(
        horizontal: SizeConfig().widthr(24, context),
        vertical: SizeConfig().hieghtr(24, context));
  }

  static padding16all(BuildContext context) {
    return EdgeInsets.symmetric(
        horizontal: SizeConfig().widthr(16, context),
        vertical: SizeConfig().hieghtr(16, context));
  }

  static padding16horizntal(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: SizeConfig().widthr(16, context),
    );
  }

  static padding16vertical(BuildContext context) {
    return EdgeInsets.symmetric(vertical: SizeConfig().hieghtr(16, context));
  }

  static padding24horizntal(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: SizeConfig().widthr(24, context),
    );
  }

  static padding24vertical(BuildContext context) {
    return EdgeInsets.symmetric(vertical: SizeConfig().hieghtr(24, context));
  }

  static padding8horizntal(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: SizeConfig().widthr(8, context),
    );
  }

  static padding8vertical(BuildContext context) {
    return EdgeInsets.symmetric(vertical: SizeConfig().hieghtr(8, context));
  }

  static padding8all(BuildContext context) {
    return EdgeInsets.symmetric(
        horizontal: SizeConfig().widthr(8, context),
        vertical: SizeConfig().hieghtr(8, context));
  }
}
