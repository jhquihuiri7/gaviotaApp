import 'package:flutter/material.dart';
import 'package:gaviota_app/src/widget/subform_widget.dart';
import 'package:gaviota_app/src/widget/appbar_widget.dart';

class AddReservePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context, ship: "reservas"),
      drawer: DrawerWidget(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SubformWidget(),
                    SubformWidget(),
                    ElevatedButton(onPressed: (){}, child: SizedBox(height: 30, width: 100,child: Center(child: Text("Agregar reserva"))))
                  ],
                )
            )
          ]
        ),
      )
    );
  }
}
