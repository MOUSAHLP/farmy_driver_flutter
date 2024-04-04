import 'package:get_it/get_it.dart';
import 'package:pharmy_driver/cubit/home/home_cubit.dart';

import '../../cubit/about/about_bloc.dart';
import '../../cubit/authentication_bloc/authertication_bloc.dart';
import '../../cubit/conditions_bloc/conditions_bloc.dart';
import '../../cubit/contact_us/contact_us_bloc.dart';
import '../../cubit/faq/faq_bloc.dart';
import '../../cubit/order/order_cubit.dart';
import '../../cubit/privacy_bloc/privacy_bloc.dart';
import '../../cubit/profile/pofile_bloc.dart';
import '../../data/repository/user_repository.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(()=>HomeCubit());
    sl.registerFactory(()=>OrderCubit());

    sl.registerLazySingleton<UserRepository>(() => UserRepository());
    sl.registerLazySingleton(() => AuthenticationBloc(sl()));

    ///profile
    sl.registerFactory(() => ProfileBloc());

    /// Contact Us
    sl.registerFactory(() => ContactUsBloc());

    /// Privacy Policy Screen
    sl.registerFactory(() => PrivacyBloc());

    /// FAQ Screen
    sl.registerFactory(() => FaqBloc());

    /// Conditions Screen
    sl.registerFactory(() => ConditionsBloc());
    sl.registerFactory(() => AboutBloc());
  }
}
