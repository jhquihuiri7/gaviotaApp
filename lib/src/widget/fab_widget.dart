import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:gaviota_app/src/providers/daily_provider.dart';
import 'package:gaviota_app/src/variables/styles.dart';
import 'package:gaviota_app/src/widget/text_widget.dart';
import 'package:provider/provider.dart';

FabCircularMenu FabWidget(BuildContext context ){
  final dailyProvider =  Provider.of<DailyProvider>(context, listen: false);
  return FabCircularMenu(
      fabChild: Icon(Icons.question_mark, color: Colors.white,),
      ringWidth: 100,
      ringDiameter: 400,
      children: [
        TextWidget(style: fabText, text: "AM) ${dailyProvider.conteo[0]}/38",),
        TextWidget(style: fabText, text: "PM) ${dailyProvider.conteo[1]}/38",),
      ]
  );
}