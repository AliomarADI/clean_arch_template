import 'package:clean_arch_template/core/injection/configurator.dart';
import 'package:clean_arch_template/feature/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // localization entry point
  await EasyLocalization.ensureInitialized();

  // dependency injection entry point
  configureDependencies();

  // set landscape orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      child: const App(),
    ),
  );
}
