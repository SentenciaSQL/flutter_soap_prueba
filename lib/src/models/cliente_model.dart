import 'dart:convert';

import 'package:soap_test/src/models/mensaje_model.dart';
import 'package:soap_test/src/models/transaccion_model.dart';

ClienteResponse clienteResponseFromJson(String str) => ClienteResponse.fromJson(json.decode(str));

String clienteResponseToJson(ClienteResponse data) => json.encode(data.toJson());

class ClienteResponse {
    ClienteResponse({
        this.cliente,
        required this.mensaje,
        required this.transaccion,
    });

    Cliente? cliente;
    Mensaje mensaje;
    Transaccion transaccion;

    factory ClienteResponse.fromJson(Map<String, dynamic> json) => ClienteResponse(
        cliente: json["cliente"] != null ? Cliente.fromJson(json["cliente"]) : json["cliente"],
        mensaje: Mensaje.fromJson(json["mensaje"]),
        transaccion: Transaccion.fromJson(json["transaccion"]),
    );

    Map<String, dynamic> toJson() => {
        "cliente": cliente,
        "mensaje": mensaje.toJson(),
        "transaccion": transaccion.toJson(),
    };
}

class Cliente {
    Cliente({
        this.apellidos = "",
        this.cedula = "",
        this.codcli = "",
        this.departamento = "",
        this.direccion = "",
        this.duplicador = "",
        this.localidad = "",
        this.municipio = "",
        this.nombre = "",
        this.nombreFinca = "",
        this.provincia = "",
        this.puerta = "",
        this.tarifa = "",
    });

    String apellidos;
    String cedula;
    String codcli;
    String departamento;
    String direccion;
    String duplicador;
    String localidad;
    String municipio;
    String nombre;
    String nombreFinca;
    String provincia;
    String puerta;
    String tarifa;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        apellidos: json["apellidos"],
        cedula: json["cedula"],
        codcli: json["codcli"],
        departamento: json["departamento"],
        direccion: json["direccion"],
        duplicador: json["duplicador"],
        localidad: json["localidad"],
        municipio: json["municipio"],
        nombre: json["nombre"],
        nombreFinca: json["nombre_finca"],
        provincia: json["provincia"],
        puerta: json["puerta"],
        tarifa: json["tarifa"],
    );

    Map<String, dynamic> toJson() => {
        "apellidos": apellidos,
        "cedula": cedula,
        "codcli": codcli,
        "departamento": departamento,
        "direccion": direccion,
        "duplicador": duplicador,
        "localidad": localidad,
        "municipio": municipio,
        "nombre": nombre,
        "nombre_finca": nombreFinca,
        "provincia": provincia,
        "puerta": puerta,
        "tarifa": tarifa,
    };
}