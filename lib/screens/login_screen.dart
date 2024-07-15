import 'package:flutter/material.dart';
import '../services/user_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Llamar al método de autenticación de UserService
    var user = await UserService.signInWithEmailAndPassword(email, password);

    if (user != null) {
      // Credenciales correctas, navegar a la pantalla de zapatos
      Navigator.pushNamed(context, '/shoes');
    } else {
      // Credenciales incorrectas, mostrar mensaje de error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('Correo electrónico o contraseña incorrectos'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
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
                _login(context);
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Registrarse'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Configuración'),
            ),
          ],
        ),
      ),
    );
  }
}
