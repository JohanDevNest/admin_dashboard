import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
        
            (size.width > 1000) ?
              _DesktopBody(child: child)
              //Mobile
              : _MobileBody(child: child),
            
            LinksBar()
          ],
        ),
      )
    );
  }
}


class _DesktopBody extends StatelessWidget {
  const _DesktopBody({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.95,
      child: Row(
        children: [

          //Twitter background
          Expanded(child: BackgroundTwitter()),

          //View Container 
          Container(
            height: double.infinity,//size.height*0.95,
            width: 600,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 10,),
                CustomTitle(),
                SizedBox(height: 50,),
                Expanded(child: child)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({super.key, required this.child});
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CustomTitle(),
            Container(
              width: double.infinity,
              height: 420,
              child: child,
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: BackgroundTwitter(),
            )
          ],
        ),
    );
  }
}
