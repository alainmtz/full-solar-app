import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProducts() {
    return _db.collection('products').snapshots();
  }

  // Future<void> addProduct(String name, double price) {
  //   return _db.collection('products').add({
  //     'name': name,
  //     'price': price,
  //   });
  // }
}
