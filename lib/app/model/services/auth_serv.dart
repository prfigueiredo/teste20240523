import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:teste_flutter/app/presenter/ui_controller.dart';

class AuthServ {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UiController _uiController = UiController();

  signupUser(
      {
        required String name,
        required String email,
        required String pass
      }) async {
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: pass,
    );
        await userCredential.user!.updateDisplayName(name);
  }

  Future<String?> signinUser({required String email, required String pass })async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass
      );
      print('Tudo sus@@@!!');
      return null;
    } on FirebaseAuthException catch (e) {
      print('Err000!!');
      return e.message;
    }
  }

  Future<String?> forgotPass(BuildContext context,{required String email})async{
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      _uiController.snackRessetpassSuccess(context);
      print('Email enviado!!!');
      return null;
    } on FirebaseAuthException catch (e) {
      _uiController.goToResetpass(context);
      print('Erro ao enviar senha!!');
      return e.message;
    }
  }
}
