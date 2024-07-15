import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/marca_model.dart';

class MarcaService {
  static final CollectionReference marcasCollection = FirebaseFirestore.instance.collection('marcas');

  static Future<List<Marca>> getMarcas() async {
    try {
      QuerySnapshot snapshot = await marcasCollection.get();
      return snapshot.docs.map((doc) => Marca.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error getting marcas: $e');
      return [];
    }
  }

  static Future<void> addMarca(Marca marca) async {
    try {
      await marcasCollection.add({
        'name': marca.name,
        'descripcion': marca.descripcion,
      });
    } catch (e) {
      print('Error adding marca: $e');
    }
  }
}
