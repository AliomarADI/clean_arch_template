import 'package:clean_arch_template/feature/utils/navigable.dart';
import 'package:clean_arch_template/feature/utils/routes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget implements Navigable {
  const OnboardingScreen({super.key});

  @override
  String getName() => Routes.onboarding;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
