import 'package:cloud_firestore/cloud_firestore.dart';

class Shoe {
  String id;
  String name;
  String size;
  DocumentReference marca;

  Shoe({required this.id, required this.name, required this.size, required this.marca});

  // Método para crear instancias desde documentos de Firestore
  factory Shoe.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    if (data == null) {
      throw StateError('Missing data for ShoeId: ${doc.id}');
    }

    return Shoe(
      id: doc.id,
      name: data['name'] ?? 'Unknown',
      size: data['size'] ?? 'Unknown',
      marca: data['marca'] as DocumentReference,
    );
  }
}