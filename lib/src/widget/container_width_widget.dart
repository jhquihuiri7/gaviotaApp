import 'package:flutter/material.dart';

class ContainerWidthWidget extends StatelessWidget {
  final double rateScreen;
  final Widget child;

  const ContainerWidthWidget(
      {super.key, required this.rateScreen, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return SizedBox(
      width: width * rateScreen - 10,
      child: child,
    );
  }
}
