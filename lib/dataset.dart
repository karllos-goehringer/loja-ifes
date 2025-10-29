import 'dart:convert';

class Produto {
  int id;
  String nome;
  String desc;
  double valor;
  int qtd;
  int qtdSelecionada; 

  Produto({
    required this.id,
    required this.nome,
    required this.desc,
    required this.valor,
    required this.qtd,
    this.qtdSelecionada = 1,
  });

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] as int,
      nome: map['nome'] as String,
      desc: map['desc'] as String,
      valor: map['valor'] as double,
      qtd: map['qtd'] as int,
      qtdSelecionada: map['qtdSelecionada'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'desc': desc,
      'valor': valor,
      'qtd': qtd,
      'qtdSelecionada': qtdSelecionada,
    };
  }

  factory Produto.fromJson(String source) =>
      Produto.fromMap(jsonDecode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  Produto copyWith({
    int? id,
    String? nome,
    String? desc,
    double? valor,
    int? qtd,
    int? qtdSelecionada,
  }) {
    return Produto(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      desc: desc ?? this.desc,
      valor: valor ?? this.valor,
      qtd: qtd ?? this.qtd,
      qtdSelecionada: qtdSelecionada ?? this.qtdSelecionada,
    );
  }

  @override
  String toString() {
    return 'Produto(id: $id, nome: $nome, desc: $desc, valor: $valor, qtd: $qtd, qtdSelecionada: $qtdSelecionada)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Produto &&
            other.id == id &&
            other.nome == nome &&
            other.desc == desc &&
            other.valor == valor &&
            other.qtd == qtd &&
            other.qtdSelecionada == qtdSelecionada);
  }

  @override
  int get hashCode => Object.hash(id, nome, desc, valor, qtd, qtdSelecionada);
}
