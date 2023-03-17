import 'package:flutter/material.dart';
import 'package:gaviota_app/src/shared_preferences/shared_preferences.dart';
import 'package:gaviota_app/src/variables/styles.dart';
import 'package:gaviota_app/src/widget/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String ship;

  const HeaderWidget({required this.ship});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          style: titleText,
          text: "Información ${ship}",
        ),
        IconButton(
            onPressed: () {
              LocalStorage.prefs.remove("token");
              LocalStorage.prefs.remove("user");
              LocalStorage.prefs.remove("rol");
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: const Image(
              image: AssetImage("assets/icon/icon-min.png"),
              height: 40,
              width: 40,
            )),
      ],
    );
  }
}
