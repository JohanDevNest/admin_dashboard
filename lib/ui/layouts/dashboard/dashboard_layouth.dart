import 'package:flutter/material.dart';

class DashboardLayouth extends StatelessWidget {
  const DashboardLayouth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dashboard', style: TextStyle(fontSize: 50),
            ),
            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}