import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.red,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                //Email
                TextFormField(
                //validator: ,
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su nombre',
                  label: 'Nombre',
                  icon: Icons.supervised_user_circle_outlined,
                 ),
                ),

                SizedBox(height: 20,),

                TextFormField(
                //validator: ,
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
                //validator: ,
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
                  onPressed: (){}, 
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
  }

  
}