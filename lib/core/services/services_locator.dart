import 'package:get_it/get_it.dart';
import 'package:pharmy_driver/cubit/home/home_cubit.dart';

import '../../cubit/authentication_bloc/authertication_bloc.dart';
import '../../cubit/order/order_cubit.dart';
import '../../data/repository/user_repository.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(()=>HomeCubit());
    sl.registerFactory(()=>OrderCubit());

    sl.registerLazySingleton<UserRepository>(() => UserRepository());
    sl.registerLazySingleton(() => AuthenticationBloc(sl()));
  }
}
