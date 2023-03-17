import 'package:flutter/material.dart';
import '../widget/container_width_widget.dart';
import '../widget/text_widget.dart';
import '../variables/styles.dart';

class DailyTitleWidget extends StatelessWidget {
  const DailyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerWidthWidget(rateScreen: 0.15,
            child: TextWidget(style: headersText, text: "Usuario")),
        ContainerWidthWidget(rateScreen: 0.20,
            child: TextWidget(style: headersText, text: "Proveedor")),
        ContainerWidthWidget(rateScreen: 0.10,
            child: TextWidget(style: headersText, text: "Ruta")),
        ContainerWidthWidget(rateScreen: 0.05,
            child: TextWidget(style: headersText, text: "Valor")),
        ContainerWidthWidget(rateScreen: 0.25,
            child: TextWidget(style: headersText, text: "Referencia")),
        ContainerWidthWidget(rateScreen: 0.05,
            child: TextWidget(style: headersText, text: "Edad")),
        ContainerWidthWidget(rateScreen: 0.20,
            child: TextWidget(style: headersText, text: "Notas")),
      ],
    );
  }
}
