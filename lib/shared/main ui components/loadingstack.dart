import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import 'loadingindicator.dart';

class Loadingstack extends StatelessWidget {
  const Loadingstack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Container(
              color: blackcolor.withOpacity(0),
            ),
          ),
        ),
        new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: new LoadingIndicator()),
      ],
    );
  }
}
