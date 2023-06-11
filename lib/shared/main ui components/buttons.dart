import 'package:flutter/material.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/loadingindicator.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import '../config/colors.dart';
import '../utils/uiutils.dart';

class customButton extends StatelessWidget {
  const customButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    @required this.width,
    @required this.highet,
    this.buttoncolor,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;
  final double width, highet;
  final Color buttoncolor;

  @override
  Widget build(BuildContext context) {
    return Relativecontainer(
      width,
      highet,
      allraduis: 5,
      color: buttoncolor ?? accentcolor,
      child: TextButton(onPressed: onPressed, child: child),
    );
  }
}

class LongAccentButton extends StatelessWidget {
  const LongAccentButton({
    Key key,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Relativecontainer(
      342,
      45,
      color: accentcolor,
      child: TextButton(onPressed: onPressed, child: child),
    );
  }
}

class AnimatedAccentButton extends StatelessWidget {
  const AnimatedAccentButton({
    Key key,
    @required this.onpressed,
    this.tittle,
    this.thatcontext,
  }) : super(key: key);

  final Function(BuildContext context) onpressed;
  final String tittle;
  final BuildContext thatcontext;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 20),
      curve: Curves.easeIn,
      child: UI.checkBusy(thatcontext ?? context)
          ? Relativecontainer(
              150,
              50,
              allraduis: 8,
              color: accentcolor,
              child: const LoadingIndicator(
                size: 30,
              ),
            )
          : Relativecontainer(
              342,
              50,
              allraduis: 8,
              color: accentcolor,
              child: TextButton(
                onPressed: () => onpressed(context),
                child: Normaltext(
                  tittle ?? "Click Here",
                  color: backgroundcolor,
                  size: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
    );
  }
}
