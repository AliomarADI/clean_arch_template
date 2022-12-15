import 'package:flutter/material.dart';

class TTBoxShadow {
  final Color shadowColor;

  const TTBoxShadow({required this.shadowColor});

  List<BoxShadow> get getDefaultBoxShadows => [
        BoxShadow(
          color: shadowColor.withOpacity(.12),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 4), // changes position of shadow
        ),
        BoxShadow(
          color: shadowColor.withOpacity(.32),
          spreadRadius: 0,
          blurRadius: 2,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ];
}
