import 'package:flutter/material.dart';

import '../config/colors.dart';

class LoadingIndicator extends StatelessWidget {
  final String text;
  final double size;
  const LoadingIndicator({Key key, this.text, this.size = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: size,
          height: size,
          child: Theme(
              data: ThemeData(accentColor: backgroundcolor),
              child: const CircularProgressIndicator(
                color: backgroundcolor,
                strokeWidth: 5,
              ))),
    );
  }
}
