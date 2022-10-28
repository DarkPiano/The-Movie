import 'package:flutter/material.dart';
import 'package:the_novie_db/ui/Theme/app_colors,dart.dart';
import 'package:the_novie_db/ui/widgets/auth/auth_model.dart';
import 'package:the_novie_db/ui/widgets/auth/auth_widget.dart';
import 'package:the_novie_db/ui/widgets/main%20screen/main_screen_widget.dart';
import 'package:the_novie_db/ui/widgets/movie/movie_details/movie_details_widget.dart';
import 'package:the_novie_db/ui/widgets/series/series_details/series_details_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
      routes: {
        '/auth': (context) => AuthProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details_widget': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          // final id =ModalRoute.of(context)?.settings.arguments as int;
          if(arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        },
        '/main_screen/series_details_widget': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if(arguments is int) {
            return SeriesDetailsWidget(seriesId: arguments);
          } else {
            return SeriesDetailsWidget(seriesId: 0);
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}
