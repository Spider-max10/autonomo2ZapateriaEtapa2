// services/shoe_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/shoe_model.dart';

class ShoeService {
  static final CollectionReference shoesCollection = FirebaseFirestore.instance.collection('shoes');

  static Future<List<Shoe>> getShoes() async {
    try {
      QuerySnapshot snapshot = await shoesCollection.get();
      return snapshot.docs.map((doc) => Shoe.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error getting shoes: $e');
      return [];
    }
  }

  static Future<void> addShoe(Shoe shoe) async {
    try {
      await shoesCollection.add({
        'name': shoe.name,
        'size': shoe.size,
        'marca': shoe.marca,
      });
    } catch (e) {
      print('Error adding shoe: $e');
    }
  }
}