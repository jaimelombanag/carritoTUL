

import 'package:get_it/get_it.dart';
import 'package:tulshop/src/food_menu_provider.dart';
import 'package:tulshop/src/food_menu_repository.dart';
import 'package:tulshop/src/food_menu_repository_impl.dart';

abstract class DependencyInjection {
  static void initialize() {
    
    final FoodMenuRepositoryImpl foodMenuRepository = FoodMenuRepositoryImpl(
      FoodMenuProvider(),
    );


    GetIt.instance.registerSingleton<FoodMenuRepository>(foodMenuRepository);
  
  }
}
