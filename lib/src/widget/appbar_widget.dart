import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaviota_app/src/shared_preferences/shared_preferences.dart';
import 'package:gaviota_app/src/variables/styles.dart';
import 'package:gaviota_app/src/widget/header_widget.dart';


PreferredSizeWidget AppBarWidget(BuildContext context, {required String ship} ){
  return AppBar(
    title: HeaderWidget(ship: ship,),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
  );
}
Widget DrawerWidget(BuildContext context ){
  return Container(
    color: Colors.white,
    width: 150,
    child: Column(
      children: [
        SizedBox(height:40),
        CircleAvatar(
            child: Image(image: AssetImage("assets/icon/icon-min.png"))
        ),
        Text(LocalStorage.prefs.getString('user')!.toUpperCase(), style: iconText,),
        ListTile(
          leading: Icon(Icons.safety_divider_rounded, color: Theme.of(context).primaryColor, size: 35,),
          title: Text("Nueva reserva"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "dailyGaviota");
          },
        ),
        ListTile(
          leading: Icon(Icons.sailing_sharp, color: Theme.of(context).primaryColor, size: 35,),
          title: Text("Gaviota"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "dailyGaviota");
          },
        ),
        ListTile(
          leading: Icon(Icons.scatter_plot_sharp, color: Theme.of(context).primaryColor,size: 35,),
          title: Text("Otras lanchas"),
          onTap: () {
            Navigator.pushReplacementNamed(context, "dailyOther");
          },
        ),
      ],
    ),
  );
}