import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final double width;
  final String hint;
  final String label;

  InputTextFieldWidget({required this.width, required this.hint, required this.label});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 40,
      width: size.width * this.width,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: this.hint,
          labelText: this.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}
