import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';


abstract class DependencyInjection {
  static void initialize() {

    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('products');

    GetIt.instance.registerSingleton<CollectionReference>(collectionReference);
  }
}
