import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});


  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: (context){

          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);
            
          return  Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            //color: Colors.red,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                      validator: ( value ){
                        if( !EmailValidator.validate(value ?? '')) return 'Email no valido';
                        return null;
                      },
                      onChanged: ( value ) => loginFormProvider.email = value,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su email',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      ),
                      
                      SizedBox(height: 20,),
          
                      //Password
                      TextFormField(
                      onChanged: ( value ) => loginFormProvider.password = value,
                      validator: ( value ){
                        if(value == null || value.isEmpty) return 'Debe ingresar texto';
                        if(value.length < 6) return 'La contrasena debe ser de 6 caracteres';
                        return null; //valido
                      } ,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su contrasena',
                        label: 'Password',
                        icon: Icons.lock_outline_rounded,
                      ),
                      ),
                      
                      SizedBox(height: 20,),
                      CustomOutlinedButton(
                        onPressed: (){
                          final isValid = loginFormProvider.validateForm();
                          if (isValid)
                            authProvider.login(loginFormProvider.email, loginFormProvider.password);
                        }, 
                        text: 'Ingresar',
                      
                      ),
          
          
                      SizedBox(height: 20,),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: (){
          
                          Navigator.pushNamed(context, Flurorouter.registerRoute);
                        },
                      )
          
                    ],
                  ),
                  ),
                )
              
            ),
          );
        }
      )
    );
  }
  
}