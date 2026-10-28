import 'package:flutter/material.dart';
import 'produto.dart';

class TelaCadastroProduto extends StatefulWidget {
  const TelaCadastroProduto({super.key});

  @override
  State<TelaCadastroProduto> createState() => _TelaCadastroProdutoState();
}

class _TelaCadastroProdutoState extends State<TelaCadastroProduto> {
  final _controladorNome = TextEditingController();
  final _controladorPreco = TextEditingController();
  
  IconData _iconeSelecionado = Icons.shopping_bag;

  @override
  void dispose() {
    _controladorNome.dispose();
    _controladorPreco.dispose();
    super.dispose();
  }

  void _salvarProduto() {
    final nome = _controladorNome.text.trim();
    final textoPreco = _controladorPreco.text.trim().replaceAll(',', '.');

    if (nome.isEmpty || textoPreco.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos")),
      );
      return;
    }

    final precoConvertido = double.tryParse(textoPreco);
    if (precoConvertido == null || precoConvertido <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preço inválido")),
      );
      return;
    }

    final produto = Produto(
      nome: nome,
      preco: precoConvertido,
      icone: _iconeSelecionado,
    );
    
    Navigator.pop(context, produto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Produto"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controladorNome,
              decoration: const InputDecoration(
                labelText: "Nome do produto", 
              ),
            ),
            TextField(
              controller: _controladorPreco,
              keyboardType: const TextInputType.numberWithOptions(decimal: true), // Define o tipo de teclado como numérico com opção para decimais[cite: 10]
              decoration: const InputDecoration(
                labelText: "Preço (ex: 1234.56)",
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<IconData>(
              value: _iconeSelecionado,
              items: const [
                DropdownMenuItem(value: Icons.shopping_bag, child: Text("Sacola")),
                DropdownMenuItem(value: Icons.phone_iphone, child: Text("Smartphone")),
                DropdownMenuItem(value: Icons.laptop_mac, child: Text("Notebook")),
                DropdownMenuItem(value: Icons.watch, child: Text("Relógio")),
              ],
              onChanged: (value) {
                setState(() {
                  _iconeSelecionado = value ?? Icons.shopping_bag;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _salvarProduto, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Salvar", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}