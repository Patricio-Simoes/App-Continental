class AvariaNotification{
  int id;
  String funcionarioId;
  int linhaID;
  String tipo;
  String prioridade;
  bool estado;
  String criacao;

  AvariaNotification({
    required this.id,
    required this.funcionarioId,
    required this.linhaID,
    required this.tipo,
    required this.prioridade,
    required this.estado,
    required this.criacao,
  });

  static AvariaNotification fromJson(Map<String, dynamic> json) {
    return AvariaNotification(
      id: json['id'] ?? 0, // Provide a default value when the id is null
      funcionarioId: json['funcionarioId'],
      linhaID: json['linhaId'] ?? 0, // Provide a default value when the linhaID is null
      tipo: json['tipo'],
      prioridade: json['prioridade'],
      estado: json['estado'],
      criacao: json['criacao'],
    );
  }
}