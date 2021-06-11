import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tulshop/src/home_init_controller.dart';
import 'package:tulshop/src/models/dish.dart';
import 'package:tulshop/src/widgets/horizontal_dishes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeInitController>(
      create: (_) {
        final controller = HomeInitController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello, Darwin"),
                        Text(
                          "Lorem ipsum dolor sit amet",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      final List<Dish> popularMenu =
                          context.select<HomeInitController, List<Dish>>(
                        (_) => _.popularMenu,
                      );
                      return HorizontalDishes(
                        dishes: popularMenu,
                        title: "Materiales disponibles",
                        onViewAll: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
