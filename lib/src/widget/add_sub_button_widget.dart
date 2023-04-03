import 'package:flutter/material.dart';
class AddSubButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  AddSubButtonWidget({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        child: Container(child: Icon(icon)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
    );
  }
}
