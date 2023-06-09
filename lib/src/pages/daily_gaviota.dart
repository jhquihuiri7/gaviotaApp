import 'package:flutter/material.dart';
import 'package:gaviota_app/src/widget/appbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../providers/daily_provider.dart';
import '../variables/styles.dart';
import '../widget/date_picker_widget.dart';
import '../widget/dropdown_widget.dart';
import '../widget/fab_widget.dart';
import '../widget/header_widget.dart';
import '../widget/list_content_widget.dart';
import '../widget/text_widget.dart';
import '../widget/daily_title_widget.dart';

class DailyGaviotaPage extends StatelessWidget {
  const DailyGaviotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    final dailyProvider = Provider.of<DailyProvider>(context);
    return Scaffold(
      appBar: AppBarWidget(context,ship:"Gaviota"),
      drawer: DrawerWidget(context),
      floatingActionButton: FabWidget(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DatePickerWidget(ship: "gaviota",),
                    DropdownWidget(),
                  ],
                ),
                SizedBox(height: 5,),
                DailyTitleWidget(),
                Container(color: Theme
                    .of(context)
                    .primaryColor, height: 1.5, width: double.infinity,),
                ListContentWidget(ship: 'gaviota',),
              ]
          ),
        ),
      ),
    );
  }
}


