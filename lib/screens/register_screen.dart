import 'package:flutter/material.dart';
import '../services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitData(BuildContext context) async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return;
    }

    // Llamar al método de registro de UserService
    var user = await UserService.registerWithEmailAndPassword(email, password);

    if (user != null) {
      // Registro exitoso, navegar a la pantalla de inicio de sesión
      Navigator.pushNamed(context, '/login');
    } else {
      // Error en el registro, mostrar mensaje de error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('No se pudo registrar el usuario'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }

    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitData(context);
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
