class Transaccion {
    Transaccion({
       required this.cajaid,
       required this.loteid,
       required this.transaccionid,
       required this.usuarioid,
    });

    String cajaid;
    String loteid;
    String transaccionid;
    String usuarioid;

    factory Transaccion.fromJson(Map<String, dynamic> json) => Transaccion(
        cajaid: json["cajaid"],
        loteid: json["loteid"],
        transaccionid: json["transaccionid"],
        usuarioid: json["usuarioid"],
    );

    Map<String, dynamic> toJson() => {
        "cajaid": cajaid,
        "loteid": loteid,
        "transaccionid": transaccionid,
        "usuarioid": usuarioid,
    };
}