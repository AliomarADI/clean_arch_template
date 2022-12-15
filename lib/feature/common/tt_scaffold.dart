import 'package:clean_arch_template/feature/common/tt_app_bar.dart';
import 'package:flutter/material.dart';

enum TTScaffoldPaddingSize { L, M }

class TTScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? color;
  final FloatingActionButton? floatingActionButton;
  final TTScaffoldPaddingSize paddingSize;

  const TTScaffold({
    Key? key,
    this.appBar,
    this.color,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.paddingSize = TTScaffoldPaddingSize.L,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: appBar ?? const TTAppBar(),
      body: Container(
        padding: padding,
        child: body,
      ),
      floatingActionButton: floatingActionButton == null
          ? null
          : SafeArea(child: floatingActionButton!),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bottomNavigationBar,
      ),
    );
  }

  EdgeInsetsGeometry get padding {
    switch (paddingSize) {
      case TTScaffoldPaddingSize.L:
        return const EdgeInsets.all(16.0);
      case TTScaffoldPaddingSize.M:
        return const EdgeInsets.all(8.0);
      default:
        return const EdgeInsets.all(16.0);
    }
  }
}
