import 'package:flutter/material.dart';
import 'tela_lista_produtos.dart';

void main() {
  runApp(const AplicativoCatalogo());
}

class AplicativoCatalogo extends StatelessWidget {
  const AplicativoCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaListaProdutos(),
    );
  }
}