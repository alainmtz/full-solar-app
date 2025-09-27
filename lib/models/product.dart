import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.stock,
  });

  // Factory constructor to create a Product from a Firestore document
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id, // Use the document ID from Firestore
      name: data['nombre'] ?? '', // Handle potential nulls
      description: data['descripcion'] ?? '',
      price: (data['precio'] as num?)?.toDouble() ?? 0.0,
      imageUrl: data['imagen'] as String?,
      stock: (data['stock'] as int?) ?? 0,
    );
  }

  // Method to convert a Product instance to a Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'nombre': name,
      'descripcion': description,
      'precio': price,
      'imagen': imageUrl,
      'stock': stock,
    };
  }
}
