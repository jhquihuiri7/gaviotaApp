import 'package:flutter/material.dart';
import 'package:gaviota_app/src/variables/styles.dart';
import 'package:gaviota_app/src/widget/appbar_widget.dart';
import 'package:gaviota_app/src/widget/input_text_field_widget.dart';
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
                    Container(
                      height: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Encabezado
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Formulario Nro. 1", style: subtitleText,),
                              Row(children:[
                                ElevatedButton(onPressed: (){}, child: Container(child: Icon(Icons.add))),
                                SizedBox(width: 10),
                                ElevatedButton(onPressed: (){}, child: Container(child: Icon(Icons.remove)))
                              ])
                            ]
                          ),
                          //TextFields
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputTextFieldWidget(width: 0.2, hint:"", label: "Fecha"),
                              InputTextFieldWidget(width: 0.3, hint:"", label: "Ruta"),
                              InputTextFieldWidget(width: 0.1, hint:"", label: "Horario"),
                              InputTextFieldWidget(width: 0.1, hint:"", label: "N° Pasajeros"),
                              InputTextFieldWidget(width: 0.2, hint:"Seleccione el proveedor", label: "Proveedor"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputTextFieldWidget(width: 0.2, hint: "Seleccionar lancha", label: "Lancha"),
                              InputTextFieldWidget(width: 0.1, hint: "", label: "Precio"),
                              InputTextFieldWidget(width: 0.2, hint: "Nombre", label: "Nombre"),
                              InputTextFieldWidget(width: 0.2, hint: "Número de teléfono", label: "Número de teléfono"),
                              InputTextFieldWidget(width: 0.2, hint: "Selecionar país", label: "País"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputTextFieldWidget(width: 0.2, hint:"", label:"Fecha de nacimiento"),
                              InputTextFieldWidget(width: 0.2, hint:"Cédula/pasaporte", label:"Cédula/pasaporte"),
                              InputTextFieldWidget(width: 0.3, hint:"", label:"Estado"),
                              InputTextFieldWidget(width: 0.2, hint:"Observaciones", label:"Observaciones"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputTextFieldWidget(width: 0.4, hint:"Notas", label:"Notas"),
                              InputTextFieldWidget(width: 0.2, hint:"", label:"Tipo de pago"),
                            ],
                          )
                        ]
                      ),
                    ),
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
