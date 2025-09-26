import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _productsCollection = 'products';

  Future<void> insertProduct(Product product) async {
    await _db
        .collection(_productsCollection)
        .doc(product.id) // Assuming you want to use the product's ID
        .set(product.toFirestore());
  }

  Stream<List<Product>> getProducts() {
    return _db.collection(_productsCollection).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  Future<void> updateProduct(Product product) async {
    await _db
        .collection(_productsCollection)
        .doc(product.id)
        .update(product.toFirestore());
  }

  Future<void> deleteProduct(String productId) async {
    await _db.collection(_productsCollection).doc(productId).delete();
  }
}
