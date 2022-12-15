import 'package:flutter/material.dart';

import 'tt_colors.dart';

class TTAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final Color titleColor;
  final Widget? leading;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  const TTAppBar({
    Key? key,
    this.color = Colors.transparent,
    this.titleColor = TTColors.blackSecondary,
    this.leading,
    this.title,
    this.centerTitle = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 64,
      elevation: 0,
      backgroundColor: color,
      centerTitle: centerTitle,
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: TTColors.blackSecondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      title: title == null
          ? null
          : Text(
              title!,
              style: TextStyle(
                color: titleColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
