part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class GetFirstButtonValueEvent extends MainScreenEvent {
  int number;
  GetFirstButtonValueEvent(this.number);

  @override
  List<Object?> get props => [];
}

class GetSecondButtonValueEvent extends MainScreenEvent {
  int number;
  GetSecondButtonValueEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class GetThirdButtonValueEvent extends MainScreenEvent {
  int number;
  GetThirdButtonValueEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class GetFourthButtonValueEvent extends MainScreenEvent {
  int number;
  GetFourthButtonValueEvent(this.number);

  @override
  List<Object?> get props => [number];
}
