// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_novie_db/ui/widgets/auth/auth_model.dart';
import 'package:the_novie_db/ui/widgets/auth/auth_widget.dart';
import 'package:the_novie_db/ui/widgets/main%20screen/main_screen_widget.dart';
import 'package:the_novie_db/ui/widgets/movie/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details_widget';
}

class MainNavifation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    '/auth': (context) => AuthProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
    '/main_screen': (context) => const MainScreenWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = setting.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsWidget(movieId: movieId),
        );
      default:
        const widget = Text('Navigation error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}

// '/main_screen/series_details_widget': (context) {
// final arguments = ModalRoute.of(context)?.settings.arguments;
// if (arguments is int) {
// return SeriesDetailsWidget(seriesId: arguments);
// } else {
// return SeriesDetailsWidget(seriesId: 0);
// }
// },
