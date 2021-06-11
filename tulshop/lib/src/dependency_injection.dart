

import 'package:get_it/get_it.dart';
import 'package:tulshop/src/repository/tul_menu_repository.dart';
import 'package:tulshop/src/repository/tul_menu_repository_impl.dart';
import 'package:tulshop/src/tul_menu_provider.dart';


abstract class DependencyInjection {
  static void initialize() {
    
    final TulMenuRepositoryImpl foodMenuRepository = TulMenuRepositoryImpl(
      TulMenuProvider(),
    );


    GetIt.instance.registerSingleton<TulMenuRepository>(foodMenuRepository);
  
  }
}
