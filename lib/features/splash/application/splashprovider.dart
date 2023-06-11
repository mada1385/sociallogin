import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/presentation/Signinscreen.dart';
import 'package:social_login/features/homescreen/presentation/Dashboardscreen.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/features/user/domain/usermodel.dart';
import 'package:social_login/features/user/presentation/UserprofileScreen.dart';
import 'package:social_login/shared/services/preference/preference.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class SplashProvider extends ChangeNotifier {
  checkforlogging(BuildContext context) {
    final String token = Preference.getString(PrefKeys.token);
    final String userjson = Preference.getString(PrefKeys.userData);

    if (token != null && userjson != null) {
      final Usermodel user = Usermodel.fromJson(
          jsonDecode(Preference.getString(PrefKeys.userData)));
      Provider.of<UserProvider>(context, listen: false).setuser(user);
      UI.pushReplaceAll(context, Dashboardscreen());
    } else {
      UI.pushReplaceAll(context, SigninScreen());
    }
  }
}
