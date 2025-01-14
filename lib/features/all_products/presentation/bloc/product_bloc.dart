import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      final products = await repository.getAllProducts();
      emit(ProductLoaded(products));
    });

    on<ToggleFavorite>((event, emit) async {
      repository.toggleFavorite(event.product);
      final products = await repository.getAllProducts();
      emit(ProductLoaded(products));
    });
  }
}
