import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => RegisterFormProvider(),
      child: Builder(builder: (context){
        
        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 20),
          //color: Colors.red,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    //Name
                    TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty) return 'Debe ingresar el nombre';
                      return null;
                    },
                    onChanged: (value) => registerFormProvider.name = value,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su nombre',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_outlined,
                    ),
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                    validator: (value){
                      
                      if(!EmailValidator.validate(value ?? '')) return 'Email invalido';
                      return null;
                    },
                    onChanged: (value) => registerFormProvider.email = value,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su correo',
                      label: 'Correo',
                      icon: Icons.mail,
                    ),
                    ),
                    
                    SizedBox(height: 20,),

                    //Password
                    TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty) return 'Debe ingresar una contrasena';
                      if(value.length < 6 ) return 'La contrasena debe ser de 6 caracteres o mas';
                      return null;
                    },
                    onChanged: (value) => registerFormProvider.password = value,
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

                        registerFormProvider.validateForm();
                      }, 
                      text: 'Crear cuenta',
                    
                    ),


                    SizedBox(height: 20,),
                    LinkText(
                      text: 'Ir al login',
                      onPressed: (){
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
                      },
                    )

                ],
              ),
              ),
            )
            
          ),
        );
      })
    );
  }

  
}