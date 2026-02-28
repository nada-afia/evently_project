import 'package:evently_app/auth/login/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class RegisterViewModel extends ChangeNotifier{
   //todo: hold data - handle logic
   late RegisterNavigator navigator;
  Future<void> register(String email, String password) async {
    navigator.showMyLoading(message: 'Waiting...');
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigator.hideMyLoading();
      navigator.showMyMessage(message: 'Register successfully');
    }

    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator.hideMyLoading();
        navigator.showMyMessage(message:'The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        navigator.hideMyLoading();
        navigator.showMyMessage(message:'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }
}