import 'dart:io';

import 'package:flutter/material.dart';

import 'tt_colors.dart';

class TTSwitch extends StatelessWidget {
  final bool isEnabled;
  final Function(bool) onChanged;

  const TTSwitch({
    Key? key,
    required this.isEnabled,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: Platform.isIOS ? .7 : 1,
      child: Switch.adaptive(
        activeColor: TTColors.primary,
        inactiveTrackColor: TTColors.greyIcons,
        value: isEnabled,
        onChanged: onChanged,
      ),
    );
  }
}
