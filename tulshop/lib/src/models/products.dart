import 'package:meta/meta.dart' show required;

class Products {
  final int id;
  final String nombre, sku, descripcion, costo, image;
  final int counter;

  Products({
    @required this.id,
    @required this.nombre,
    @required this.sku,
    @required this.descripcion,
    @required this.costo,
    @required this.image,
    this.counter = 0,
  });

  Products updateCounter(int counter) {
    return Products(
      id: this.id,
      nombre: this.nombre,
      sku: this.sku,
      descripcion: this.descripcion,
      costo: this.costo,
      image: this.image,
      counter: counter,
    );
  }
}
