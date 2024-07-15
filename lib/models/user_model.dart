import 'package:firebase_auth/firebase_auth.dart';


class User {
  String uid; // Identificador único del usuario en Firebase Authentication
  String name;
  String correo;

  User({required this.uid, required this.name, required this.correo});

  factory User.fromFirebase(UserCredential userCredential) {
    return User(
      uid: userCredential.user!.uid,
      name: userCredential.user!.displayName ?? '',
      correo: userCredential.user!.email ?? '',
    );
  }
}
