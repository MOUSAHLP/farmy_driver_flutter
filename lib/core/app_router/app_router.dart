import 'dart:io';
import 'package:flutter/material.dart';
part 'route_transition.dart';

class AppRouter {
  static void push(BuildContext context, Widget child,
      {RouteTransitions? routeTransition}) {
    Navigator.push(
      context,
      RouteTransition(
        child: child,
        textDirection: Directionality.of(context),
        type: routeTransition ?? RouteTransitions.fade,
      ),
    );
  }

  static void pushReplacement(BuildContext context, Widget child,
      {RouteTransitions? routeTransition}) {
    Navigator.pushReplacement(
      context,
      RouteTransition(
        child: child,
        textDirection: Directionality.of(context),
        type: routeTransition ?? RouteTransitions.fade,
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushAndRemoveAllStack(BuildContext context, Widget child,
      {RouteTransitions? routeTransition}) {
    Navigator.of(context).pushAndRemoveUntil(
        RouteTransition(
          child: child,
          textDirection: Directionality.of(context),
          type: routeTransition ?? RouteTransitions.fade,
        ),
        (Route<dynamic> route) => false);
  }
}
