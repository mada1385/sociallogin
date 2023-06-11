import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/data/authAPI.dart';
import 'package:social_login/features/auth/presentation/signupscreen.dart';
import 'package:social_login/features/homescreen/presentation/Dashboardscreen.dart';
import 'package:social_login/features/homescreen/presentation/homescreen.dart';
import 'package:social_login/shared/services/preference/preference.dart';
import 'package:social_login/shared/utils/uiutils.dart';

import '../../user/application/userprovider.dart';
import '../../user/domain/usermodel.dart';
import '../../user/presentation/UserprofileScreen.dart';

class Authprovider extends ChangeNotifier {
  double sumOfTotalCapital = 34654576547;
  String otpRef;
  Map registerform;
  String socialName, socailToken;

  void setsocialname(String socialname, socailtoken) {
    socialName = socialname;
    socailToken = socailtoken;
    notifyListeners();
  }

  void setotpRef(String input) {
    otpRef = input;
    notifyListeners();
  }

  void setregisterform(Map input) {
    registerform = input;
    otpRef = registerform["phone"];
    UI.logger(registerform);
    notifyListeners();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    UI.setbusy(context);
    await Future.delayed(Duration(seconds: 3));
    try {
      final inputbody = {"reference": email, "password": password};
      final res = await AuthApi().login(inputbody);

      if (res != null) {
        Usermodel user = Usermodel.fromJson(res["data"]);
        Provider.of<UserProvider>(context, listen: false).setuser(user);
        Preference.setString(PrefKeys.token, user.token);
        UI.logger(Preference.getString(PrefKeys.token));
        Preference.setString(PrefKeys.userData, jsonEncode(user.toJson()));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Dashboardscreen()));
      }
    } catch (e) {
      UI.catchlogger(e);
      UI.setidle(context);
    }
    UI.setidle(context);
  }

  Future<void> register(BuildContext context, {bool fromsocail = false}) async {
    UI.setbusy(context);
    try {
      if (fromsocail) {
        registerform["meta_data"] = {"social_token": socailToken};
      }
      UI.logger(registerform);
      final res = await AuthApi().register(registerform);
      if (res != null) {
        Usermodel user = Usermodel.fromJson(res["data"]);
        Provider.of<UserProvider>(context, listen: false).setuser(user);

        Preference.setString(PrefKeys.token, user.token);
        Preference.setString(PrefKeys.userData, jsonEncode(user.toJson()));
        UI.setidle(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const UserprofileScreen()));
      }
    } catch (e) {
      UI.catchlogger(e);
    }
    UI.setidle(context);
  }

  Future<bool> sendOTP(String otpref, BuildContext context) async {
    UI.setbusy(context);
    try {
      otpRef = otpref;
      final res = await AuthApi().sendotp({"reference": otpRef});
      if (res != null) {
        UI.setidle(context);

        return true;
      }
    } catch (e) {
      UI.catchlogger(e);
    }
    UI.setidle(context);
  }

  Future<bool> verifyOTP(String otpCode, BuildContext context) async {
    UI.setbusy(context);

    try {
      Map bodydata = {"reference": otpRef, "code": otpCode};
      final res = await AuthApi().verifyOTP(bodydata);
      if (res != null) {
        UI.setidle(context);

        return true;
      }
    } catch (e) {
      UI.catchlogger(e);
    }
    UI.setidle(context);
  }

  Future<bool> resetpassword(String newpassword, BuildContext context) async {
    UI.setbusy(context);

    try {
      Map bodydata = {"reference": otpRef, "password": newpassword};
      final res = await AuthApi().resetpassword(bodydata);
      if (res != null) {
        otpRef = "";
        final user = Usermodel.fromJson(res["data"]);
        Provider.of<UserProvider>(context, listen: false).setuser(user);
        Preference.setString(PrefKeys.token, user.token);
        Preference.setString(PrefKeys.userData, jsonEncode(user.toJson()));

        return true;
      }
    } catch (e) {
      UI.catchlogger(e);
    }
    UI.setidle(context);
  }

  Future<bool> socialLogin(
      String socailtoken, String socailname, BuildContext context) async {
    try {
      Map bodydata = {"social_token": socailtoken};
      final res = await AuthApi().sociallogin(bodydata);
      if (res != null) {
        if (res["status"] == 200) {
          otpRef = "";
          final user = Usermodel.fromJson(res["data"]);
          Provider.of<UserProvider>(context, listen: false).setuser(user);
          Preference.setString(PrefKeys.token, user.token);
          Preference.setString(PrefKeys.userData, jsonEncode(user.toJson()));
          UI.push(context, UserprofileScreen());
        } else if (res["status"] == 401) {
          socailToken = socailtoken;
          socialName = socailname;
          UI.push(context, SignupScreen(socail: true));
        }
      }
    } catch (e) {
      UI.catchlogger(e);
    }
  }
}
