// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/shoe_model.dart';

// FirebaseFirestore db = FirebaseFirestore.instance;

// Future<List<Shoe>> getShoes() async {
//   List<Shoe> shoes = [];

//   CollectionReference collectionReferenceShoes = db.collection('shoes');

//   QuerySnapshot queryShoes = await collectionReferenceShoes.get();

//   queryShoes.docs.forEach((documento) {
//     shoes.add(Shoe.fromMap(documento.data() as Map<String, dynamic>));
//   });

//   return shoes;
// }
