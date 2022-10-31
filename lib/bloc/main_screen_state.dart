part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

class MainScreenInitial extends MainScreenState {
  @override
  List<Object> get props => [];
}

class MainScreenLoading extends MainScreenState{
  @override
  List<Object?> get props => [];

}

class MainScreenFirstButtonState extends MainScreenState {
  String numberString;
  MainScreenFirstButtonState(this.numberString);
  @override
  List<Object?> get props => [numberString];
}

class MainScreenSecondButtonState extends MainScreenState {
  String numberString;
  MainScreenSecondButtonState(this.numberString);
  @override
  List<Object?> get props => [numberString];
}

class MainScreenThirdButtonState extends MainScreenState {
  String numberString;
  MainScreenThirdButtonState(this.numberString);
  @override
  List<Object?> get props => [numberString];
}

class MainScreenFourthButtonState extends MainScreenState {
  String numberString;
  MainScreenFourthButtonState(this.numberString);
  @override
  List<Object?> get props => [numberString];
}
