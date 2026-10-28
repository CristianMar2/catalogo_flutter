import 'package:flutter/material.dart';
import 'produto.dart';
import 'tela_cadastro_produto.dart';

class TelaListaProdutos extends StatefulWidget {
  const TelaListaProdutos({super.key});

  @override
  State<TelaListaProdutos> createState() => _TelaListaProdutosState();
}

class _TelaListaProdutosState extends State<TelaListaProdutos> {
  List<Produto> produtos = Produto.gerarProdutos();

  Future<void> _adicionarProduto() async {
    final novoProduto = await Navigator.push<Produto>(
      context,
      MaterialPageRoute(builder: (context) => const TelaCadastroProduto()),
    );

    if (novoProduto != null) {
      setState(() {
        produtos.add(novoProduto);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Produtos"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return CartaoProdutoPersonalizado(produto: produto);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CartaoProdutoPersonalizado extends StatelessWidget {
  final Produto produto;

  const CartaoProdutoPersonalizado({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(produto.icone, size: 40, color: Colors.blue),
        title: Text(produto.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Preço: R\$ ${produto.preco.toStringAsFixed(2)}"),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${produto.nome} foi adicionado ao carrinho!")),
            );
          },
          child: const Text("Comprar"),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${produto.nome} foi adicionado ao carrinho!")),
          );
        },
      ),
    );
  }
}