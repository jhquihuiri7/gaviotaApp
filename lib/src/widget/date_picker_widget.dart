import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gaviota_app/src/models/daily_model.dart';
import 'package:gaviota_app/src/providers/daily_provider.dart';
import 'package:gaviota_app/src/requests/dailyReserves.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePickerWidget extends StatelessWidget {
  final String ship;

  DatePickerWidget({required this.ship});

  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    final dailyProvider = Provider.of<DailyProvider>(context);
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (_) => Container(
              height: size.height,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.85,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (DateTime value) {
                        date = value;
                        print(value);
                      },
                      initialDateTime: DateTime.now(),
                      minimumYear: 2022,
                      maximumYear: 2025,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () async {
                      dailyProvider.LoadingData = true;
                      final format = DateFormat('yyyy-MM-dd');
                      dailyProvider.Date =
                          format.format(date).replaceAll("/", "-");
                      Navigator.of(context).pop();
                      List<DailyModel> response =
                          await DailyReserves().Daily(date, ship);
                      dailyProvider.GetModels = response;
                      dailyProvider.LoadingData = false;
                    },
                  )
                ],
              ),
            ),
          );
        },
        child: Text(dailyProvider.Date));
  }
}
