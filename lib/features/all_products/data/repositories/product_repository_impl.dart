import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../local_data_source/local_storage_service.dart';

class ProductRepositoryImpl implements ProductRepository {
  final LocalStorageService localStorageService;

  List<Product> _products = [
    Product(id: 1, name: 'Apple', price: 1.2),
    Product(id: 2, name: 'Banana', price: 0.8),
    Product(id: 3, name: 'Orange', price: 1.5),
    Product(id: 4, name: 'Grapes', price: 2.0),
  ];

  ProductRepositoryImpl({required this.localStorageService});

  Future<void> _initializeProducts() async {
    final storedProducts = await localStorageService.loadProducts();
    if (storedProducts.isEmpty) {
      _products = [
        Product(id: 1, name: 'Apple', price: 1.2),
        Product(id: 2, name: 'Banana', price: 0.8),
        Product(id: 3, name: 'Orange', price: 1.5),
        Product(id: 4, name: 'Grapes', price: 2.0),
      ];
      await localStorageService.saveProducts(_products);
    } else {
      _products = storedProducts;
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    await _initializeProducts();
    return _products;
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    await _initializeProducts();
    return _products.where((product) => product.isFavorite).toList();
  }

  @override
  Future<void> toggleFavorite(Product product) async {
    product.isFavorite = !product.isFavorite;
    await localStorageService.saveProducts(_products);
  }
}
