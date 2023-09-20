import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBoxTheme extends StatelessWidget {
  final Widget child;
  const GlassBoxTheme({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          // blur Effect
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaY: 2,
                sigmaX: 2
            ),
            child: Container(),
          ),
          child
        ]
    );
  }
}
