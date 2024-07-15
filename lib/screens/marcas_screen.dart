import 'package:flutter/material.dart';
import '../models/marca_model.dart'; 
import '../services/marca_service.dart'; 

class MarcasScreen extends StatefulWidget {
  @override
  _MarcaListScreenState createState() => _MarcaListScreenState();
}

class _MarcaListScreenState extends State<MarcasScreen> {
  List<Marca> marcas = [];

  @override
  void initState() {
    super.initState();
    loadMarcas();
  }

  void loadMarcas() async {
    List<Marca> fetchedMarcas = await MarcaService.getMarcas();
    setState(() {
      marcas = fetchedMarcas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Marcas'),
      ),
      body: ListView.builder(
        itemCount: marcas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(marcas[index].name),
            subtitle: Text(marcas[index].descripcion),
            trailing: Icon(Icons.business),
            onTap: () {
              print('Marca seleccionada: ${marcas[index].name}');
            },
          );
        },
      ),
    );
  }
}
