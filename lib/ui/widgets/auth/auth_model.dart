import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:the_novie_db/domain/api_client/api_client.dart';
import 'package:the_novie_db/domain/data_providers/session_data_provider.dart';
import 'package:the_novie_db/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Fill in your username and password';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      final sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage = 'Server not available check your internet connection';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = 'Wrong username and password';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = 'An error has occurred, please try again :)';
          break;
      }
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Unknown error, please try again';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    unawaited(
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainScreen),
    );
  }
}

// class AuthProvider extends InheritedNotifier {
//   final AuthModel model;
//
//   const AuthProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//     key: key,
//     notifier: model,
//     child: child,
//   );
//
//   static AuthProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }
//
//   static AuthProvider? read(BuildContext context) {
//     final widget =
//         context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
//     return widget is AuthProvider ? widget : null;
//   }
// }
