import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:flutter/material.dart';

enum AuthStatus{

  checking,
  authenticated,
  notAuthenticated
}


class AuthProvider extends ChangeNotifier{


  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider(){isAuthenticated();}


  login( String email, String password){
      this._token = 'kasdkahsdhasdkjashdkhasdkjashd';
      print('este es el toke JWT $_token');
      LocalStorage.prefs.setString('token', this._token!);
      authStatus = AuthStatus.authenticated;
      //isAuthenticated();
      notifyListeners();

      NavigationServices.replaceTo(Flurorouter.dashboardRoute);
     
  }

  

  Future<bool> isAuthenticated() async{
      final token = LocalStorage.prefs.getString('token');
      print('verificando token');
      if( token == null ){
        print(token);
        authStatus = AuthStatus.notAuthenticated;
        notifyListeners();
        return false;
      }

      //TODO: ir al backend y comprobar si el JWT es valido

      await Future.delayed(Duration(milliseconds: 1000));
      print(token);
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
  }

}