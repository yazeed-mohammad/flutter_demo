import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/core/configurations/service_locator.dart';
import 'package:demo_app/core/navigation/navigation_service.dart';
import 'package:demo_app/screens/loginPage/ui/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ServiceLocator().setup();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: const Locale("en"),
      color: white,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
        primarySwatch: Colors.red,
        // fontFamily: 'Tajawal',
        scaffoldBackgroundColor: white,
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          elevation: 0,
          iconTheme: IconThemeData(color: black),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const LoginPage(),
    );
  }
}
