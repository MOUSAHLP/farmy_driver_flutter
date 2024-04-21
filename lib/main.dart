import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/all_orders_date/all_orders_date_cubit.dart';
import 'package:pharmy_driver/cubit/language/language_cubit.dart';
import 'package:pharmy_driver/cubit/language/language_states.dart';
import 'package:pharmy_driver/cubit/orders_history/orders_history_cubit.dart';
import 'package:pharmy_driver/cubit/transactions/transactions_cubit.dart';
import 'package:pharmy_driver/presentation/screens/main_screen/screen/main_screen.dart';
import 'package:pharmy_driver/presentation/screens/sign-in/sign_in_screen.dart';
import 'package:pharmy_driver/presentation/screens/splash_screen/splash_screen.dart';
import 'package:pharmy_driver/translations.dart';
import 'core/app_enum.dart';
import 'core/services/services_locator.dart';
import 'cubit/authentication_bloc/authentication_state.dart';
import 'cubit/authentication_bloc/authertication_bloc.dart';
import 'cubit/home/home_cubit.dart';
import 'data/data_resource/local_resource/data_store.dart';
import 'data/data_resource/remote_resource/api_handler/base_api_client.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await DataStore.instance.init();
  ServicesLocator().init();
  BaseApiClient();
  // DataStore.instance.deleteToken();
  // DataStore.instance.setToken(
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzExNTQxODgyLCJuYmYiOjE3MTE1NDE4ODIsImp0aSI6IkRkRURCNEgzdzZLV2IzV1AiLCJzdWIiOiIyIiwicHJ2IjoiOTE5YzMyNmQ0M2FiMTUxOWE4YmEzYjg1ODZiNjg3NTJlOGM4MzgwNyIsImVtYWlsIjoicGVha2xpMjNua0BnbWFpbC5jb20ifQ.loEU7WIyE2xl2yDalwfOW25qErJFVkgBhAUlPL64GG8");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => sl<HomeCubit>()),

        // Home screen
        BlocProvider(
          create: (BuildContext context) => sl<HomeCubit>(),
        ),

        // language screen
        BlocProvider(create: (BuildContext context) => LanguageCubit()),

        // Orders History screen
        BlocProvider(
            create: (BuildContext context) =>
                OrdersHistoryCubit()..getDriverOrdersHistory()),

        // Transactions screen
        BlocProvider(
            create: (BuildContext context) =>
                TransactionsCubit()..getDriverTransactions()),

        // all orders screen
        BlocProvider(
            create: (BuildContext context) =>
                AllOrdersDateCubit()..getDriverTransactions()),
        BlocProvider(
            create: (BuildContext context) => sl<AuthenticationBloc>()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: MediaQuery.of(context).size,
          builder: (context, child) =>
              BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, state) {
                    if (true) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      useMaterial3: true,
                    ),
                    locale: Locale(DataStore.instance.lang),
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        bloc: sl<AuthenticationBloc>()..AppStarted(),
                        builder: (context, state) {
                          switch (state.authenticationScreen) {
                            case AuthenticationScreenStates
                                  .authenticationAuthenticated:
                              return const MainScreen();
                            case AuthenticationScreenStates
                                  .authenticationUnauthenticated:
                              return const SignInScreen();

                            default:
                              return const SplashScreen();
                          }
                        }),
                  );
                }
              })),
    );
  }
}
