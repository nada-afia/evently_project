import 'package:evently_app/auth/login/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{
  final TextEditingController emailController = TextEditingController(text: 'nadamoafia123@gmail.com');
  final TextEditingController passController = TextEditingController(text: 'Nada@1234');
  late LoginNavigator navigator;
  final formKey=GlobalKey<FormState>();
  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      navigator.showMyLoading(message: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passController.text

        );
        navigator.hideMyLoading();
        navigator.showMyMessage(message: 'Login successfully');
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          navigator.hideMyLoading();
          navigator.showMyMessage(
              message: 'The supplied auth credential is incorrect, malformed or has expired.');
        }
      }
      catch (e) {
        navigator.hideMyLoading();
        navigator.showMyMessage(message: e.toString());
      }
    }
  }
}