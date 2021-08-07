import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soap_test/src/controllers/cliente_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clienteController = Get.put(ClienteController());

    final style = TextStyle(fontSize: 16);

    return Scaffold(
        appBar: AppBar(
          title: Text('SOAP prueba API EDENORTE'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () => clienteController.getCliente(
                      '8890007', '1', 'prueba', 'prueba123', '128'),
                  icon: Icon(Icons.verified_user),
                  label: Text('Disparar getConsultaCliente')
              ),
              SizedBox(height: 30),
              _data(clienteController, style)
            ],
          ),
        ));
  }

  Expanded _data(ClienteController clienteController, TextStyle style) {
    return Expanded(
      child: Obx(() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (clienteController.codigo.value == 'M01') ...[
              Text('Cliente:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Apellidos: ${clienteController.cliente.apellidos}', style: style),
              Text('Nombres: ${clienteController.cliente.nombre}', style: style),
              Text('Cédula: ${clienteController.cliente.cedula}', style: style),
              Text('Cod. cliente: ${clienteController.cliente.codcli}', style: style),
              Text('Dirección: ${clienteController.cliente.direccion}', style: style),
              Text('Localidad: ${clienteController.cliente.localidad}', style: style),
              Text('Duplicador: ${clienteController.cliente.duplicador}', style: style),
              Text('Departamento: ${clienteController.cliente.departamento}', style: style),
              Text('Provincia: ${clienteController.cliente.provincia}', style: style),
              Text('Municipio: ${clienteController.cliente.municipio}', style: style),
              Text('Puerta: ${clienteController.cliente.puerta}', style: style),
              Text('Tarifa: ${clienteController.cliente.tarifa}', style: style),
              Text('Nombre finca: ${clienteController.cliente.nombreFinca}', style: style),
            ],
            if (clienteController.codigo.value != '') ...[
              SizedBox(height: 10),
              Text('Mensaje:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Codigo: ${clienteController.codigo.value}', style: style),
              Text('Descripción: ${clienteController.descripcion.value}', style: style),
              Text('Error: ${clienteController.error.value}', style: style),
              
              SizedBox(height: 10),
              Text('Transacción:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Caja id: ${clienteController.cajaid.value}', style: style),
              Text('Transacción id: ${clienteController.transaccionid.value}', style: style),
              Text('Usuario id: ${clienteController.usuarioid.value}', style: style),
            ]
            
          ],
        ),
      )),
    );
  }
}
