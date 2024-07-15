import 'package:flutter/material.dart';
import '../models/shoe_model.dart';
import '../services/shoe_service.dart';
import '../services/marca_service.dart';
import '../models/marca_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShoesScreen extends StatefulWidget {
  @override
  _ShoesScreenState createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  List<Shoe> shoes = [];
  Map<String, String> marcas = {}; // Almacenar nombres de marcas con su ID

  @override
  void initState() {
    super.initState();
    loadShoes();
  }

  void loadShoes() async {
    List<Shoe> fetchedShoes = await ShoeService.getShoes();
    for (var shoe in fetchedShoes) {
      DocumentSnapshot marcaDoc = await shoe.marca.get();
      setState(() {
        marcas[shoe.marca.id] = marcaDoc['name'];
      });
    }
    setState(() {
      shoes = fetchedShoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Zapatos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoes.length,
              itemBuilder: (context, index) {
                String marcaId = shoes[index].marca.id;
                String marcaName = marcas[marcaId] ?? 'Desconocida';

                return ListTile(
                  title: Text(shoes[index].name),
                  subtitle: Text('Tamaño: ${shoes[index].size}, Marca: $marcaName'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    print('Zapato seleccionado: ${shoes[index].name}');
                    // Navigator.pushNamed(context, '/marcas');
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/marcas');
            },
            child: Text('Ver Marcas'),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
