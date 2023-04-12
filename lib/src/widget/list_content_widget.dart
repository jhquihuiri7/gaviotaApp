import 'package:flutter/material.dart';
import 'package:gaviota_app/src/models/daily_model.dart';
import 'package:gaviota_app/src/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../providers/daily_provider.dart';
import '../requests/dailyReserves.dart';
import '../requests/reserves.dart';
import '../variables/styles.dart';
import 'container_width_widget.dart';

class ListContentWidget extends StatefulWidget {
  final String ship;

  const ListContentWidget({Key? key, required this.ship}) : super(key: key);

  @override
  State<ListContentWidget> createState() => _ListContentWidgetState();
}

class _ListContentWidgetState extends State<ListContentWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final dailyProvider = Provider.of<DailyProvider>(context, listen: false);
    return FutureBuilder<List<DailyModel>>(
        future: DailyReserves().Daily(
            DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0), widget.ship),
        builder: (ctx, s) {
          List<Widget> dataWidget = [];
          if (s.hasData) {
            (widget.ship == "gaviota") ? dailyProvider.GetModels = s.data!: dailyProvider.GetModelsOther = s.data!;
            dailyProvider.conteo = [0,0];
            s.data?.forEach((element) {
              if (element.time == dailyProvider.GetTimeString) {
                Widget temp = Dismissible(
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  key: Key(element.id),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (!element.isConfirmed)
                          ? const Color(0xffff4d4d)
                          : Colors.white.withOpacity(0),
                    ),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerWidthWidget(
                            rateScreen: 0.15,
                            child: TextWidget(
                                style: bodyText, text: element.user)),
                        ContainerWidthWidget(
                            rateScreen: 0.20,
                            child: TextWidget(
                                style: bodyText, text: element.reference)),
                        ContainerWidthWidget(
                            rateScreen: 0.10,
                            child: TextWidget(
                                style: bodyText, text: element.route)),
                        ContainerWidthWidget(
                            rateScreen: 0.05,
                            child: TextWidget(
                                style: bodyText,
                                text: element.price.toString())),
                        ContainerWidthWidget(
                            rateScreen: 0.25,
                            child: TextWidget(
                                style: bodyText, text: element.passenger)),
                        ContainerWidthWidget(
                            rateScreen: 0.05,
                            child: TextWidget(
                                style: bodyText, text: element.age.toString())),
                        ContainerWidthWidget(
                            rateScreen: 0.20,
                            child: TextWidget(
                                style: bodyText, text: element.notes)),
                      ],
                    ),
                  ),
                  onDismissed: (direccion) async {
                    String resp = await Reserves().DeleteReserve(element.id);
                    dailyProvider.RemoveModel = element;
                  },
                );
                dataWidget.add(temp);
              }
            });
            return Expanded(
              child: ListView(
                children: dataWidget,
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
