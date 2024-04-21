import 'package:flutter/cupertino.dart';

enum AuthenticationScreenStates {
  authenticationLoggedOut,
  authenticationAuthenticated,
  authenticationUnauthenticated,
  authenticationInitialized,
  authenticationEnd,
  authenticationGuest
}

enum DataType { api, cache }

enum ScreenState { initialized, loading, success, error }

final navigatorKey = GlobalKey<NavigatorState>();


enum PaymentStates { cashPayment, farmyWallet }

const String mapKey = "AIzaSyAX8XoECKD0-gnAaah67gR4akbUodB_8Ww";

enum ScreensAuth {
  signInScreen,
  phoneNumberScreen,
  otpConfirmationScreen,
  resetPasswordScreen
}

enum AddToBasketState { successAddedToBasket }

enum OrdersHistoryEnums { weekly, monthly }

String getType(OrdersHistoryEnums type) {
  if (type == OrdersHistoryEnums.monthly) {
    return "monthly";
  }
  return "weekly";
}
