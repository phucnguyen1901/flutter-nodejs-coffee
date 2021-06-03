part of 'menu_bloc.dart';

@immutable
abstract class MenuState extends Equatable {
  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {
  // List<MenuModel> menu;
  // @override
  // // TODO: implement props
  // List<Object> get props => [menu];
}

class MenuLoading extends MenuState {}

// ignore: must_be_immutable
class MenuLoaded extends MenuState {
  List<MenuModel> menu;
  MenuLoaded({this.menu});
  @override
  List<Object> get props => [menu];
}

class MenuLoadError extends MenuState {}
