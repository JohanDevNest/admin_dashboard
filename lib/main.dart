import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layouth.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{

  
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        lazy: false,
        create: (_) => AuthProvider()
      ),
    ],
    child: MyApp(),
    
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationServices.navigatorKey,
      builder: ( _ , child){
        
        
        final authProvider = Provider.of<AuthProvider>(context);
        print(authProvider.authStatus);
        if( authProvider.authStatus == AuthStatus.checking){
          return SplashLayout();
        }
          

        if( authProvider.authStatus == AuthStatus.authenticated){
          return DashboardLayouth(child: child!);
        }else{
          return AuthLayout(child: child!);
        }        
        // print('token');
        // print(LocalStorage.prefs.getString('token'));
        //return DashboardLayouth(child: child!,);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: WidgetStateProperty.all(
            Colors.grey.withOpacity(0.3)
          )
        )
      ),
    );
  }
}