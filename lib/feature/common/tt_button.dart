import 'package:flutter/material.dart';

import 'tt_colors.dart';

enum TTButtonType { primary, tertiary }

class TTButton extends StatelessWidget {
  final String text;
  final TTButtonType type;
  final Widget? icon;
  final bool isIconEnabled;
  final bool isShadowEnabled;
  final Function() onTap;

  const TTButton({
    Key? key,
    required this.text,
    this.type = TTButtonType.primary,
    this.isIconEnabled = false,
    this.icon,
    this.isShadowEnabled = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isShadowEnabled ? 3.0 : 0.0,
      shadowColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: MaterialButton(
        elevation: 0,
        height: 56.0,
        color: backgroundColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        onPressed: onTap,
        child: child,
      ),
    );
  }

  Widget get child {
    final textWidget = Text(
      text,
      style: const TextStyle(
        fontFamily: 'Factor IO',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: TTColors.white,
      ),
    );

    if (isIconEnabled && icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 8.0),
          textWidget,
        ],
      );
    } else {
      return textWidget;
    }
  }

  Color get backgroundColor {
    switch (type) {
      case TTButtonType.primary:
        return TTColors.secondary;
      case TTButtonType.tertiary:
        return TTColors.greyLight;
      default:
        return TTColors.secondary;
    }
  }
}
