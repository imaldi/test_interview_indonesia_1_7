import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<GetFirstButtonValueEvent>((event, emit) {
      emit(MainScreenLoading());
      String numberString = "";
      for(int i = 1; i <= event.number; i++){
        numberString += "$i ";
      }
      emit(MainScreenFirstButtonState(numberString));
    });

    on<GetSecondButtonValueEvent>((event, emit) {
      emit(MainScreenLoading());
      String numberString = "";
      for(int i = 1; i <= event.number; i++){
        numberString += "$i ";
      }
      for(int i = event.number - 1; i >=1; i--){
        numberString += "$i ";
      }
      emit(MainScreenSecondButtonState(numberString));
    });
    on<GetThirdButtonValueEvent>((event, emit) {
      emit(MainScreenLoading());
      String numberString = "";
      for(int i = 1; i <= event.number; i++){
        numberString += "$i${i - 1} ";
      }
      emit(MainScreenThirdButtonState(numberString));
    });

    on<GetFourthButtonValueEvent>((event, emit) {
      emit(MainScreenLoading());
      String numberString = "";
      for(int i = 1; i <= event.number; i++){
        if(i%5 != 0 && i%7 != 0)numberString += "$i ";
        if(i%5 == 0){
          numberString += "LIMA ";
        }
        if(i%7 == 0){
          numberString += "TUJUH ";
        }
      }
      emit(MainScreenFourthButtonState(numberString));
    });

  }
}
