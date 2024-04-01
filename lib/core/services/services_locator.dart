import 'package:get_it/get_it.dart';
import 'package:pharmy_driver/cubit/home/home_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => HomeCubit());
  }
}
