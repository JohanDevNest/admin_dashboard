 import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
 LinksBar({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black  ,
      height: (size.width > 1000) ? size.height*0.1 : null,
      child: Wrap(
        children: [
          LinkText( text: 'About', onPressed: (_) => print('about'),),
          LinkText( text: 'Help Center'),
          LinkText( text: 'Terms of Service'),
          LinkText( text: 'Privacy Policy'),
          LinkText( text: 'Ads Info'),
          LinkText( text: 'Blog'),
          LinkText( text: 'Status'),
          LinkText( text: 'Careers'),
          LinkText(text: 'Brand Resources'),
          LinkText(text: 'Advertising'),
          LinkText(text: 'Marketing')
        ],
      )
    );
  }
}