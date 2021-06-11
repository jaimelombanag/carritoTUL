import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tulshop/src/dish_controller.dart';
import 'package:tulshop/src/dish_page.dart';
import 'package:tulshop/src/models/dish.dart';
import 'package:tulshop/src/my_cart_controller.dart';
import 'package:provider/provider.dart';

class DishHomeItem extends StatelessWidget {
  const DishHomeItem({
    Key key,
    @required this.item,
    @required this.isFirst,
  }) : super(key: key);

  final bool isFirst;

  final Dish item;

  String get tag => "${this.key.toString()}-${item.id}";

  void _goToDetail(BuildContext context) {
    print("💞💞💞💞    ${item.name}");
    final int counter =
        context.read<MyCartController>().getDishCounter(this.item);
    final Dish dish = item.updateCounter(counter);

    Navigator.pushNamed(
      context,
      "/dish",
      arguments: DishPageArguments(tag: this.tag, dish: dish),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10)
            .copyWith(left: isFirst ? 15 : 10),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              Hero(
                tag: this.tag,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: item.photo,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -1,
                child: Container(
                  padding: EdgeInsets.all(10).copyWith(top: 50),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.9),
                        Colors.white,
                      ],
                      stops: [
                        0.1,
                        0.2,
                        0.3,
                        0.5,
                        1,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "\$",
                              style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                              children: [
                                TextSpan(
                                  text: " ${item.price}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 7)
                                .copyWith(left: 4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  "${item.rate}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          onPressed: () => _goToDetail(context),
        ),
      ),
    );
  }
}
