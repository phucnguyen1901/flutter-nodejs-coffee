part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MenuLoad extends MenuEvent {}
