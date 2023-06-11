import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:social_login/shared/utils/uiutils.dart';
// import 'package:twitter_login/twitter_login.dart';

class GoogleLogin {
  Future<GoogleSignInAccount> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser?.authentication;

      Logger().d(googleAuth.accessToken);
      Logger().d(googleUser.email);
      Logger().d(googleUser.displayName);
      return googleUser;
    } catch (e) {
      UI.catchlogger(e);
    }
  }
}

class FacebookLogin {
  Future signInWithFacebook() async {
    await FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance.login();
    // getting the profile
    final graphResponse = await get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken.token}'));

    final profile = jsonDecode(graphResponse.body);

    if (result.status == LoginStatus.success) {
      Logger().d(profile);
      try {} catch (e) {
        switch (e.code) {
        }
      }
    } else {}
  }
}

class TwitterLoggin {
  // final twitterLogin = TwitterLogin(
  //     apiKey: "mOiXG9ytw6PAsVXZQfZRPv92P",
  //     apiSecretKey: "6lh5IwwrWaiAPGg6jwlGeIse99fc3vasRjkZCE214b13mF3njd",
  //     redirectURI: "socail_login://");

  // Future signInWithTwitter() async {
  //   final authResult = await twitterLogin.loginV2();
  //   if (authResult.status == TwitterLoginStatus.loggedIn) {
  //     try {
  //       final userDetails = authResult.user;

  //       // save all the data

  //     } catch (e) {}
  //   } else {}
  // }
}
