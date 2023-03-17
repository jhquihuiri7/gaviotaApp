import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/daily_provider.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final List<String> list = <String>['AM', 'PM'];

  @override
  Widget build(BuildContext context) {
    final dailyProvider = Provider.of<DailyProvider>(context);

    return DropdownButton<String>(
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
    );
  }
}
