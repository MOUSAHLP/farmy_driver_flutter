import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/screens/main_screen/screen/main_screen.dart';
import 'package:pharmy_driver/translations.dart';
import 'core/services/services_locator.dart';
import 'cubit/home/home_cubit.dart';
import 'data/data_resource/local_resource/data_store.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DataStore.instance.init();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => sl<HomeCubit>()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: const Size(100, 100),
            builder: (context, child) =>  MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
              home: const MainScreen(),
        ),
      ),
    );
  }
}