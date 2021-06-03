part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class UpdateCartEvent extends CartEvent {
  final newCart;

  UpdateCartEvent({this.newCart});
}
