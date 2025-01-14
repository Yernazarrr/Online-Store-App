part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class ToggleFavorite extends ProductEvent {
  final Product product;

  ToggleFavorite(this.product);

  @override
  List<Object> get props => [product];
}
