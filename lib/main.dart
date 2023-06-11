import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/auth/application/authprovider.dart';
import 'package:social_login/features/homescreen/application/homescreenProvider.dart';
import 'package:social_login/features/splash/application/splashprovider.dart';
import 'package:social_login/features/splash/presentation/splashscreen.dart';
import 'package:social_login/shared/providers/stateprovider.dart';
import 'package:social_login/shared/services/preference/preference.dart';
import 'features/Projects/application/Projectprovider.dart';
<<<<<<< HEAD
=======

>>>>>>> 61cbc9e (stash)
import 'features/user/application/userprovider.dart';
import 'shared/services/localization/localization.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<Authprovider>(
            create: (context) => Authprovider()),
        ChangeNotifierProvider<SplashProvider>(
            create: (context) => SplashProvider()),
        ChangeNotifierProvider<StateProvider>(
            create: (context) => StateProvider()),
        ChangeNotifierProvider<ProjectsProvider>(
            create: (context) => ProjectsProvider()),
        ChangeNotifierProvider<HomescreenProvider>(
            create: (context) => HomescreenProvider()),
        ChangeNotifierProvider<PollsProvider>(
            create: (context) => PollsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ""),
          Locale("ar", ""),
        ],
        locale: Locale("ar", ""),
        theme: ThemeData(
            //TODO : add your themes
            ),
        home: splashscreen(),
      ),
    );
  }
}
