import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaviota_app/src/widget/header_widget.dart';

PreferredSizeWidget AppBarWidget(BuildContext context ){
  return AppBar(
    title: const HeaderWidget(ship: "Gaviota",),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
  );
}
Widget DrawerWidget(BuildContext context ){
  return Container(
    color: Colors.white,
    width: 70,
    child: Column(
      children: [
        SizedBox(height:40),
        ListTile(
          leading: Icon(Icons.safety_divider_rounded, color: Theme.of(context).primaryColor, size: 35,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.sailing_sharp, color: Theme.of(context).primaryColor, size: 35,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.scatter_plot_sharp, color: Theme.of(context).primaryColor,size: 35,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}