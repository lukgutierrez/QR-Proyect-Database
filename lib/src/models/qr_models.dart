class ModelQr {
  ModelQr({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (tipo.contains("http")) {
      tipo = "http";
    } else {
      tipo = "Geo";
    }
  }

  int id;
  String tipo;
  String valor;

  factory ModelQr.fromJson(Map<String, dynamic> json) => ModelQr(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
