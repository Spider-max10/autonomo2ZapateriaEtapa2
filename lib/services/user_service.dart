import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para registrar un usuario con email y contraseña
  static Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error al registrar usuario: $e');
      return null;
    }
  }

  // Método para autenticar un usuario con email y contraseña
  static Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error al autenticar usuario: $e');
      return null;
    }
  }

  // Método para cerrar sesión del usuario
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // Método para obtener el usuario actualmente autenticado
  static User? getCurrentUser() {
    User? currentUser = _auth.currentUser;
    return currentUser;
  }
}
