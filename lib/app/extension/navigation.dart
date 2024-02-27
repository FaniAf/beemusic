import 'package:flutter/material.dart';

extension ExtendedNavigator on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (__) => page));
  }

  Future<dynamic> pushNamedReplacement(String routeName) async {
    Navigator.pushReplacementNamed(this, routeName);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String newRouteName, RoutePredicate predicate,
      {Object? arguments}) async {
    Navigator.pushNamedAndRemoveUntil(this, newRouteName, predicate,
        arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveAll(String newRouteName,
      {Object? arguments}) async {
    Navigator.pushNamedAndRemoveUntil(this, newRouteName, (route) => false,
        arguments: arguments);
  }

  void pop([result]) async {
    return Navigator.of(this).pop(result);
  }
}
