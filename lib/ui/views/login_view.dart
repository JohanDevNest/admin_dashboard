import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                decoration: buildInputDecoration(
                  hint: 'Ingrese su email',
                  label: 'Email',
                  icon: Icons.email_outlined,
                 ),
                ),
                
                SizedBox(height: 20,),

                //Password
                TextFormField(
                //validator: ,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                  hint: 'Ingrese su contrasena',
                  label: 'Password',
                  icon: Icons.lock_outline_rounded,
                 ),
                ),
                
                SizedBox(height: 20,),
                CustomOutlinedButton(
                  onPressed: (){}, 
                  text: 'Ingresar'
                ),


                SizedBox(height: 20,),
                LinkText(
                  text: 'Nueva cuenta',
                  onPressed: (){
                    //TODO: ir a registro
                  },
                )

              ],
            ),
            ),
          )
        
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint, 
    required String label, 
    required IconData icon,
    }){

    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey,),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),

    );
  }
}