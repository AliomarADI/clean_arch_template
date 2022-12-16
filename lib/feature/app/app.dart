import 'package:clean_arch_template/core/injection/configurator.dart';
import 'package:clean_arch_template/core/utils/navigation_service.dart';
import 'package:clean_arch_template/feature/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:clean_arch_template/feature/app/bloc/global_bloc_provider.dart';
import 'package:clean_arch_template/feature/onboarding/onboarding.dart';
import 'package:clean_arch_template/feature/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Factor IO',
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        onGenerateRoute: onGenerateRoute,
        locale: context.locale,
        home: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // if (state is Authorized || state is Unauthorized) {
            //   // removing splash screen
            //   FlutterNativeSplash.remove();
            // }
          },
          builder: (context, state) {
            return const OnboardingScreen();
          },
        ),
      ),
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return CupertinoPageRoute(
            builder: (_) => const OnboardingScreen(), settings: settings);

      default:
        return CupertinoPageRoute(
            builder: (_) => const OnboardingScreen(), settings: settings);
    }
  }
}
