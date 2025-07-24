import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw AuthException(code: 'user-not-found');
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .set({'id': currentUser.uid, 'name': name, 'email': email});
    } on FirebaseAuthException catch (error) {
      log(error.message ?? "Desconhecido");
      throw AuthException(code: error.code);
    }
  }

  Future login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw AuthException(code: 'user-not-found');
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (!userDoc.exists) {
        throw AuthException(code: 'user-not-found');
      }
    } on FirebaseAuthException catch (error) {
      log(error.message ?? "Desconhecido");
      throw AuthException(code: error.code);
    }
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      log(error.message ?? "Desconhecido");
      throw AuthException(code: error.code);
    }
  }
}

class AuthException implements Exception {
  final String code;
  AuthException({required this.code});

  String getMessage() {
    switch (code) {
      case 'email-already-in-use':
        return 'E-mail já cadastrado';
      case 'invalid-email':
        return 'E-mail inválido';
      case 'weak-password':
        return 'Senha muito fraca, precisa de no mínimo 6 caracteres';
      case 'operation-not-allowed':
        return 'Operação não permitida';
      case 'user-not-found':
        return 'Usuário não encontrado';

      case 'wrong-password' ||
          'invalid-credential' ||
          'user-disabled' ||
          'invalid-email':
        return "E-mail ou senha incorretos";
      default:
        return 'Erro desconhecido';
    }
  }
}
