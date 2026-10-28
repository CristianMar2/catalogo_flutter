import 'package:flutter/material.dart';

class Produto {
  final String nome;
  final double preco;
  final IconData icone;

  Produto({
    required this.nome,
    required this.preco,
    required this.icone,
  });

  static List<Produto> gerarProdutos() {
    return [
      Produto(nome: "Notebook Gamer", preco: 5500.0, icone: Icons.laptop_mac),
      Produto(nome: "Motorola Edge 60 Neo", preco: 4500.0, icone: Icons.phone_iphone),
    ];
  }
}