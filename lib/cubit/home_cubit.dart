import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  int currentIndex=0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeCubit() : super(InitialHomeState());

  changeIndex(int index){
    currentIndex=index;
    emit(ChangeIndexState());
  }

}