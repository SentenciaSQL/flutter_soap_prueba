class Mensaje {
    Mensaje({
      required this.codigo,
      required this.descripcion,
      required this.error,
    });

    String codigo;
    String descripcion;
    String error;

    factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "descripcion": descripcion,
        "error": error,
    };
}