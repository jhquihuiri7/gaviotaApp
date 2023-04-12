import 'package:flutter/material.dart';
import 'package:gaviota_app/src/widget/appbar_widget.dart';
import 'package:gaviota_app/src/widget/fab_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../providers/daily_provider.dart';
import '../variables/styles.dart';
import '../widget/date_picker_widget.dart';
import '../widget/dropdown_widget.dart';
import '../widget/header_widget.dart';
import '../widget/list_content_widget.dart';
import '../widget/text_widget.dart';
import '../widget/daily_title_widget.dart';

class DailyOtherPage extends StatelessWidget {
  const DailyOtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBarWidget(context, ship: "Otras Lanchas"),
      floatingActionButton: FabWidget(context),
      drawer: DrawerWidget(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DatePickerWidget(ship: "other",),
                    DropdownWidget(),
                  ],
                ),
                SizedBox(height: 5,),
                DailyTitleWidget(),
                Container(color: Theme
                    .of(context)
                    .primaryColor, height: 1.5, width: double.infinity,),
                ListContentWidget(ship:'other'),
              ]
          ),
        ),
      ),
    );
  }
}


