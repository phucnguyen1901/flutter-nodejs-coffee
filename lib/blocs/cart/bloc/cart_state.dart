part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoad extends CartState {
  final cart;

  CartLoad({this.cart});
  @override
  List<Object> get props => [cart];
}
