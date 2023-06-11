import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/auth/presentation/Signinscreen.dart';
import 'package:social_login/features/splash/application/splashprovider.dart';
import 'package:social_login/shared/main%20ui%20components/loadingindicator.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacity;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashProvider>(context, listen: false)
          .checkforlogging(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/splash_background.png"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("asset/images/vg_logo.png"),
            LoadingIndicator(
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
