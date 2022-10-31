import 'package:flutter/material.dart';
import 'package:the_novie_db/ui/Theme/app_colors,dart.dart';
import 'package:the_novie_db/ui/navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavifation();
  const MyApp({super.key});

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
