import 'package:get_it/get_it.dart';
import 'package:pharmy_driver/cubit/home_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerSingleton<HomeCubit>(HomeCubit());

  }
}
