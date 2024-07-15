import 'package:cloud_firestore/cloud_firestore.dart';

class Marca {
  String id;
  String name;
  String descripcion;


  Marca({required this.id, required this.name, required this.descripcion});

  factory Marca.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Marca(
      id: doc.id,
      name: data['name'] ?? 'Unknown',
      descripcion: data['descripcion'] ?? 'No description',

    );
  }
}
