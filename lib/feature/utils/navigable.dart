import 'package:flutter/material.dart';

abstract class Navigable extends Widget {
  const Navigable({Key? key}) : super(key: key);

  String getName();
}
