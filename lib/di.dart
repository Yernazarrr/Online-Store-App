import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/all_products/data/local_data_source/local_storage_service.dart';
import 'features/all_products/data/repositories/product_repository_impl.dart';
import 'features/all_products/domain/repositories/product_repository.dart';
import 'features/all_products/presentation/bloc/product_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerSingleton<LocalStorageService>(
      LocalStorageService(sharedPreferences));

  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(localStorageService: getIt<LocalStorageService>()),
  );

  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(getIt<ProductRepository>()),
  );
}
