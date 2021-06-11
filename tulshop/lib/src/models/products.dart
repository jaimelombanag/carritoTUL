import 'package:meta/meta.dart' show required;

class Products {
  final int id;
  final String name, photo, description;
  final double price, rate;
  final int counter;

  Products({
    @required this.id,
    @required this.name,
    @required this.photo,
    @required this.price,
    @required this.rate,
    @required this.description,
    this.counter = 0,
  });

  Products updateCounter(int counter) {
    return Products(
      id: this.id,
      name: this.name,
      photo: this.photo,
      price: this.price,
      rate: this.rate,
      description: this.description,
      counter: counter,
    );
  }
}
