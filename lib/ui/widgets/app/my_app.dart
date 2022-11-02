import 'package:flutter/material.dart';
import 'package:the_novie_db/ui/Theme/app_colors,dart.dart';
import 'package:the_novie_db/ui/navigation/main_navigation.dart';
import 'package:the_novie_db/ui/widgets/app/my_app_model.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavifation();
  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainDarkBlue,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarkBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(false),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}