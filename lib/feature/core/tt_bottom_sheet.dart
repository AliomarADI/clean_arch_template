import 'package:clean_arch_template/feature/common/tt_colors.dart';
import 'package:flutter/material.dart';

class TTBottomSheet extends StatelessWidget {
  final Widget content;
  const TTBottomSheet({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 30),
      decoration: const BoxDecoration(
        color: TTColors.bgVoilet,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(19, 9, 49, 0.12),
            spreadRadius: 0,
            blurRadius: 24,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48.0,
            height: 4.0,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(19, 9, 49, .08),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          content,
        ],
      ),
    );
  }
}
