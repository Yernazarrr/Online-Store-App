import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();

  Future<List<Product>> getFavoriteProducts();

  Future<void> toggleFavorite(Product product);
}
