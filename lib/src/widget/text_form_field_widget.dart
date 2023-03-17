import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final double size;

  TextFormFieldWidget({required this.label, required this.size});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: _size.width * size - 25,
      height: 33,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          label: Text(label),
        ),
      ),
    );
  }
}
