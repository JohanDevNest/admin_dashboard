import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{
  
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm(){
     if(formKey.currentState!.validate()){
      print('nombre: $name email: $email contrasena: $password');
     }else{
      print('crendenciales no validas');
     }
  }

}