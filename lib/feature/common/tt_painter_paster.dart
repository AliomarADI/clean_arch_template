import 'package:flutter/material.dart';

class TTPainterPaster extends StatelessWidget {
  final CustomPainter painter;

  const TTPainterPaster({
    Key? key,
    required this.painter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(28.0, 28.0),
      painter: painter,
    );
  }
}
