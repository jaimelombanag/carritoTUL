import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:tulshop/src/dish_controller.dart';
import 'package:tulshop/src/get.dart';
import 'package:tulshop/src/home_controller.dart';
import 'package:tulshop/src/widgets/add_to_cart_button.dart';


class DishPage extends StatelessWidget {
  const DishPage({Key key}) : super(key: key);

  void _setStatusBar(bool light) {
    SystemChrome.setSystemUIOverlayStyle(light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final homeController = Get.i.find<HomeController>();
        final DishPageArguments args = ModalRoute.of(context).settings.arguments;
        final isFavorite = homeController.isFavorite(args.dish);
        final controller = DishController(args, isFavorite);
        _setStatusBar(true);
        controller.onDispose = () => _setStatusBar(false);
         return controller;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: AddToCartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //DishHeader(),
                //DishDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
