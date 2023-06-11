import 'package:flutter/material.dart';
import 'package:social_login/shared/config/colors.dart';

import '../services/localization/localization.dart';

class Customtext extends StatelessWidget {
  const Customtext(
    this.text, {
    this.size = 16,
    this.fontWeight = FontWeight.w500,
    this.color = blackcolor,
    this.onelined = false,
    this.decoration,
    this.dontTranslate = false,
    this.isLtrDirection = false,
  });
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool onelined;
  final bool dontTranslate;
  final TextDecoration decoration;
  final bool isLtrDirection;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    String translate(String index) {
      return locale.get(index) ?? index;
    }

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: dontTranslate == true
          ? Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: size,
                fontFamily: "inter",
                fontWeight: fontWeight,
                decoration: decoration,
              ),
            )
          : locale.locale.languageCode == "ar"
              ? Text(
                  translate(text),
                  textDirection: isLtrDirection ? TextDirection.ltr : null,
                  style: TextStyle(
                    color: color,
                    fontSize: (size),
                    fontFamily: "inter",
                    fontWeight: fontWeight,
                    decoration: decoration,
                  ),
                )
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    translate(text),
                    style: TextStyle(
                      color: color,
                      fontSize: size,
                      fontFamily: "inter",
                      fontWeight: fontWeight,
                      decoration: decoration,
                    ),
                  )),
    );
  }
}

class EllipsisCustomtext extends StatelessWidget {
  const EllipsisCustomtext(this.text,
      {this.size = 16,
      this.fontWeight = FontWeight.w500,
      this.color = blackcolor,
      this.onelined = false,
      this.decoration,
      this.dontTranslate = false,
      this.isLtrDirection = false,
      this.maxlines = 1});
  final int maxlines;
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool onelined;
  final bool dontTranslate;
  final TextDecoration decoration;
  final bool isLtrDirection;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    String translate(String index) {
      return locale.get(index) ?? index;
    }

    return Text(
      translate(text),
      textDirection: isLtrDirection ? TextDirection.ltr : null,
      maxLines: maxlines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: (size),
        fontFamily: "inter",
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}

class Customnormaltext extends StatelessWidget {
  const Customnormaltext(this.text,
      {this.size = 16,
      this.fontWeight = FontWeight.w500,
      this.color = blackcolor,
      this.dontTranslate = false,
      this.onelined = false});
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool onelined;
  final bool dontTranslate;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    String translate(String index) {
      if (AppLocalizations.of(context).get(index) == null) {}
      return AppLocalizations.of(context).get(index) ?? index;
    }

    return dontTranslate == true
        ? FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              translate(text),
              style: TextStyle(
                color: color,
                fontSize: size,
                fontFamily: "inter",
                fontWeight: fontWeight,
              ),
            ))
        : locale.locale.languageCode == "ar"
            ? Text(
                translate(text),
                style: TextStyle(
                  color: color,
                  fontSize: (size + 1),
                  fontFamily: "inter",
                  fontWeight: fontWeight,
                ),
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  translate(text),
                  style: TextStyle(
                    color: color,
                    fontSize: size,
                    fontFamily: "inter",
                    fontWeight: fontWeight,
                  ),
                ));
  }
}

class Normaltext extends StatelessWidget {
  const Normaltext(
    this.text, {
    this.size = 16,
    this.fontWeight = FontWeight.w500,
    this.color = blackcolor,
  });
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    String translate(String index) {
      if (AppLocalizations.of(context).get(index) == null) {
        print("not found");
      }
      return AppLocalizations.of(context).get(index) ?? index;
    }

    return Text(
      translate(text),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: "inter",
        fontWeight: fontWeight,
      ),
    );
  }
}
