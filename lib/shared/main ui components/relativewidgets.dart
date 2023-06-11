import 'package:flutter/material.dart';
import 'package:social_login/shared/config/colors.dart';
import '../config/mediaqueryconfig.dart';

class Relativecontainer extends StatelessWidget {
  Relativecontainer(this.width, this.height,
      {this.color = Colors.transparent,
      this.child,
      this.shadow = false,
      this.borderd = false,
      this.allraduis,
      this.borderRadius});
  final double height, width;
  final Color color;
  final Widget child;
  final bool shadow;
  final bool borderd;
  final double allraduis;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: borderRadius == null
              ? allraduis == null
                  ? BorderRadius.zero
                  : BorderRadius.circular(allraduis)
              : borderRadius,
          color: color,
          border: borderd ? Border.all(color: bordercolor) : null,
          boxShadow: shadow
              ? [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ]
              : []),
      width: config.widthr(width, context),
      height: config.hieghtr(height, context),
      child: child ?? null,
    );
  }
}

class OnlywidthRelativecontainer extends StatelessWidget {
  OnlywidthRelativecontainer(this.width,
      {this.color = Colors.transparent,
      this.child,
      this.shadow = false,
      this.borderd = false,
      this.raduis});
  final double width;
  final Color color;
  final Widget child;
  final bool shadow;
  final bool borderd;
  final int raduis;
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              raduis == null ? null : BorderRadius.circular(raduis.toDouble()),
          color: color,
          border: borderd ? Border.all(color: bordercolor) : null,
          boxShadow: shadow
              ? [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ]
              : []),
      width: config.widthr(width, context),
      child: child ?? null,
    );
  }
}

class OnlyhightRelativecontainer extends StatelessWidget {
  OnlyhightRelativecontainer(this.height,
      {this.color = Colors.transparent,
      this.child,
      this.shadow = false,
      this.borderd = false,
      this.raduis});
  final double height;
  final Color color;
  final Widget child;
  final bool shadow;
  final bool borderd;
  final int raduis;
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: raduis == null ? null : BorderRadius.circular(5),
          color: color,
          border: borderd ? Border.all(color: bordercolor) : null,
          boxShadow: shadow
              ? [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ]
              : []),
      height: config.hieghtr(height, context),
      child: child ?? null,
    );
  }
}
