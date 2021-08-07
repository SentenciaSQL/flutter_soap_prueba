import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:soap_test/src/models/cliente_model.dart';
import 'package:http/http.dart' as http;
import 'package:soap_test/src/models/mensaje_model.dart';
import 'package:soap_test/src/models/transaccion_model.dart';
import 'package:soap_test/src/values/const.dart';
import 'package:soap_test/src/values/enviroment.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';

class ClienteController extends GetxController{

  Rx<Cliente> _cliente = new Cliente().obs;
  late Mensaje _mensaje;
  late Transaccion _transaccion;

  var codigo = ''.obs;
  var descripcion = ''.obs;
  var error = ''.obs;

  var cajaid = ''.obs;
  var transaccionid = ''.obs;
  var usuarioid = ''.obs;
  
  Cliente get cliente => _cliente.value;

  final Xml2Json xml2json = new Xml2Json();
  final _uri = Uri.parse(Envireoment.WEB_SERVICE_URL);

  Future<void> getCliente(String referencia, String tipoReferencia, String usuarioid, String clave, String cajaid) async {

    EasyLoading.show(status: 'Cargando...');

    final _body = Const.getConsultaCliente(referencia, tipoReferencia, usuarioid, clave, cajaid);

    final resp = await http.post(_uri,
      headers: {
        'Content-Type' : 'text/xml;charset=utf-8',
        'SOAPAction' : '${Envireoment.SOAP_ACTION}/getConsultaCliente'
      },
      body: _body
    );

    if(resp.statusCode == 200) {
      final responseBody = resp.body;
      var raw = xml.XmlDocument.parse(responseBody);
      var elements = raw.findAllElements("return");

      String xmlElements = elements.toString().replaceAll("(<", "<").replaceAll(">)", ">");

      xml2json.parse(xmlElements);
      var jsonString = xml2json.toParker();
      var data = jsonDecode(jsonString);

      ClienteResponse res = ClienteResponse.fromJson(data['return']);

      _mensaje = res.mensaje;
      this.codigo.value = _mensaje.codigo;
      this.descripcion.value = _mensaje.descripcion;
      this.error.value = _mensaje.error;

      _transaccion = res.transaccion;
      this.cajaid.value = _transaccion.cajaid;
      this.transaccionid.value = _transaccion.transaccionid;
      this.usuarioid.value = _transaccion.usuarioid;

      if (res.mensaje.codigo == 'M01') {
        _cliente.value = res.cliente!;
      }

      EasyLoading.dismiss();

    } else {
      log('Error: no se pudo concectar al ws');
    }
  }

}