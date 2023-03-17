import 'package:flutter/material.dart';
import 'package:gaviota_app/src/providers/daily_provider.dart';
import 'package:gaviota_app/src/requests/dailyReserves.dart';
import 'package:gaviota_app/src/variables/styles.dart';
import 'package:gaviota_app/src/widget/header_widget.dart';
import 'package:gaviota_app/src/widget/text_widget.dart';
import 'package:gaviota_app/src/widget/container_width_widget.dart';
import 'package:gaviota_app/src/widget/date_picker_widget.dart';
import 'package:gaviota_app/src/requests/reserves.dart';
import 'package:provider/provider.dart';

class PageThree extends StatefulWidget {
  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final List<String> list = <String>['AM', 'PM'];

  @override
  initState() {
    final dailyProvider = Provider.of<DailyProvider>(context, listen: false);
    _asyncMethod(dailyProvider);
    //CHANGE
    print(dailyProvider.GetModelsOther);
    print(dailyProvider.GetModelsOther.length);
    super.initState();
  }

  _asyncMethod(DailyProvider dailyProvider) async {
    DateTime now = DateTime.now();
    await DailyReserves()
        .Daily(DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0), "other")
        .then((data) => dailyProvider.GetModelsOther = data);
    dailyProvider.LoadingData = false;
  }

  @override
  Widget build(BuildContext context) {
    final dailyProvider = Provider.of<DailyProvider>(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SafeArea(
        child: Column(children: [
          HeaderWidget(ship: "Otras Lanchas"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DatePickerWidget(ship: "other"),
              DropdownButton<String>(
                value: (dailyProvider.GetTime) ? list[0] : list[1],
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                borderRadius: BorderRadius.circular(20),
                onChanged: (String? value) {
                  dailyProvider.GetTime = !dailyProvider.GetTime;
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextWidget(
                  text: "${dailyProvider.CountTime(dailyProvider, "other")}/38",
                  style: subtitleText),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerWidthWidget(
                  rateScreen: 0.15,
                  child: TextWidget(style: headersText, text: "Usuario")),
              ContainerWidthWidget(
                  rateScreen: 0.20,
                  child: TextWidget(style: headersText, text: "Proveedor")),
              ContainerWidthWidget(
                  rateScreen: 0.10,
                  child: TextWidget(style: headersText, text: "Ruta")),
              ContainerWidthWidget(
                  rateScreen: 0.05,
                  child: TextWidget(style: headersText, text: "Hora")),
              ContainerWidthWidget(
                  rateScreen: 0.05,
                  child: TextWidget(style: headersText, text: "Valor")),
              ContainerWidthWidget(
                  rateScreen: 0.25,
                  child: TextWidget(style: headersText, text: "Referencia")),
              ContainerWidthWidget(
                  rateScreen: 0.20,
                  child: TextWidget(style: headersText, text: "Notas")),
            ],
          ),
          Expanded(
              child: (dailyProvider.LoadingData)
                  ? Center(
                      child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator()))
                  : ListView.builder(
                      itemCount: dailyProvider.GetModelsOther.length,
                      itemBuilder: (ctx, i) {
                        if (dailyProvider.GetModelsOther[i].time ==
                            (dailyProvider.GetTimeString)) {
                          return Dismissible(
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            key: Key(dailyProvider.GetModelsOther[i].id),
                            child: Container(
                              decoration: BoxDecoration(
                                color: (!dailyProvider
                                        .GetModelsOther[i].isConfirmed)
                                    ? const Color(0xffff4d4d)
                                    : Colors.white.withOpacity(0),
                              ),
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContainerWidthWidget(
                                      rateScreen: 0.15,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].user)),
                                  ContainerWidthWidget(
                                      rateScreen: 0.20,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].reference)),
                                  ContainerWidthWidget(
                                      rateScreen: 0.10,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].route)),
                                  ContainerWidthWidget(
                                      rateScreen: 0.05,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].time)),
                                  ContainerWidthWidget(
                                      rateScreen: 0.05,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].price
                                              .toString())),
                                  ContainerWidthWidget(
                                      rateScreen: 0.25,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].passenger)),
                                  ContainerWidthWidget(
                                      rateScreen: 0.20,
                                      child: TextWidget(
                                          style: bodyText,
                                          text: dailyProvider
                                              .GetModelsOther[i].notes)),
                                ],
                              ),
                            ),
                            onDismissed: (direccion) async {
                              String resp = await Reserves().DeleteReserve(
                                  dailyProvider.GetModelsOther[i].id);
                              print(resp);
                              dailyProvider.RemoveModelOther =
                                  dailyProvider.GetModelsOther[i];
                            },
                          );
                        } else {
                          return Container();
                        }
                      }))
        ]),
      ),
    );
  }
}
